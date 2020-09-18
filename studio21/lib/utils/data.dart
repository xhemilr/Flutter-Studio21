import 'package:flutter/foundation.dart';
import 'package:studio21/model/serviceitem.dart';

class Data with ChangeNotifier, DiagnosticableTreeMixin{

  List<Item> _items = List();
  //List<Item> filteredItems = [];
  Item selectedItem;
  String serviceDescription = "No selected Item";
  String serialNumber = "No selected Item";
  bool _showCompleted;
  String _searchText = "";

  set items(List<Item> value) {
    _items = value;
  }

  String get searchText => _searchText;

  set searchText(String value) {
    _searchText = value;
    notifyListeners();
  }

  bool get showCompleted => _showCompleted;

  set showCompleted(bool value) {
    _showCompleted = value;
    notifyListeners();
  }

  List<Item> get items => [..._items];

  void setServiceDescription(String value){
    serviceDescription = value;
    notifyListeners();
  }

  void setSerialNumber(String value){
    serialNumber = value;
    notifyListeners();
  }

  void setItem(Item item){
    selectedItem = item;
    notifyListeners();
  }
}