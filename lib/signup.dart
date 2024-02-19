// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:userauth/homepage.dart';
import 'package:userauth/login.dart';
import 'package:userauth/wrapper.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signup() async {
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      Get.offAll(Wrapper());
      // Your sign-in logic here
    } catch (e) {
      print('Sign-up failed: $e');
      // Handle the error and provide appropriate feedback to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'Enter Email'),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(hintText: 'Enter Password'),
            ),
            ElevatedButton(
              onPressed: () {
                signup();
              },
              child: Text('Signup'),
            )
          ],
        ),
      ),
    );
  }
}