import 'dart:async';

class CurrentTime {
  static void getCurrentTime(Function updateUI) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      var currentTime = DateTime.now();
      int hour = currentTime.hour;
      int minute = currentTime.minute;
      
      String amPm = "AM";

      if (hour >= 12) {
        amPm = "PM";
        if (hour > 12) {
          hour = hour - 12;
        }
      }

      if (hour == 0) {
        hour = 12;
      }
String minuteString = (minute < 10) ? "0$minute" : "$minute";
String hourString = (hour < 10) ? "0$hour" : "$hour";
      String timeString = "$hourString:$minuteString $amPm";

      // call updateUI to update the UI
      updateUI(timeString);
    });
  }
}
