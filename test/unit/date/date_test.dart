import 'package:flutter_test/flutter_test.dart';
import 'package:social_destiny/utils/date.dart';

void main() {
  test('DateTime to String', () {
    DateTime date = DateTime(2023, 10, 1);
    String formattedDate = DateUtils.formatDate(date.toIso8601String());
    expect(formattedDate, '01/10/23 às 00:00');
  });

  test('String to DateTime', () {
    String dateString = '2023-10-01';
    DateTime date = DateTime.parse(dateString);
    expect(date.year, 2023);
    expect(date.month, 10);
    expect(date.day, 1);
  });

  test('Invalid date string', () {
    String invalidDateString = 'invalid-date';
    expect(
      () => DateUtils.formatDate(invalidDateString),
      throwsFormatException,
    );
  });

  test('Valid date string', () {
    String validDateString = '2023-10-01';
    DateTime date = DateUtils.parseDate(validDateString);
    expect(date.year, 2023);
    expect(date.month, 10);
    expect(date.day, 1);
  });

  test('Format date from DateTime', () {
    DateTime date = DateTime(2023, 10, 1);
    String formattedDate = DateUtils.formatDate(date.toIso8601String());
    expect(formattedDate, '01/10/23 às 00:00');
  });
}
