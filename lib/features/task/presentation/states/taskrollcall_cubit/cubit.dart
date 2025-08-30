import 'package:bloc/bloc.dart';
import 'package:kikitalk/core/result/failure.dart';
import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/features/task/domain/entities/task_entity.dart';
import 'package:kikitalk/features/task/domain/usecases/get_tasks_rollcall.dart';
import 'package:kikitalk/features/task/domain/usecases/rollcall.dart';
import 'package:kikitalk/features/task/presentation/states/taskrollcall_cubit/state.dart';

class TaskRollCallCubit extends Cubit<TaskRollCallState> {
  final UCETaskRollCall _rollCall;
  final UCEGetTaskRollCall _getTasks;
  TaskRollCallCubit(this._rollCall, this._getTasks)
      : super(TaskRollCallState(
      tasks: [],
      state: TaskRollCallStates.loading
  ));

  void getAll(String email) async {
    final result =  await _getTasks(email);
    result.fold(
        onSuccess: (List<ENTTask> value) {
          emit(TaskRollCallState(
              tasks: value,
              state: TaskRollCallStates.success
          ));
        },
        onFailure: (Failure error) {
          emit(TaskRollCallState(
              tasks: [],
              state: TaskRollCallStates.error
          ));
        }
    );
  }

  void rollCall(String email, String taskId) async {
    final result = await _rollCall(TaskRollCallParams(email: email, taskId: taskId));
    result.fold(
        onSuccess: (bool value) {
          if(value) {
            getAll(email);
          }
        },
        onFailure: (Failure error) {}
    );
  }
}