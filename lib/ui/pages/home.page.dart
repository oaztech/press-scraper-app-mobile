import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrapi/client/hespress_scraper.client.dart';
import 'package:scrapi/model/article.model.dart';

import '../../model/category.model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<CategoryModel> categories = [];
  late List<ArticleModel> articles = [];
  late String slug = 'politique';
  String title = 'الأخبار';

  @override
  void initState() {
    super.initState();

    // get categories
    HespressScraperClient.fetchCategories().then((value) => {
          setState(() {
            categories = value;
          })
        });

    // get articles
    HespressScraperClient.fetchBrefArticles(categorySlug: slug)
        .then((value) => {
              setState(() {
                articles = value.data;
              })
            });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        endDrawer: Drawer(
          child: Column(
            textDirection: TextDirection.rtl,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.white,
                  Theme.of(context).primaryColor
                ])),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('images/hespress_logo.png'),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          categories[index].wording,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.pop(context);

                          HespressScraperClient.fetchBrefArticles(
                                  categorySlug: categories[index].slug)
                              .then((value) => {
                                    setState(() {
                                      articles = value.data;
                                      title = categories[index].wording;
                                    })
                                  });
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
        ),
        appBar: AppBar(
          title: Text(
            title != null ? '${title}': 'الأخبار',
            textDirection: TextDirection.ltr,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        ArticleModel article = articles[index];
                        Navigator.pushNamed(context, '/article', arguments: {'article': article});
                      },
                      child: Card(
                        child: Stack(
                          children: [
                            Container(
                              height: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image:
                                      NetworkImage('${articles[index].image}'),
                                  fit: BoxFit.fill,
                                  //alignment: Alignment.topCenter,
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                  ),
                                  width: MediaQuery.of(context).size.width - 8,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      '${articles[index].title}',
                                      textDirection: TextDirection.rtl,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
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
                      margin: const EdgeInsets.all(10),
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
