import 'package:cloud_firestore/cloud_firestore.dart';

String formateDate(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();

  // get year
  String year = dateTime.year.toString();

  // get month
  String month = dateTime.month.toString();

  // get day

  String day = dateTime.day.toString();

  // final formated date

  String formatedDate = '$day/$month/$year';

  return formatedDate;
}

String formateTime(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();

  // get hour

  String hour = dateTime.hour.toString();

  // get minute

  String minute = dateTime.minute.toString();

  // get seconds

  String seconds = dateTime.second.toString();

  // final formated time

  String formatedTime = '$hour:$minute:$seconds';
  return formatedTime;
}
