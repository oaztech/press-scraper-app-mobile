import 'package:flutter/material.dart';
import 'package:scrapi/ui/pages/widgets/main_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: const Center(
        child: Text('Home page'),
      ),
    );
  }
}
