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
    return "${dtm.day} ${dtm.month} ${dtm.year}";
  }

  static int differenceInHour(DateTime dateTime) {
    var currentTime = DateTime.now();
    return currentTime.difference(dateTime).inHours;
  }

  static int differenceInMinutes(DateTime dateTime) {
    var currentTime = DateTime.now();
    return currentTime.difference(dateTime).inMinutes;
  }
}
