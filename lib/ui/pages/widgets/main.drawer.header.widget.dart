import 'package:flutter/material.dart';

class MainDrawerHeader extends StatelessWidget {
  const MainDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Theme.of(context).primaryColor])),
      child: Row(
        children: const [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('images/hespress_logo.png'),
          )
        ],
      ),
    );
  }
}
