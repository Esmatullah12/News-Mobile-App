import 'package:flutter/material.dart';
import 'Pages/splash_screen.dart';
import 'Pages/login_page.dart';
import 'Pages/signup_page.dart';
import 'Pages/home_page.dart';
import 'Pages/profile_page.dart';
import 'Pages/favorite_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyCxQZHI8LY3a_OffH2SrvRbQdJWpjCFgzs",
      appId: "1:624423629498:web:4db7378992bbfb16a2c883",
      messagingSenderId: "624423629498",
      projectId: "news-app-39489",
      storageBucket: "news-app-39489.appspot.com",
    ));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
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
