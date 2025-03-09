import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

class TimestampConverter implements JsonConverter<Timestamp, Timestamp> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Timestamp timestamp) {
    return timestamp;
  }

  @override
  Timestamp toJson(Timestamp date) => date;
}

String fromDateToString(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

DateTime fromStringToDate(String dateString) {
  return DateFormat('yyyy-MM-dd').parse(dateString);
}
