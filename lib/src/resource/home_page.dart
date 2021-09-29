import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  String user;
  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ứng dụng tikop"),
      ),
      body: Center(
        child: Text("Chào bạn : " + user),
      ),
    );
  }
}
