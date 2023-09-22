import 'package:flutter/material.dart';
import 'package:ng_news/views/home_page.dart';
import 'package:ng_news/views/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:ng_news/providers/provider.dart';
import 'package:ng_news/theme/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ArticleProvider(),
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.indigo
          ),
          color: kBlueNgt,
            debugShowCheckedModeBanner: false,
            title: 'Hi-Tech News',
            home: const SplashScreen()));
  }
}
