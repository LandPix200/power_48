import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:power_48/modules/data/articles.dart';

import '../data/model.dart';
import '../data/store.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset(
                          "assets/images/lois/${articles.indexOf(article)}.jpeg")
                      .image,
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.maxFinite,
                    color: Colors.white.withOpacity(0.4),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    article.content,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  const Divider(),
                  BottomButtons(article: article),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomButtons extends StatefulWidget {
  const BottomButtons({super.key, required this.article});

  final Article article;

  @override
  State<BottomButtons> createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<BottomButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          color: Colors.grey.shade300,
          onPressed: () {},
          child: const Text("  ${"J'ai aimé"}"),
        ),
        MaterialButton(
          color: Colors.grey.shade300,
          onPressed: () {
            _toggleFavorite();
          },
          child: Text(widget.article.inFavorite()
              ? "  ${"Retirer des favoris"}"
              : "  ${"Ajouter aux favoris"}"),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    if (!widget.article.inFavorite()) {
      Store().favorites.add(widget.article);
    } else {
      Store().favorites.remove(widget.article);
    }
    setState(() {});
  }
}
