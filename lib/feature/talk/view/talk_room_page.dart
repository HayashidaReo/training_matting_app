import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class TalkRoomPage extends HookConsumerWidget {
  const TalkRoomPage({super.key, required this.targetUserId});

  final String targetUserId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(targetUserId)),
      body: SafeArea(child: Center(child: Placeholder())),
    );
  }
}
