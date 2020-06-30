import 'package:flutter/material.dart';
import 'package:login/screens/sidebar/navigation_bloc.dart';

class Wishlist extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Your Wishlist",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
  }
}