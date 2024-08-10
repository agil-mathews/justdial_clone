
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
    void initState(){
      super.initState();
      _navigatetohome();

    }
    void _navigatetohome() async{
      await Future.delayed(const Duration(milliseconds: 3000),(){});
      if (mounted){
        Navigator.pushNamed(context, '/login');
      }
    }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(child: Image.asset('assets/images/HorizontalLogo.png')),
      ),
    );
  }
}