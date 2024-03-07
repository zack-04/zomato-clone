import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  bool _isLoading = false;
  String _error = '';

  String _name = '';
  String _email = '';
  String _dob = '';
  String _phoneNumber = '';
  String _gender = '';

  bool get isLoading => _isLoading;
  String get error => _error;
  
  String get name => _name;
  String get email => _email;
  String get dob => _dob;
  String get phoneNumber => _phoneNumber;
  String get gender => _gender;

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }
  //  Future<void> updateUserDetails(String name, String dob, String email, String gender) async {
  //   String uid = FirebaseAuth.instance.currentUser!.uid;
  //   await FirebaseFirestore.instance.collection('users').doc(uid).update({
  //     'name': name,
  //     'dob': dob,
  //     'email': email,
  //     'gender': gender,
  //   });

  //   _name = name;
  //   _dob = dob;
  //   _email = email;
  //   _gender = gender;

  //   notifyListeners();
  // }

  // Function to fetch user details based on phone number

  Future<void> fetchUserDetailsByPhoneNumber(String phoneNumber) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming there's only one user with a given phone number
        Map<String, dynamic> userData =
            querySnapshot.docs.first.data() as Map<String, dynamic>;
        print("-----------------------");
        print(userData);
        _name = userData["name"];
        _email = userData["email"];
        _dob = userData["dob"];
        _gender = userData["gender"];
        _phoneNumber = userData["phoneNumber"];

        notifyListeners();
      }
    } catch (error) {
      print('Error fetching user details: $error');
    }
  }
}
