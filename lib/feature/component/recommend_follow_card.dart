import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/config/utils/margin/height_margin_sized_box.dart';
import 'package:matching_app/feature/component/icon_image.dart';
import 'package:matching_app/feature/user/model/userdata.dart';

class RecommendFollowCard extends StatelessWidget {
  const RecommendFollowCard({super.key, required this.userData});

  final UserData userData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: InkWell(
        onTap: () {
          context.pushNamed(
            AppRoute.otherUserProfile.name,
            queryParameters: {'userId': userData.userId},
          );
        },
        child: Card(
          elevation: 3,
          margin: const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),

          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconImage(
                  iconImageUrl: userData.iconImageUrl,
                  size: 100,
                  onTap: () {
                    context.pushNamed(AppRoute.editMyIcon.name);
                  },
                ),
                HeightMarginSizedBox.small,
                Text(
                  userData.userName,
                  style: TextStyle(fontSize: FontSize.small),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
