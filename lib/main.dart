import 'package:flutter/material.dart';
import 'Pages/splash_screen.dart';
import 'Pages/login_page.dart';
import 'Pages/signup_page.dart';
import 'Pages/home_page.dart';
import 'Pages/profile_page.dart';
import 'Pages/favorite_page.dart';
import 'Pages/news_detailPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/signup': (context) => SignupPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => MyHomePage(),
        '/profile': (context) => ProfilePage(),
        '/favorite_news': (context) => FavoritePage(),
      },
    );
  }
}


