import 'package:test/test.dart';
import 'package:tempus/tempus.dart';

void main() {
  group('Comparatives:', () {
    test('Tempus.isSameDay(dateA, dateB) should return true when days match',
        () {
      final dateA = DateTime(2018, 06, 22, 12, 45);
      final dateB = DateTime(2018, 06, 22, 18, 20);
      expect(Tempus.isSameDay(dateA, dateB), isTrue);

      final dateC = DateTime(2019, 06, 22, 12, 45);
      expect(Tempus.isSameDay(dateA, dateC), isFalse);
    });
    test(
        'Tempus.isSameWeek(dateA, dateB) should return true when days are in the same week',
        () {
      final dateA = DateTime(2018, 06, 18);
      final dateB = DateTime(2018, 06, 22);
      expect(Tempus.isSameWeek(dateA, dateB), isTrue);

      final dateC = DateTime(2019, 06, 12);
      expect(Tempus.isSameWeek(dateA, dateC), isFalse);
    });
    test('Tempus.isFirstDayOfMonth(date) should return a valid boolean', () {
      var date = DateTime(2018, 06, 1);
      expect(Tempus.isFirstDayOfMonth(date), isTrue);

      // Days that overflow past the last day of a month goes into next one
      date = DateTime(2018, 06, 31);
      expect(Tempus.isFirstDayOfMonth(date), isTrue);

      date = DateTime(2018, 06, 05);
      expect(Tempus.isFirstDayOfMonth(date), isFalse);
    });
    test('Tempus.isLastDayOfMonth(date) should return a valid boolean', () {
      var date = DateTime(2018, 06, 30);
      expect(Tempus.isLastDayOfMonth(date), isTrue);

      // Days that overflow past the last day of a month goes into next one
      date = DateTime(2018, 06, 61);
      expect(Tempus.isLastDayOfMonth(date), isTrue);

      date = DateTime(2018, 06, 28);
      expect(Tempus.isLastDayOfMonth(date), isFalse);
    });
  });
  group('Ordinals:', () {
    test('Tempus.firstDayOfWeek(date, startOnMonday) returns a valid date', () {
      var date = DateTime(2018, 10, 4);
      var firstDay = Tempus.firstDayOfWeek(date);
      expect(firstDay, allOf(isNotNull, TypeMatcher<DateTime>()));
      expect(firstDay.day, equals(30));
      expect(firstDay.weekday, equals(7));
      expect(firstDay.month, equals(09));

      date = DateTime(2018, 10, 4);
      firstDay = Tempus.firstDayOfWeek(date, true);
      expect(firstDay, allOf(isNotNull, TypeMatcher<DateTime>()));
      expect(firstDay.day, equals(1));
      expect(firstDay.weekday, equals(1));
      expect(firstDay.month, equals(10));
    });
    test('Tempus.lastDayOfWeek(date, startOnMonday) returns a valid date', () {
      var date = DateTime(2018, 10, 4);
      var firstDay = Tempus.lastDayOfWeek(date);
      expect(firstDay, allOf(isNotNull, TypeMatcher<DateTime>()));
      expect(firstDay.day, equals(7));
      expect(firstDay.weekday, equals(7));
      expect(firstDay.month, equals(10));

      date = DateTime(2018, 10, 4);
      firstDay = Tempus.lastDayOfWeek(date, true);
      expect(firstDay, allOf(isNotNull, TypeMatcher<DateTime>()));
      expect(firstDay.day, equals(6));
      expect(firstDay.weekday, equals(6));
      expect(firstDay.month, equals(10));
    });
    test('Tempus.firstDayOfMonth(date) returns a valid date', () {
      final date = DateTime(2018, 12, 5);
      expect(Tempus.firstDayOfMonth(date).day, equals(1));
      expect(Tempus.firstDayOfMonth(date).month, equals(12));
      expect(Tempus.firstDayOfMonth(date).year, equals(2018));
    });
    test('Tempus.lastDayOfMonth(date) returns a valid date', () {
      var date = DateTime(2018, 12, 5);
      expect(Tempus.lastDayOfMonth(date).day, equals(31));
      expect(Tempus.lastDayOfMonth(date).month, equals(12));
      expect(Tempus.lastDayOfMonth(date).year, equals(2018));

      date = DateTime(2016, 02, 12);
      expect(Tempus.lastDayOfMonth(date).day, equals(29));
      expect(Tempus.lastDayOfMonth(date).month, equals(02));
      expect(Tempus.lastDayOfMonth(date).year, equals(2016));
    });
    test('Tempus.previousMonth(date) returns a valid date', () {
      var date = DateTime(2018, 01, 5);
      expect(Tempus.previousMonth(date).day, equals(1));
      expect(Tempus.previousMonth(date).month, equals(12));
      expect(Tempus.previousMonth(date).year, equals(2017));

      date = DateTime(2016, 02, 12);
      expect(Tempus.previousMonth(date).day, equals(1));
      expect(Tempus.previousMonth(date).month, equals(01));
      expect(Tempus.previousMonth(date).year, equals(2016));
    });
    test('Tempus.nextMonth(date) returns a valid date', () {
      var date = DateTime(2018, 01, 5);
      expect(Tempus.nextMonth(date).day, equals(01));
      expect(Tempus.nextMonth(date).month, equals(02));
      expect(Tempus.nextMonth(date).year, equals(2018));

      date = DateTime(2018, 12, 06);
      expect(Tempus.nextMonth(date).day, equals(01));
      expect(Tempus.nextMonth(date).month, equals(01));
      expect(Tempus.nextMonth(date).year, equals(2019));
    });
    test('Tempus.previousWeek(date) returns a valid date', () {
      var date = DateTime(2018, 01, 5);
      expect(Tempus.previousWeek(date).day, equals(29));
      expect(Tempus.previousWeek(date).month, equals(12));
      expect(Tempus.previousWeek(date).year, equals(2017));

      date = DateTime(2016, 02, 12);
      expect(Tempus.previousWeek(date).day, equals(05));
      expect(Tempus.previousWeek(date).month, equals(02));
      expect(Tempus.previousWeek(date).year, equals(2016));
    });
    test('Tempus.nextWeek(date) returns a valid date', () {
      var date = DateTime(2018, 01, 5);
      expect(Tempus.nextWeek(date).day, equals(12));
      expect(Tempus.nextWeek(date).month, equals(01));
      expect(Tempus.nextWeek(date).year, equals(2018));

      date = DateTime(2018, 12, 06);
      expect(Tempus.nextWeek(date).day, equals(13));
      expect(Tempus.nextWeek(date).month, equals(012));
      expect(Tempus.nextWeek(date).year, equals(2018));
    });
  });
  group('Ranges', () {
    test(
        'Tempus.datesInRange(dateA, dateB) should return a valid List<DateTime>',
        () {
      final ranges = Tempus.daysInRange(DateTime(2018, 10), DateTime(2018, 11));
      expect(ranges, allOf(isNotNull, TypeMatcher<Iterable<DateTime>>()));
      expect(ranges.length, equals(31));
      expect(ranges.first.day, equals(1));
      expect(ranges.first.month, equals(10));
      expect(ranges.last.day, equals(31));
      expect(ranges.last.month, equals(10));
    });

    test(
        'Tempus.datesInMonthGrid(dateA, dateB) should return a valid List<DateTime>',
        () {
      var grid = Tempus.daysInMonth(DateTime(2018, 10));
      expect(grid, allOf(isNotNull, TypeMatcher<List<DateTime>>()));
      expect(grid.length, anyOf(equals(35), equals(42)));

      grid = Tempus.daysInMonth(DateTime(2018, 10), startOnMonday: true);
      expect(grid, allOf(isNotNull, TypeMatcher<List<DateTime>>()));
      expect(grid.length, anyOf(equals(35), equals(42)));
      expect(grid.first.day, equals(1));
      expect(grid.first.month, equals(10));
      expect(grid.last.day, equals(4));
      expect(grid.last.month, equals(11));
    });
  });

  group('Normalization', () {
    test('Normalize Tempus instance sets time to UTC 12:00', () {
      final date = DateTime(2019, 10, 15, 17, 45, 58);
      final tempus = Tempus.fromDate(date);

      expect(tempus.date, equals(date));

      tempus.normalize();
      expect(tempus.date.isUtc, isTrue);
      expect(tempus.date, equals(DateTime.utc(2019, 10, 15, 12)));
    });

    test('Normalize date sets time to UTC 12:00', () {
      final date = DateTime(2019, 10, 15, 17, 45, 58);
      final normDate = Tempus.normalizeDate(date);

      expect(normDate.isUtc, isTrue);
      expect(normDate, equals(DateTime.utc(2019, 10, 15, 12)));
    });
  });
}
