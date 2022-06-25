import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {
  final String title;
  final Function onAction;

  const DrawerItemWidget(
      {Key? key,
      required this.onAction,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () => onAction(),
    );
  }
}
