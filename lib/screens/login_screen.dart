import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/RoundedButton.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              style: TextStyle(color: Colors.grey.shade400),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextInputFieldDecoration.copyWith(
                hintText: 'Enter Your Email',
                hintStyle: TextStyle(color: Colors.grey.shade400),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              style: TextStyle(color: Colors.grey.shade400),
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextInputFieldDecoration.copyWith(
                hintText: 'Enter Your Password',
                hintStyle: TextStyle(color: Colors.grey.shade400),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Login In',
              colour: Colors.lightBlueAccent,
              onPressed: () async {
                try {
                  final loginUser = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (loginUser != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
