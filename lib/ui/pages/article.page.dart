import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scrapi/client/hespress_scraper.client.dart';

import '../../model/article.model.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  ArticleModel? article;

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments != null) {
      final routes = ModalRoute.of(context)?.settings.arguments
          as Map<String, ArticleModel>;

      ArticleModel? article1 = routes['article'];
      int? id = article1?.id!.toInt();
      //article = article1;
      HespressScraperClient.fetchArticle(id!).then((value) {
        setState(() {
          article = value;
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          article != null ? '${article!.title}' : '',
          textDirection: TextDirection.rtl,
        ),
      ),
      body: article != null
          ? SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text('${article!.title}',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Text('الكاتب: ${article!.author}',
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Card(
                        child: Container(
                          height: 230,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage('${article!.image}'),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '${article!.content}',
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
