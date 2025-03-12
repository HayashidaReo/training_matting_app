import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/function/timestamp_converter.dart';

String formatTalkTimestamp(Timestamp talkTimestamp) {
  final Timestamp now = Timestamp.now();
  final Duration difference = now.toDate().difference(talkTimestamp.toDate());
  if (difference.inDays >= 8) {
    return fromDateToString(talkTimestamp.toDate());
  } else if (difference.inDays >= 2) {
    return '${difference.inDays}日前';
  } else {
    final DateTime talkDateTime = talkTimestamp.toDate();
    return '${talkDateTime.hour.toString().padLeft(2, '0')}:${talkDateTime.minute.toString().padLeft(2, '0')}';
  }
}
