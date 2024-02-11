import 'package:flutter/material.dart';
import 'package:zomato_clone/screens/main_food_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          //container having indian flag and text field
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  height: 52,
                  padding: const EdgeInsets.only(left: 13),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/indian_flag.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                //text field
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your phone number',
                        hintStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //button
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(226, 55, 68, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainFoodPage(),
                  ),
                );
              },
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
