import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/config/utils/enum/router_enum.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';

class FollowCountPanel extends StatelessWidget {
  const FollowCountPanel({
    super.key,
    required this.followCount,
    required this.typeName,
  });

  final int followCount;
  final String typeName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRoute.followList.name);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            followCount.toString(),
            style: TextStyle(fontSize: FontSize.normal),
          ),
          Text(typeName, style: TextStyle(fontSize: FontSize.small)),
        ],
      ),
    );
  }
}
