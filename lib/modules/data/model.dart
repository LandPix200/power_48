import 'package:power_48/modules/data/store.dart';

class Article {
  final String title;
  final String content;

  Article({
    required this.title,
    required this.content,
  });

  bool inFavorite() => Store().favorites.any((element) => title == element.title);
}
