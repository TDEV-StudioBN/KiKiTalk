import 'package:kikitalk/features/task/data/datasources/task_local.dart';
import 'package:kikitalk/features/task/domain/repositories/task_repository.dart';

class REPTaskImpl extends REPTask {
  final LDSTask _local;
  REPTaskImpl(this._local);

}