import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];
  String _selectedRestaurant = '';

  List<Map<String, dynamic>> get cartItems => _cartItems;
  String get resName => _selectedRestaurant;

  void addItem(Map<String, dynamic> item, String resName) {
    if(resName != _selectedRestaurant) {
      cartItems.clear();
    }
    var existingItemIndex =
        _cartItems.indexWhere((cartItem) => cartItem["name"] == item["name"]);
    if (existingItemIndex != -1) {
      _cartItems[existingItemIndex]["quantity"] += 1;
    } else {
      _cartItems.add({...item, "quantity": 1});
      _selectedRestaurant = resName;
    }

    notifyListeners();
  }

  void clearAll() {
    _cartItems.clear();
    notifyListeners();
  }

  void removeItem(Map<String, dynamic> item){
    var existingItemIndex =
        _cartItems.indexWhere((cartItem) => cartItem["name"] == item["name"]);
        if(existingItemIndex != -1){
          if(_cartItems[existingItemIndex]["quantity"] >1){
            _cartItems[existingItemIndex]["quantity"] -=1;
          }
          else{
            _cartItems.removeAt(existingItemIndex);
            
          }
          notifyListeners();
        }
        
    
  }









}
