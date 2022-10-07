import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapper/views/auth/login_view.dart';
import 'package:mapper/views/screens/dashboard.dart';
import 'package:mapper/views/screens/welcome_view.dart';

import 'views/auth/signup_view.dart';
import 'views/screens/guest_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Step 3
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GBC Coin',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (_) => const WelcomePage(),
        'loginpage': (_) => const LoginPage(),
        'homepage': (_) => const HomePage(),
        'guest': (_) => GuestPage(),
        'signup':(_)=>SignUpPage(),
      },
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 21, 70, 95),
        primaryColorLight: const Color.fromARGB(255, 203, 228, 226),
        appBarTheme: const AppBarTheme(
          elevation: 0, // This removes the shadow from all App Bars.
        ),
        primarySwatch: Colors.blue,
      ),
    );
  }
}
