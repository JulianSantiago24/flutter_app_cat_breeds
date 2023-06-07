import 'package:flutter_app_cat_breeds/constanst.dart';
import 'package:flutter_app_cat_breeds/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> _waitAndPush() async {
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => HomeScreen.create(),
        )
      );  
    }
  }

  @override
  void initState() {
    _waitAndPush();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.2, 0.8],
            colors: [
              backgroundBlue,
              backgroundPink,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Cat Breeds',
              style: TextStyle(
                color: white,
                fontFamily: 'DancingScript',
                fontWeight: FontWeight.bold,
                fontSize: 80
              ),
            ),
            Center(
              child: Image.asset(
                'assets/gato.png',
                height: MediaQuery.of(context).size.width / 1.5,
              ),
            ),
            const SizedBox(height: 10),
            const CircularProgressIndicator(
              color: pinkAccent,
            )
          ],
        ),
      ),
    );
  }
}
