class UserTable {
  static const instance = UserTable._();
  const UserTable._();

  final String columnEmail = 'email';
  final String columnName = 'name';
  final String columnAvatar = 'avatar';
}