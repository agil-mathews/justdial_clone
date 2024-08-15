import 'package:flutter/material.dart';
import 'package:test_project/screens/categoriess.dart';
import 'package:test_project/screens/home.dart';
import 'package:test_project/screens/login.dart';
import 'package:test_project/screens/signup.dart';
import 'package:test_project/screens/splashpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Poppins'),
          bodyMedium: TextStyle(fontFamily: 'Poppins'),
          displayLarge: TextStyle(fontFamily: 'Poppins'),
          displayMedium: TextStyle(fontFamily: 'Poppins'),
          // Add more styles as needed
        ),
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Colors.white,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
),

      initialRoute: '/',
      routes: {
        '/':(context) => const SplashPage(),
        '/home':(context) => const HomePage(),
        '/login':(context) => const LoginScreen(),
        '/signup':(context) => const SignupScreen(),
        '/categories':(context) =>  CategoryPage(),
      },
      // home: const SplashScreen(),
    );
  }
}




