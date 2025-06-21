import 'package:diy_challenge_app/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFA0C4FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            Image.asset(
              'assets/images/logo3.png',
              width: ResponsiveHelper.isMobile(context)?250:ResponsiveHelper.isTablet(context)?280:350,
              height:ResponsiveHelper.isMobile(context)?250:ResponsiveHelper.isTablet(context)?280:350 ,
            ),

          ],
        ),
      ),
    );
  }
}
