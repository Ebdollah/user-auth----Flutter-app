// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:userauth/homepage.dart';
import 'package:userauth/login.dart';
import 'package:userauth/wrapper.dart';
import 'package:userauth/signup.dart';


class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController email = TextEditingController();

  forgot() async {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(
          email: email.text);
      Get.offAll(Wrapper());
      // Your sign-in logic here
    } catch (e) {
      print('Could not reset password failed: $e');
      // Handle the error and provide appropriate feedback to the user
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'Enter Email'),
            ),
            ElevatedButton(
              onPressed: () {
                forgot();
              },
              child: Text('reset password'),
            )
          ],
        ),
      ),
    );
 
  }
}