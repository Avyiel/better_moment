# tempus [![Pub](https://img.shields.io/pub/v/tempus.svg)](https://pub.dartlang.org/packages/tempus) [![Build Status](https://travis-ci.com/Avyiel/tempus.svg?branch=master)](https://travis-ci.com/Avyiel/tempus)
An implementation of some Moment.js features for parsing, manipulates and displaying dates in Dart.

## Usage

A simple usage example:

```dart
import 'package:tempus/tempus.dart';

main() {
    Duration secondsToAdd = new Duration(seconds: 10);
    DateTime dateForComparison = new DateTime.now().add(secondsToAdd);
    Tempus tempus = new Tempus();

    // Will print "in a few seconds"
    print(tempus.from(dateForComparison));

    // Will generate a list with 42 DateTimes, perfect for creating
    // calendar grids. By default starts on Sunday, can be Monday.
    DateTime randomDate = new DateTime(2018, 10);
    List<DateTime> dateGrid = Tempus.datesInMonthGrid(randomDate, true);
}
```

## Locales

### Set the locale for all usages of `Tempus`:

```dart
Tempus.globalLocale(new LocaleDE());
```

### Set the locale only for the current instance of `Tempus`:

```dart
Tempus tempus = new Tempus.now().locale(new LocaleDE());
```

### Adding your own locale:

Just create a class that implements `ILocale` and assign that to your `Tempus` instance or set it globally.


### Overwriting existing locales:

```dart
class ShortLocaleEn extends LocaleEN {
  String get seconds => '%is';

  String get aMinute => '%im';
  String get minutes => '%im';

  String get anHour => '%ih';
  String get hours => '%ih';

  String get aDay => '%id';
  String get days => '%id';
}
```
