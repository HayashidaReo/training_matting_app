import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/feature/component/icon_image.dart';
import 'package:matching_app/feature/user/model/userdata.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key, required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconImage(iconImageUrl: userData.iconImageUrl, size: 60),
      title: Text(
        userData.userName,
        style: TextStyle(
          fontSize: FontSize.normal,
          color:
              (userData.gender == '男性')
                  ? defaultColors.femaleColor
                  : defaultColors.maleColor,
        ),
      ),
      onTap: () async {
        context.pushNamed(
          AppRoute.otherUserProfile.name,
          queryParameters: {'userId': userData.userId},
        );
      },
    );
  }
}
