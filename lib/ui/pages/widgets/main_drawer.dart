import 'package:flutter/material.dart';
import 'package:scrapi/client/hespress_scraper.client.dart';
import 'package:scrapi/model/category.model.dart';
import 'package:scrapi/ui/pages/widgets/drawer.item.widget.dart';
import 'package:scrapi/ui/pages/widgets/main.drawer.header.widget.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  late List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    HespressScraperClient.fetchCategories().then((value) => {
      setState(() {
        categories = value;
      })
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(textDirection: TextDirection.rtl,
        children: [
          const MainDrawerHeader(),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return DrawerItemWidget(
                    title: categories[index].wording,
                    onAction: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/');
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    endIndent: 6,
                  );
                },
                itemCount: categories.length),
          )
        ],
      ),
    );
  }
}
