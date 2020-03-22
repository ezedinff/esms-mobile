import 'package:flutter/material.dart';


class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: CircularProgressIndicator(),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Center(
        child: Loader(),
      ),
    );
  }
}