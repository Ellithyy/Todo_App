import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_app_c9_sun_4pm/core/theme/application_theme.dart';
import 'package:todo_app_c9_sun_4pm/layout/home_layout.dart';
import 'package:todo_app_c9_sun_4pm/pages/login/login_view.dart';
import 'package:todo_app_c9_sun_4pm/pages/registeration/register_view.dart';
import 'package:todo_app_c9_sun_4pm/pages/splash/splash_view.dart';

import 'package:firebase_core/firebase_core.dart';
import 'core/services/loading_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        HomeLayout.routeName: (context) => HomeLayout(),
        LoginView.routeName: (context) => LoginView(),
        RegisterView.routeName: (context) => RegisterView(),
      },
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
    );
  }
}