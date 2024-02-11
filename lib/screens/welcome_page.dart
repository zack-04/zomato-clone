import 'package:flutter/material.dart';
import 'package:zomato_clone/components/login_form.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void _dismissKeyboard(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus(); // Dismiss the keyboard
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _dismissKeyboard(context);
      },
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/welcome_banner.jpeg'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //text
                Container(
                  width: 300,
                  child: const Text(
                    textAlign: TextAlign.center,
                    "India's #1 Food Delivery and Dining App",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                //text
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 16, right: 12),
                        height: 1,
                        width: 100,
                        color: Colors.grey,
                      ),
                      const Text(
                        'Log in or sign up',
                        style: TextStyle(
                            color: Color.fromARGB(255, 65, 61, 61),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 12, right: 6),
                        height: 1,
                        width: 100,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //text fields
                const LoginForm(),

                const SizedBox(height: 100),
                //text
                const Text(
                  'By continuing, you agree to our',
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 61, 61),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Terms of Service  Privacy Policy  Content Policy',
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 61, 61),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
