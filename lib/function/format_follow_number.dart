import 'package:intl/intl.dart';

/// 入力された数字をフォーマット化して返す関数
String formatFollowNumber(int number) {
  // 1000未満はそのまま返す
  if (number < 1000) {
    return number.toString();
  }
  // 1000以上 10,000未満は千位区切りでフォーマット
  else if (number < 10000) {
    return NumberFormat('#,###').format(number);
  }
  // 10,000以上 100,000,000未満は「万」で表記
  else if (number < 100000000) {
    final double value = number / 10000;
    // 小数部分がゼロなら整数として表示
    if (value == value.floorToDouble() || value > 1000) {
      return '${NumberFormat('#,###').format(value.toInt())}万';
    } else {
      return '${value.toStringAsFixed(1)}万';
    }
  }
  // 100,000,000以上は「億」で表記
  else {
    final double value = number / 100000000;
    if (value == value.floorToDouble()) {
      return '${value.toInt()}億';
    } else {
      return '${value.toStringAsFixed(1)}億';
    }
  }
}
