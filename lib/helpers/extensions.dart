import 'package:intl/intl.dart';

extension Extension on Object? {
  bool isNullOrEmpty() => this == null || this == '';

  bool isNullEmptyOrFalse() => this == null || this == '' || this == false;

  bool isNullEmptyZeroOrFalse() =>
      this == null || this == '' || this == false || this == 0;
}

extension DateTimeFormat on DateTime? {
  String getStringDate() {
    if (this != null) {
      return DateFormat("yyyy-MM-dd").format(this!);
    } else {
      return '-';
    }
  }

  String getStringTime() {
    if (this != null) {
      return DateFormat("HH:mm").format(this!);
    } else {
      return '-';
    }
  }
}

extension StringFormat on String? {
  String toStr() {
    if (this != null) {
      return this!;
    } else {
      return '-';
    }
  }
}

extension NumFormat on num? {
  String toStr() {
    if (this != null) {
      return this!.toString();
    } else {
      return '-';
    }
  }

  bool isBetween(num from, num to) {
    return from < this! && this! < to;
  }

  bool isBetweenOrEqual(num from, num to) {
    return from <= this! && this! <= to;
  }
}
