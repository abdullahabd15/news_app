import 'package:intl/intl.dart';

class DateUtil {
  static DateTime convertToDateTime(String dtm) {
    try {
      var dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ssZ");
      var dateTime = dateFormat.parse(dtm);
      return dateTime;
    } catch (e) {
      print(e);
      throw Exception("Invalid Date Format");
    }
  }

  static bool isToday(DateTime dtm) {
    var now = DateTime.now();
    var currentTime = DateTime(now.year, now.month, now.day);
    var dateTime = DateTime(dtm.year, dtm.month, dtm.day);
    return currentTime.isAtSameMomentAs(dateTime);
  }

  static String toIndonesianFormat(DateTime dtm) {
    var hour = dtm.hour < 10 ? "0${dtm.hour}" : "${dtm.hour}";
    var minute = dtm.minute < 10 ? "0${dtm.minute}" : "${dtm.minute}";
    return "${dtm.day} ${dtm.month} ${dtm.year}, $hour:$minute";
  }

  static int differenceInHour(DateTime dateTime) {
    var currentTime = DateTime.now();
    return currentTime.difference(dateTime).inHours;
  }

  static int differenceInMinutes(DateTime dateTime) {
    var currentTime = DateTime.now();
    return currentTime.difference(dateTime).inMinutes;
  }

  static String differencePhrase(String strDateTime) {
    var dateTime = DateUtil.convertToDateTime(strDateTime);
    if (DateUtil.isToday(dateTime)) {
      var diffInHours = DateUtil.differenceInHour(dateTime);
      if (diffInHours == 0) {
        return "${DateUtil.differenceInMinutes(dateTime)} menit yang lalu.";
      } else {
        return "$diffInHours jam yang lalu.";
      }
    } else {
      return DateUtil.toIndonesianFormat(dateTime);
    }
  }
}
