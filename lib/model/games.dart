import 'package:netflix_clon/model/item.dart';

class Games {
  List<Item> items = <Item>[];

  Games();

  Games.fromJsonList(List<dynamic> jsonList) {
    //if (jsonList == null ) return;

    for (var dato in jsonList) {
      final item = Item.fromJsonMap(dato);
      items.add(item);
    }
  }
}
