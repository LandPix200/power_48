import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:power_48/modules/data/articles.dart';
import 'package:power_48/modules/data/model.dart';

import '../article/article.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UpBar(),
            Text(
              "Les 48 lois du pouvoir",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            // const Carousel(),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (_, index) {
                  Article article = articles[index];
                  return ArticleRow(article: article);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleRow extends StatelessWidget {
  const ArticleRow({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ArticlePage(article: article),
        ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                          "assets/images/lois/${articles.indexOf(article)}.jpeg")
                      .image,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Loi ${articles.indexOf(article) + 1}"),
                  AutoSizeText(
                    article.title,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UpBar extends StatelessWidget {
  const UpBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const FaIcon(FontAwesomeIcons.bars),
          Text(
            "Power 48",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          // const Row(
          //   children: [
          //     FaIcon(
          //       FontAwesomeIcons.magnifyingGlass,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
