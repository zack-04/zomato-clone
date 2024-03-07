import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class RestaurantProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _restaurants = [];
  bool _isLoading = false;
  String _error = '';

  //getter
  List<Map<String, dynamic>> get restaurants => _restaurants;
  bool get isLoading => _isLoading;
  String get error => _error;

  final CollectionReference restaurantsRef =
      FirebaseFirestore.instance.collection("Restaurants");

  Future fetchRestaurants() async {
    _isLoading = true;
    notifyListeners();
    try {
      QuerySnapshot querySnapshot = await restaurantsRef.get();

      for (var docSnapshot in querySnapshot.docs) {
        Map<String, dynamic> restData =
            docSnapshot.data() as Map<String, dynamic>;
        String docId = docSnapshot.id;
        restData.putIfAbsent("docId", () => docId);
        _restaurants.add(restData);
      }
      
    } catch (e) {
      print("Something went wrong ${e.toString()}");
      _error=e.toString();
    }
    finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}
