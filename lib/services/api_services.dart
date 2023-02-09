import 'dart:convert';
import 'dart:math';
import 'package:quranapp/models/Prayer_timing.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiServices {
Future<String> getPrayerTime() async {
  var response = await http.get('https://api.aladhan.com/v1/calendar?latitude=51.508515&longitude=-0.1254872&method=2&month=4&year=2023' as Uri);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    var currentDate = DateTime.now();
    var prayerTimingsForCurrentDay;

    for (var prayerTimings in data["data"]) {
      if (prayerTimings["date"]["gregorian"]["date"] == "${currentDate.year}-${currentDate.month.toString().padLeft(2, '0')}-${currentDate.day.toString().padLeft(2, '0')}") {
        prayerTimingsForCurrentDay = prayerTimings;
        break;
      }
    }

    // based on the current time, return the appropriate prayer time (e.g. Fajar, Zohr, Asar, Magrib, Isha)
    var currentTime = DateTime.now();
    if (currentTime.isBefore(DateTime.parse(prayerTimingsForCurrentDay["timings"]["Fajr"]))) {
      return "Fajar";
    } else if (currentTime.isBefore(DateTime.parse(prayerTimingsForCurrentDay["timings"]["Dhuhr"]))) {
      return "Zohr";
    } else if (currentTime.isBefore(DateTime.parse(prayerTimingsForCurrentDay["timings"]["Asr"]))) {
      return "Asar";
    } else if (currentTime.isBefore(DateTime.parse(prayerTimingsForCurrentDay["timings"]["Maghrib"]))) {
      return "Magrib";
    } else if (currentTime.isBefore(DateTime.parse(prayerTimingsForCurrentDay["timings"]["Isha"]))) {
      return "Isha";
    } else {
      return "Fajar";
    }
  } else {
    throw Exception('Failed to load prayer time data');
  }
}


 
}