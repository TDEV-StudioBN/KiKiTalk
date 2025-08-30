import 'package:kikitalk/features/task/domain/entities/task_entity.dart';

enum TaskRollCallStates {
  loading,
  success,
  error,
}

class TaskRollCallState {
  final List<ENTTask> tasks;
  final TaskRollCallStates state;
  TaskRollCallState({
    required this.tasks,
    required this.state,
  });
}