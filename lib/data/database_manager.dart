import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference restaurantsRef =
      FirebaseFirestore.instance.collection("Restaurants");
  final CollectionReference ordersRef =
      FirebaseFirestore.instance.collection("Orders");

  Future getMenuItems(String docId) async {
    List menuItems = [];

    try {
      QuerySnapshot querySnapshot =
          await restaurantsRef.doc(docId).collection('MenuItems').get();

      for (var docSnapshot in querySnapshot.docs) {
        Map<String, dynamic> menuItemsData =
            docSnapshot.data() as Map<String, dynamic>;
        menuItems.add(menuItemsData);
      }

      return menuItems;
    } catch (e) {
      print("Something went wrong ${e.toString()}");
      return [];
    }
  }

  Future createOrder(
      double totalAmount, List<Map<String, dynamic>> items,String resName) async {

    final orderData = {
      "totalAmount": totalAmount,
      "orderDate": Timestamp.now(),
      "orderItems": items,
      "resName":resName,

    };

    await ordersRef.doc().set(orderData).onError(
        (error, stackTrace) => print("Error writing document: $error"));
  }
}
