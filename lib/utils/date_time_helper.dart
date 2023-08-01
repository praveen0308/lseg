import 'package:intl/intl.dart';

class DateTimeHelper {
  static String getGreeting() {
    DateTime now = DateTime.now();
    var timeNow = int.parse(DateFormat('kk').format(now));

    var message = '';
    if (timeNow < 12) {
      message = 'Good Morning 🌞';
    } else if ((timeNow >= 12) && (timeNow <= 16)) {
      message = 'Good Afternoon 🌤';
    } else if ((timeNow >= 16) && (timeNow <= 20)) {
      message = 'Good Evening 🌜';
    } else {
      message = 'Good Night 🌛';
    }

    return message;
  }

  static String convertDate(String inputDate) {
    var inputFormat = DateFormat('dd-MM-yyyy');
    var date1 = inputFormat.parse(inputDate);

    var outputFormat = DateFormat('MMM dd,yyyy | EEEE');
    var date2 = outputFormat.format(date1);
    return date2.toString();
  }

  static String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateTime now = DateTime.now();
    Duration difference = now.difference(dateTime).abs();

    if (difference.inDays == 0) {
      // Today
      return DateFormat('h:mm a').format(dateTime);
    } else if (difference.inDays == 1) {
      // Yesterday
      return 'Yesterday ${DateFormat('h:mm a').format(dateTime)}';
    } else {
      // X Days Ago
      return '${difference.inDays} Days Ago ${DateFormat('h:mm a').format(dateTime)}';
    }
  }

  static String dobConvertDate(String inputDate) {
    var inputFormat = DateFormat('yyyy-MM-ddThh:mm:ss');
    var date1 = inputFormat.parse(inputDate);

    // var outputFormat = DateFormat('MMM dd,yyyy | EEEE');
    var outputFormat = DateFormat('yyyy-MM-dd');
    var date2 = outputFormat.format(date1);
    return date2.toString();
  }
  static int calculateAge(String dob) {
    DateTime currentDate = DateTime.now();
    DateTime dateOfBirth = DateFormat('yyyy-MM-dd').parse(dob);
    int age = currentDate.year - dateOfBirth.year;

    if (currentDate.month < dateOfBirth.month ||
        (currentDate.month == dateOfBirth.month &&
            currentDate.day < dateOfBirth.day)) {
      age--;
    }

    return age;
  }

  static bool isDateValid(String date) {
    try {
      DateFormat('yyyy-MM-dd').parse(date);
      return true;
    } catch (e) {
      return false;
    }
  }



  static String getCurrentDate({String format = 'EEE, dd MMM'}) {
    var date1 = DateTime.now();

    var outputFormat = DateFormat(format);
    var date2 = outputFormat.format(date1);
    return date2.toString();
  }

  static String getCurrentTime() {
    var date1 = DateTime.now();

    var outputFormat = DateFormat('dd-MM-yyy hh:mm:ss a');
    var date2 = outputFormat.format(date1);
    return date2.toString();
  }

  static String formatTime(String time, String oFormat) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day);
    final format = DateFormat(oFormat); //"6:00 AM"
    return format.format(dt);
  }

  static String formatAnyDateTime(String time, String oFormat) {
    final format = DateFormat(oFormat);
    return format.format(DateTime.parse(time));
  }


}
