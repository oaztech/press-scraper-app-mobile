import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scrapi/ui/pages/article.page.dart';
import 'package:scrapi/ui/pages/home.page.dart';

void main() async {
  await dotenv.load();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RootView();
  }
}

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: const MaterialColor(0xFF181CB5, {
        50: Color.fromRGBO(24, 28, 181, .1),
        100: Color.fromRGBO(24, 28, 181, .2),
        200: Color.fromRGBO(24, 28, 181, .3),
        300: Color.fromRGBO(24, 28, 181, .4),
        400: Color.fromRGBO(24, 28, 181, .5),
        500: Color.fromRGBO(24, 28, 181, .6),
        600: Color.fromRGBO(24, 28, 181, .7),
        700: Color.fromRGBO(24, 28, 181, .8),
      })),
      routes: {
        '/': (context) => const HomePage(),
        '/article': (context) => const ArticlePage(),
      },
      initialRoute: '/',
    );
  }
}
