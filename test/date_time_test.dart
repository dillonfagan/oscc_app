import 'package:flutter_test/flutter_test.dart';
import 'package:oscc_app/models/bike_ride.dart';

void main() {
  test("two DateTime.now() instances are same dates", () {
    final today = DateTime.now();
    final anotherToday = DateTime.now();

    expect(today.isSameDate(anotherToday), isTrue);
  });

  test("two DateTimes with different times and same days are same dates", () {
    final oneDay = DateTime(2020, 6, 1, 12, 0);
    final anotherDay = DateTime(2020, 6, 1, 8, 0);

    expect(oneDay.isSameDate(anotherDay), isTrue);
  });

  test("two different DateTime instances are NOT same dates", () {
    final today = DateTime.now();
    final anotherDay = DateTime(2000, 1, 1);

    expect(today.isSameDate(anotherDay), isFalse);
  });
}
