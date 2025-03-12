import 'package:fluttertoast/fluttertoast.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';

void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: defaultColors.toastBackColor,
    textColor: defaultColors.toastTextColor,
    fontSize: FontSize.large,
  );
}
