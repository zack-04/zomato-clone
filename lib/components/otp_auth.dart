import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/screens/home_screen.dart';

class OtpAuth extends StatefulWidget {
  OtpAuth({
    super.key,
    required this.verificationId,
  });
  String verificationId;

  @override
  State<OtpAuth> createState() => _OtpAuthState();
}

class _OtpAuthState extends State<OtpAuth> {
  // TextEditingController otpController = TextEditingController();
  List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter OTP',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
              6,
              (index) => SizedBox(
                width: 40,
                child: TextField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  onChanged: (value) {
                    if(value.length==1 && index<5){
                      _focusNodes[index+1].requestFocus();
                    }
                    else if(value.isEmpty&&index>0){
                      _focusNodes[index-1].requestFocus();
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(8),
                    )
                  ),
                ),
              ),
            ),),
            SizedBox(height: 70,),
            Container(
              
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black,),
              child: TextButton(
              onPressed: () async {
                try {
                  String otpCode = _controllers.map((e) => e.text.toString()).join('');
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: otpCode,
                      
                  );
                  FirebaseAuth.instance.signInWithCredential(credential).then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        ),
                      );
                } catch (ex) {
                  print("ERROR: " + ex.toString(),);
                }
              },
              child:  Text('Verify OTP',style: TextStyle(color: Colors.white),),
                        ),
            ),
          ],
        ),
      ),
      // body: Column(
      //   children: [
      //     Container(
      //       margin: const EdgeInsets.only(top: 100),
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 25),
      //         child: TextField(
      //           controller: otpController,
      //           keyboardType: TextInputType.number,
      //           decoration: InputDecoration(
      //               hintText: 'Enter OTP',
      //               hintStyle: const TextStyle(fontSize: 18),
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(25),
      //               )),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 30,
      //     ),
      //     ElevatedButton(
      //       onPressed: () async {
      //         try {
      //           PhoneAuthCredential credential =
      //               await PhoneAuthProvider.credential(
      //             verificationId: widget.verificationId,
      //             smsCode: otpController.text.toString(),
      //           );
      //           FirebaseAuth.instance.signInWithCredential(credential).then(
      //                 (value) => Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) => const MainFoodPage(),
      //                   ),
      //                 ),
      //               );
      //         } catch (ex) {
      //           print("ERROR: " + ex.toString(),);
      //         }
      //       },
      //       child: const Text('Verify OTP'),
      //     ),
      //   ],
      // ),
    );
  }
}
