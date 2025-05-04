class DateUtils {
  static String formatDate(String dateStr) {
    final date = DateTime.parse(dateStr);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String formatted =
        '${twoDigits(date.day)}/${twoDigits(date.month)}/${date.year.toString().substring(2)} às ${twoDigits(date.hour)}:${twoDigits(date.minute)}';

    return formatted;
  }

  static DateTime parseDate(String dateStr) {
    return DateTime.parse(dateStr);
  }
}
