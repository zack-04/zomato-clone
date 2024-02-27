import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class OrderProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _orders = [];
  bool _isLoading = false;
  String _error = '';

  //getter
  List<Map<String, dynamic>> get orders => _orders;
  bool get isLoading => _isLoading;
  String get error => _error;

  final CollectionReference ordersRef =
      FirebaseFirestore.instance.collection("Orders");

  Future fetchOrders() async {
    _isLoading = true;
    notifyListeners();
    try {
      QuerySnapshot querySnapshot = await ordersRef.get();

      for (var docSnapshot in querySnapshot.docs) {
        Map<String, dynamic> restData =
            docSnapshot.data() as Map<String, dynamic>;
        String docId = docSnapshot.id;
        restData.putIfAbsent("docId", () => docId);
        _orders.add(restData);
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
