import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/feature/component/single_line_text_form_field.dart';
import 'package:matching_app/feature/component/talk_message_text_field.dart';

class TalkRoomPage extends HookConsumerWidget {
  const TalkRoomPage({super.key, required this.targetUserId});

  final String targetUserId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController messageTextController =
        useTextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text(targetUserId)),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder:
                  (context, index) => Center(child: Text('message $index')),
            ),
          ),
          Container(
            color: Colors.black12,
            width: double.infinity,
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.photo, size: 24)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: TalkMessageTextField(
                      controller: messageTextController,
                      label: 'メッセージを入力',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                    size: 24,
                    color: defaultColors.blueTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
