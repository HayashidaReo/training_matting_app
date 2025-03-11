import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/feature/user/controller/user_controller.dart';
import 'package:matching_app/feature/user/model/userdata.dart';

IgnorePointer badgeCountWidget(WidgetRef ref) {
  return IgnorePointer(
    child: Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: BoxConstraints(minWidth: 16, minHeight: 16),
      child: ref
          .watch(watchMyUserDataControllerProvider)
          .when(
            error: (error, _) {
              return Container();
            },
            loading: () {
              return Container();
            },
            data: (UserData? userData) {
              if (userData == null) {
                return Container();
              }
              return Text(
                '2',
                style: TextStyle(color: Colors.white, fontSize: FontSize.small),
                textAlign: TextAlign.center,
              );
            },
          ),
    ),
  );
}
