import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/feature/user/controller/follow_list_top_navigation.dart';

class FollowListPage extends ConsumerWidget {
  const FollowListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedTabIndex = ref.watch(followListTopNavigationProvider);
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text('Selected Tab Index: $selectedTabIndex')),
      ),
    );
  }
}
