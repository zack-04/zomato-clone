import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zomato_clone/data/options_data.dart';
import 'package:zomato_clone/provider/user_provider.dart';
import 'package:zomato_clone/screens/home_screen.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key, required this.label});

  final List<String> label;

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final TextEditingController _name = TextEditingController();
  late TextEditingController _mobile;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _anniversary = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  String? _initialValue;

  Future<void> _selectDate(BuildContext context) async {
    if (selectedDate == null) {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (pickedDate != null) {
        setState(() {
          selectedDate = pickedDate;
          _dob.text = pickedDate.toLocal().toString().split(' ')[0];
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    _mobile = TextEditingController(text: userProvider.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Your Profiles',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.grey[200],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/images/img1.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white30,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.penToSquare,
                            size: 18,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _globalKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field can't be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text(
                            label.elementAt(0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _mobile,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field can't be empty";
                          } else if (value.length < 10) {
                            return "Enter valid number";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text(
                            label.elementAt(1),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          suffixIcon: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'CHANGE',
                              style: TextStyle(color: Colors.pink),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field can't be empty";
                          } else if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return null;
                          }
                          return "Invalid Email";
                        },
                        decoration: InputDecoration(
                          label: Text(
                            label.elementAt(2),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          suffixIcon: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'CHANGE',
                              style: TextStyle(color: Colors.pink),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _dob,
                        readOnly: true,
                        decoration: InputDecoration(
                          label: Text(
                            label.elementAt(3),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              selectedDate == null
                                  ? _selectDate(context)
                                  : showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Warning'),
                                          content: const Text(
                                              'You have already selected a date. '),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                            },
                            icon: const Icon(FontAwesomeIcons.calendarDays),
                          ),
                          helperText: 'This cannot be edited later',
                          helperStyle: const TextStyle(
                            color: Color.fromARGB(255, 172, 131, 7),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _anniversary,
                        decoration: InputDecoration(
                          label: Text(
                            label.elementAt(4),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          helperText: 'This cannot be edited later',
                          helperStyle: const TextStyle(
                            color: Color.fromARGB(255, 172, 131, 7),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150,
                        child: TextFormField(
                          controller: _gender,
                          decoration: InputDecoration(
                            label: Text(
                              label.elementAt(5),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.black),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            suffixIcon: Container(
                              padding: const EdgeInsets.only(right: 20),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  icon: const Icon(FontAwesomeIcons.sortDown),
                                  onChanged: (newValue) {
                                    setState(() {
                                      _gender.text = newValue!;
                                    });
                                  },
                                  items: <String>['Male', 'Female', 'Other']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      //bottom sheet
      bottomSheet: Container(
        color: Colors.white,
        width: double.infinity,
        height: 100,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[200],
          ),
          child: TextButton(
            onPressed: () {
              if (_globalKey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              }
            },
            child: const Text(
              'Update profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black26,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
