import 'package:power_48/modules/data/model.dart';

class Store {
  static final Store _instance = Store._internal();

  factory Store() {
    return _instance;
  }

  Store._internal();

  List<Article> favorites = [];
}
