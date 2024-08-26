import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app2/core/services/debug_service.dart';
import 'package:todo_app2/firebase_options.dart';
import 'package:todo_app2/manager/provider/main_provider.dart';
import 'package:todo_app2/modules/auth/sign_in/page/sign_in_page.dart';
import 'package:todo_app2/modules/auth/sign_up/page/sign_up_page.dart';
import 'package:todo_app2/modules/home/layout/screen/layout_screen.dart';
import 'package:todo_app2/modules/home/menu/screen/menu_screen.dart';
import 'package:todo_app2/modules/splash/splash_screen.dart';

void main() async {
  Debug.i('[Todo] Start');

  Debug.i('[Todo] Initializing Bindings');
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Debug.i('[Todo] Starting App');
  runApp(
    ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const NoteIt(),
      ),
    ),
  );
  Debug.i('[Todo] Starting App');
}

class NoteIt extends StatelessWidget {
  const NoteIt({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MainProvider>(context);
    return MaterialApp(
      theme: provider.themeData,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: {
        const SplashScreen().routeName: (_) => const SplashScreen(),
        LayoutScreen().routeName: (_) => LayoutScreen(),
        const SignInPage().route: (_) => const SignInPage(),
        const SignUpPage().route: (_) => const SignUpPage(),
        const MenuScreen().routeName: (_) => const MenuScreen(),
      },
      initialRoute: const SplashScreen().routeName,
    );
  }
}
