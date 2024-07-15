import 'package:intl/intl.dart';

class DateTimeHelper {
  static DateFormat targetTimeFormat = DateFormat("dd/MM/yyyy hh:mm a");

  static DateFormat targetDateFormatter = DateFormat('dd/MM/yyyy');
  static DateFormat targetDateTimeFormatter = DateFormat('dd/MM/yyyy HH:mm:ss');

  static DateFormat serverDateTimeFormatter =
      DateFormat('yyyy-MM-ddTHH:mm:ss.SSS');

  static DateTime getDateTime(String originalTimeString) {
    return targetTimeFormat.parse(originalTimeString);
  }

  static String getFormattedDateTime(String originalDateString) {
    return targetDateTimeFormatter.format(DateTime.parse(originalDateString));
  }

  static String getFormattedDate(String? originalDateString) {
    if (originalDateString != null && originalDateString.isNotEmpty) {
      return targetDateFormatter.format(DateTime.parse(originalDateString));
    } else {
      return "";
    }
  }

  static String getServerFormattedDateTime(String originalDateString) {
    return serverDateTimeFormatter.format(DateTime.parse(originalDateString));
  }

  static DateTime getServerDateTime(String originalDateString) {
    return DateTime.parse(originalDateString);
  }

  static String formatToIso8601(String dob) {
    List<String> parts = dob.split('/');

    if (parts.length == 3) {
      String year = parts[2];
      String month = parts[1].padLeft(2, '0');
      String day = parts[0].padLeft(2, '0');

      return '$year-$month-${day}T00:00:00';
    }

    return '';
  }
}
