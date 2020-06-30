import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan[50],
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.cyan,
          size: 50.0,
        ),
      ),
    );
  }
}
