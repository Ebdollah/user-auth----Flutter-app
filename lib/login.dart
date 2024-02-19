// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:userauth/homepage.dart';
import 'package:userauth/login.dart';
import 'package:userauth/wrapper.dart';
import 'package:userauth/signup.dart';
import 'package:userauth/forgot.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signin() async {
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      // Your sign-in logic here
    }on FirebaseAuthException catch (e) {
      print('Sign-in failed: $e');
      Get.snackbar('Error:', e.code);
      // Handle the error and provide appropriate feedback to the user
    }
    catch (e) {
      Get.snackbar('Error:', e.toString());
      print('Sign-in failed: $e');
      // Handle the error and provide appropriate feedback to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                signin();
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(Signup());
              },
              child: Text('Register now'), 
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(Forgot());
              },
              child: Text('Forget Password?'),
            ),
          ],
        ),
      ),
    );
  }
}
