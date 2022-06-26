import 'package:flutter/material.dart';
import 'package:scrapi/client/hespress_scraper.client.dart';
import 'package:scrapi/model/article.model.dart';
import 'package:scrapi/ui/pages/widgets/main_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<ArticleModel> articles = [];
  late String slug = 'politique';

  @override
  void initState() {
    super.initState();
    HespressScraperClient.fetchBrefArticles(categorySlug: 'politique').then((value) {
      setState(() {
        articles = value.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const MainDrawer(),
        appBar: AppBar(
          title: const Text(
            'الأخبار',
            textDirection: TextDirection.ltr,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.network(
                        '${articles[index].image}',
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      endIndent: 6,
                    );
                  },
                  itemCount: articles.length),
            )
          ],
        ));
  }
}
