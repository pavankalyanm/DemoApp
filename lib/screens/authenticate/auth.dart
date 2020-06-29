import 'package:flutter/material.dart';
import 'package:login/screens/authenticate/login.dart';
import 'package:login/screens/authenticate/signup.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogin=false;
    void widview(){
      setState(()=>showLogin=!showLogin);
    }
  @override
  Widget build(BuildContext context) {
    
    if (showLogin) {
      return Login(widview: widview);
      
    }else{
      return Signup(widview: widview);
    }
    
    
  }
}