import 'dart:math';

import 'package:server/src/entities/task.dart';
import 'package:server/src/repositories/cumulativepoint.dart';
import 'package:server/src/repositories/task.dart';
import 'package:server/src/utils/datetime_util.dart';
import 'package:server/src/utils/id_generate_util.dart';
import 'package:server/src/utils/log_util.dart';

sealed class ITaskService {
  Future<bool> claimReward(String userEmail, String taskId);
  Future<bool> rollCall(String email, String taskId);
  Future<List<TaskEntity>> getTasksRollCall(String email);
  Future<TaskEntity?> getTaskById(String id);
}

class TaskServiceImpl extends ITaskService {
  final _tasksRepository = TaskRepositoryImpl();
  final _cumulativePointRepository = CumulativeRespositoryImpl();

  @override
  Future<bool> claimReward(String userEmail, String taskId) async {
    final cumulativePoint = await _cumulativePointRepository.getOne(userEmail);
    final task = await _tasksRepository.getTaskById(taskId);
    if(task == null) {
      logError('Không tìm thấy task');
      return false;
    }
    if(task.isCompleted && !task.isRewardGiven) {
      final cumulativePointUpdated = cumulativePoint.copyWith(
        diamond: cumulativePoint.diamond + task.rewardDiamond,
        gold: cumulativePoint.gold + task.rewardGold,
      );
      final taskUpdated = task.copyWith(
        isRewardGiven: true,
      );
      await _cumulativePointRepository.update(cumulativePointUpdated);
      await _tasksRepository.updateTask(taskUpdated);
      return true;
    }
    logWarning('Đã nhận hoặc chưa hoàn thành');
    logInfo(task);
    return false;
  }

  @override
  Future<TaskEntity?> getTaskById(String id) async {
    return await _tasksRepository.getTaskById(id);
  }

  @override
  Future<bool> rollCall(String email, String taskId) async {
    final task = await _tasksRepository.getTaskById(taskId);
    if(task != null) {
      if (!task.isCompleted && !task.isRewardGiven) {
        final taskUpdated = _handlerTask(task);
        await _tasksRepository.updateTask(taskUpdated);
        final resultClaim = await claimReward(email, taskId);
        return resultClaim;
      }
    }
    return false;
  }

  @override
  Future<List<TaskEntity>> getTasksRollCall(String email) async {
    final List<TaskEntity> tasks = [];
    final result = await _tasksRepository.getTaskByKey(email, 'rollcall');

    //  Nếu chưa có -> tạo mới  ------------------------------------------------
    if(result.isEmpty) {
      final newTasks = await _createRollCallTasks(email);
      tasks.addAll(newTasks);
    }
    else {
      tasks.addAll(result);
    }

    //  Kiểm tra điểm danh -----------------------------------------------------
    final today = DateTimeUtil.getTodayWeekday();
    tasks.sort((a, b) {
      final dayA = int.tryParse(a.title.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      final dayB = int.tryParse(b.title.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

      return dayA.compareTo(dayB);
    });

    //  Nếu là thứ 2 tuần mới  -------------------------------------------------
    if(today == 1 && tasks[1].isRewardGiven) {
      await _tasksRepository.deleteByEmailAndKey(email, 'rollcall');
      tasks.clear();
      final newTasks = await _createRollCallTasks(email);
      tasks.addAll(newTasks);
    }
    //  Duyệt các ngày đã qua --------------------------------------------------
    else {
      for (var i = 0; i < 7; i++) {
        if (i + 1 < today && !tasks[i].isRewardGiven) {
          tasks[i] = tasks[i].copyWith(isRewardGiven: true);
          await _tasksRepository.updateTask(tasks[i]);
        }
      }
    }

    return tasks;
  }

  /// Create [TaskEntity] điểm danh --------------------------------------------
  Future<List<TaskEntity>> _createRollCallTasks(String email) async {
    final Random random = Random();

    final newtasks = List.generate(7, (index) {
      int gold = 5;
      int diamond = 0;
      if(index == 0) {
        gold += 10 + random.nextInt(11);
      }
      else if(index == 6) {
        gold = 0;
        diamond += 5 + random.nextInt(6);
      }
      else {
        gold += random.nextInt(11);
      }

      return TaskEntity(
        id: IDUtil.randomV4(),
        userEmail: email,
        key: 'rollcall',
        title: '${index + 1}',
        description: '',
        progress: 0,
        total: 1,
        rewardGold: gold,
        rewardDiamond: diamond,
        isRewardGiven: false,
      );
    });
    await _tasksRepository.createTasks(newtasks);
    return newtasks;
  }

  TaskEntity _handlerTask(TaskEntity task) {
    return switch(task.key) {
      'rollcall' => _handlerRollCallTask(task),
      _ => task,
    };
  }

  TaskEntity _handlerRollCallTask(TaskEntity task) {
    final today = DateTimeUtil.getTodayWeekday();
    final taskDay = int.tryParse(task.title.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    if(taskDay == today && !task.isRewardGiven && task.progress < task.total) {
      return task.copyWith(progress: task.progress + 2);
    }
    return task;
  }
}