import 'package:flutter/material.dart';
import 'package:login/models/user.dart';
import 'package:login/screens/authenticate/login.dart';
import 'package:login/screens/authenticate/signup.dart';
import 'package:login/screens/home/home.dart';
import 'package:login/screens/sidebar/sidebar_layout.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {

    final user =Provider.of<User>(context);
   
    if (user==null){
      return Login();

    }else{
      return SideBarLayout();
    }
    
  }
}