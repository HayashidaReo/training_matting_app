import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/feature/auth/controller/auth_controller.dart';

class TweetListPage extends ConsumerWidget {
  const TweetListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Title')),

      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              ref.read(authControllerProvider.notifier).signOut();
            },
            child: Text('サインアウト'),
          ),
        ),
      ),
    );
  }
}
