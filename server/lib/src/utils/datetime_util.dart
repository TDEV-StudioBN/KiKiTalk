abstract class DateTimeUtil {
  /// Trả về số thứ tự trong tuần `(1 = Thứ 2, ..., 7 = Chủ nhật)`
  static int getTodayWeekday() {
    return DateTime.now().weekday;
  }

  /// Trả về chuỗi tiếng Việt: `"Thứ 2", "Thứ 3", ..., "Chủ nhật"`
  static String getTodayWeekdayString() {
    const weekdays = {
      1: "Thứ 2",
      2: "Thứ 3",
      3: "Thứ 4",
      4: "Thứ 5",
      5: "Thứ 6",
      6: "Thứ 7",
      7: "Chủ nhật",
    };

    return weekdays[DateTime.now().weekday] ?? "";
  }
}
