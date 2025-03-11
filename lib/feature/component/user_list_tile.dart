import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/feature/component/icon_image.dart';
import 'package:matching_app/feature/user/model/userdata.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key, required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconImage(iconImageUrl: userData.iconImageUrl, size: 60),
      title: Text(userData.userName),
      onTap: () async {
        context.pushNamed(
          AppRoute.otherUserProfile.name,
          queryParameters: {'userId': userData.userId},
        );
      },
    );
  }
}
