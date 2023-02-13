import 'dart:async';
import 'package:intl/intl.dart';

class CurrentDate {
  static Future<String> getCurrentDate() async {
    var now = new DateTime.now();
    var formatter = new DateFormat("EEEE, dd MMMM");
    String formatted = formatter.format(now);
    return formatted;
  }
}
