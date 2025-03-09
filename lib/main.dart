import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matching_app/config/firebase/firebase_options.dart';
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
      locale: const Locale('ja', 'JP'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate, // 追加
        GlobalWidgetsLocalizations.delegate, // 追加
        GlobalCupertinoLocalizations.delegate, // 追加 (iOS向け)
      ],
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
