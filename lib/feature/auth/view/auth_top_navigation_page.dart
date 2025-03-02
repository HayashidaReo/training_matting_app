import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/feature/auth/view/create_user_page.dart';
import 'package:matching_app/feature/auth/view/signin_page.dart';

class AuthTopNavigationPage extends HookConsumerWidget {
  const AuthTopNavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState<int>(0);
    return DefaultTabController(
      initialIndex: selectedIndex.value,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            onTap: (index) {
              selectedIndex.value = index;
            },
            tabs: [
              Text('新規登録', style: TextStyle(fontSize: 14)),
              Text('ログイン', style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
        body: TabBarView(children: [CreateUserPage(), SigninPage()]),
      ),
    );
  }
}
