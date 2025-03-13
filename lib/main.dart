import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matching_app/config/firebase/firebase_options.dart';
import 'package:matching_app/config/utils/color/colors.dart';
import 'package:matching_app/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    return MaterialApp.router(
      supportedLocales: const [
        Locale('ja', 'JP'), // 日本語対応
      ],
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: defaultColors.appBackColor,
          surfaceTintColor:
              defaultColors.appBackColor, // リストなどを下にスクロールした時に出てくる色
        ),
        scaffoldBackgroundColor: defaultColors.appBackColor,
      ),
      locale: const Locale('ja', 'JP'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
