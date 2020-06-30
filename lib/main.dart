import 'package:flutter/material.dart';
import 'package:login/models/user.dart';
import 'package:login/screens/authenticate/login.dart';
import 'package:login/screens/authenticate/signup.dart';
import 'package:login/screens/home/home.dart';
import 'package:login/screens/product.dart';
import 'package:login/screens/sidebar/sidebar_layout.dart';
import 'package:login/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:login/screens/authenticate/authservice.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
       value: Authservice().user,
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Wrapper(),
      ),
    );
  }
}




  