import 'package:application_test/src/blocs/login_bloc.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var bloc = new LoginBloc();

  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                    width: 70,
                    height: 70,
                    padding: EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white70),
                    child: FlutterLogo()),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  "Xin Chào\nBạn",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: StreamBuilder(
                    stream: bloc.userStream,
                    builder: (context, snapshot) => TextField(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          controller: _userController,
                          decoration: InputDecoration(
                              labelText: "Email",
                              errorText: snapshot.hasError ? snapshot.error.toString() : null,
                              labelStyle: TextStyle(color: Color(0xff888888))),
                        )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    StreamBuilder(
                        stream: bloc.passStream,
                        builder: (context, snapshot) => TextField(
                              style: TextStyle(fontSize: 18, color: Colors.black),
                              controller: _passController,
                              obscureText: !_showPass,
                              decoration: InputDecoration(
                                  labelText: "Mật khẩu",
                                  errorText: snapshot.hasError ? snapshot.error.toString() : null,
                                  labelStyle: TextStyle(color: Color(0xff888888))),
                            )
                    ),
                    GestureDetector(
                      onTap: onToggleShowPass,
                      child: Text(_showPass ? "Ẩn" : "Hiện",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      onPressed: onSignInClick,
                      child: Text(
                        "Đăng nhập",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                ),
              ),
              Container(
                height: 130,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Người dùng mới? Đăng ký",
                      style: TextStyle(fontSize: 15, color: Color(0xff888888)),
                    ),
                    Text(
                      "Quên mật khẩu",
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClick() {
    if (bloc.isValidInfo(_userController.text, _passController.text)) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(_userController.text)));
    }
  }


}
