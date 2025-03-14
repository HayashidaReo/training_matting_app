import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/config/utils/fontStyle/font_size.dart';
import 'package:matching_app/feature/auth/view/create_user_page.dart';
import 'package:matching_app/feature/auth/view/signin_page.dart';

class AuthTopNavigationPage extends HookConsumerWidget {
  const AuthTopNavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();

    final selectedIndex = useState<int>(0);
    return DefaultTabController(
      initialIndex: selectedIndex.value,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: defaultColors.navigationBackColor,
          title: TabBar(
            indicatorColor: defaultColors.primaryColor,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 32.0),
            labelColor: defaultColors.navigationSelectedTextColor,
            unselectedLabelColor: defaultColors.navigationUnSelectedTextColor,
            onTap: (index) {
              selectedIndex.value = index;
            },
            tabs: [
              SizedBox(
                height: 24,
                child: Center(
                  child: Text(
                    '新規登録',
                    style: TextStyle(fontSize: FontSize.normal),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
                child: Center(
                  child: Text(
                    'ログイン',
                    style: TextStyle(fontSize: FontSize.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CreateUserPage(
              emailController: emailController,
              passwordController: passwordController,
            ),
            SigninPage(
              emailController: emailController,
              passwordController: passwordController,
            ),
          ],
        ),
      ),
    );
  }
}
