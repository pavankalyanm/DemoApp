import 'package:flutter/material.dart';
import 'package:login/screens/authenticate/login.dart';
import 'package:login/screens/authenticate/signup.dart';
import 'package:login/screens/home/home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Signup();
  }
}