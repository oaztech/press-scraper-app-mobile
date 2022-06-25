import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scrapi/bloc/category.bloc.dart';
import 'package:scrapi/ui/pages/home.page.dart';

void main() async {
  await dotenv.load();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => CategoryBloc())],
        child: const RootView());
  }
}

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: MaterialColor(
        0xff181CB5,
        const <int, Color>{
          50: const Color(0xff181CB5),
        },
      )),
      routes: {
        '/': (context) => const HomePage(),
      },
      initialRoute: '/',
    );
  }
}
