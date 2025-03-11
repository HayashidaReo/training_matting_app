import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/feature/user/data_model/userdata.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key, required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          (userData.iconImageUrl.isEmpty)
              ? ClipOval(
                child: Image.asset(
                  'assets/images/default_user_icon.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              )
              : CachedNetworkImage(
                imageUrl: userData.iconImageUrl,
                imageBuilder:
                    (context, imageProvider) => ClipOval(
                      child: Image(
                        image: imageProvider,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return SizedBox(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return SizedBox(
                    width: 60,
                    height: 60,
                    child: Icon(Icons.image_not_supported_rounded),
                  );
                },
              ),
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
