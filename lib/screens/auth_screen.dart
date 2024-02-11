import 'package:flutter/material.dart';

import 'package:zomato_clone/screens/welcome_page.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WelcomePage(),
              ),
            );
          },
          child: const Text('Get Started'),
        ),
      ),
    );
  }
}
