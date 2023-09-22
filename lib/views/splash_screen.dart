import 'package:flutter/material.dart';
import 'package:ng_news/views/home_page.dart';
import 'package:splash_view/splash_view.dart';
import 'package:ng_news/theme/style.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashView(
      loadingIndicator: const Padding(
          padding: EdgeInsets.only(bottom: 20),
        child: Text(
            "Powered by \nNGT Technology",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 12,
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      bottomLoading: true,
      backgroundColor: kWhiteFA,
      logo: Image.asset("assets/HTN.png", height: 150),
      done: Done(
          const HomePage(),
        animationDuration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
      ),
    );
  }
}
