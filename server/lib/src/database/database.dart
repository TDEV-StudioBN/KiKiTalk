import 'dart:async';

import 'package:server/src/utils/log_util.dart';

enum ChangeType { upsert, update, delete }

class DbChange {
  final ChangeType type;
  final String table;
  final Map<String, Object?>? data;
  final String? where;
  final List<Object?>? args;

  DbChange({
    required this.type,
    required this.table,
    this.data,
    this.where,
    this.args,
  });
}

abstract class IDatabase<T> {
  late final T db;
  final String name = 'database.db';

  bool streamMode = false;
  StreamController<DbChange>? changeController;
  Stream<DbChange> get changes => changeController!.stream;

  void setEnableStream() {
    if (streamMode) return;
    streamMode = true;
    changeController?.close();
    changeController = StreamController<DbChange>.broadcast();
    logInfo('Stream mode enabled');
  }

  Future<void> init();
  Future<void> close();

  /// Upsert (insert hoặc update nếu trùng id)
  /// - [table]: tên bảng
  /// - [data]: map column -> value
  /// - [updateColumns]: danh sách cột cần update khi trùng id
  Future<void> upsert({
    required String table,
    required Map<String, Object?> data,
    List<String>? updateColumns,
  });

  /// Cập nhật dữ liệu trong bảng
  ///
  /// - [table]: Tên bảng cần update.
  /// - [data]: Map các cột và giá trị mới. Ví dụ: {'gold': 30, 'diamond': 5}
  /// - [whereClause]: Điều kiện WHERE trong SQL, ví dụ 'id = ?'.
  /// - [whereArgs]: Danh sách giá trị cho các dấu ? trong whereClause.
  ///
  /// Ví dụ sử dụng:
  /// ```dart
  /// repo.update(
  ///   table: 'skills',
  ///   data: {'gold': 30, 'diamond': 5},
  ///   whereClause: 'id = ?',
  ///   whereArgs: ['1'],
  /// );
  /// ```
  Future<void> update({
    required String table,
    required Map<String, Object?> data,
    required String whereClause,
    required List<Object?> whereArgs,
  });

  /// Xóa dữ liệu trong bảng
  ///
  /// - [table]: Tên bảng cần xóa dữ liệu.
  /// - [whereClause]: Điều kiện WHERE trong SQL, ví dụ 'id = ?'.
  /// - [whereArgs]: Danh sách giá trị cho các dấu ? trong whereClause.
  ///
  /// Ví dụ sử dụng:
  /// ```dart
  /// repo.delete(
  ///   table: 'skills',
  ///   whereClause: 'id = ?',
  ///   whereArgs: ['1'],
  /// );
  /// ```
  Future<void> delete({
    required String table,
    required String whereClause,
    required List<Object?> whereArgs,
  });

  /// Lấy 1 row duy nhất từ bảng theo điều kiện
  ///
  /// - [table]: Tên bảng cần truy vấn.
  /// - [whereClause]: Điều kiện WHERE trong SQL, ví dụ 'id = ?'.
  /// - [whereArgs]: Danh sách giá trị cho các dấu ? trong whereClause.
  ///
  /// Ví dụ sử dụng:
  /// final row = repo.selectOne(
  ///   table: 'skills',
  ///   whereClause: 'userEmail = ?',
  ///   whereArgs: ['user@example.com'],
  /// );
  ///
  Future<Map<String, Object?>?> selectOne({
    required String table,
    required String whereClause,
    required List<Object?> whereArgs,
  });

  /// Lấy nhiều row từ bảng theo điều kiện
  ///
  /// - [table]: Tên bảng cần truy vấn.
  /// - [whereClause]: Điều kiện WHERE trong SQL, ví dụ 'id = ?'.
  /// - [whereArgs]: Danh sách giá trị cho các dấu ? trong whereClause.
  ///
  /// Ví dụ sử dụng:
  /// final rows = repo.selectOne(
  ///   table: 'skills',
  ///   whereClause: 'userEmail = ?',
  ///   whereArgs: ['user@example.com'],
  /// );
  ///
  Future<List<Map<String, Object?>>> selectMany({
    required String table,
    String? whereClause,
    List<Object?>? whereArgs,
  });
}