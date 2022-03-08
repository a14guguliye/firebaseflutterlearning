import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[400],
      child: const Center(
        child: SpinKitChasingDots(
          color: Colors.red,
          size: 30,
          duration: Duration(seconds: 2),
        ),
      ),
    );
  }
}
