import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/screens/home_screen.dart';

class ConfirmOrder extends StatefulWidget {
  ConfirmOrder({super.key});

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  late ConfettiController controller;

  // Function to play the confirmation sound
  void playConfirmationSound() {
    // Load the audio file
    AssetsAudioPlayer.newPlayer().open(
    Audio("assets/audio/zomato_sound.mp3"),
    autoStart: true,
    showNotification: false,
);
   
  }

  @override
  void initState() {
    super.initState();
    controller = ConfettiController(duration: const Duration(seconds: 5));
    controller.play();
    playConfirmationSound();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConfettiWidget(
              confettiController: controller,
               blastDirectionality: BlastDirectionality.explosive,
              numberOfParticles: 20,
              shouldLoop: false,
              blastDirection: -pi/2,
            ),
            Container(
              width: 150,
              child: Image.asset('assets/images/tick.jpg'),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: const Text(
                'Order confirmed',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),);
                },
                child: Text('Go to home'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
