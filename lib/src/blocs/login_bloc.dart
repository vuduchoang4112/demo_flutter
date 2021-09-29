import 'dart:async';

import 'package:application_test/src/validators/validators.dart';

class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;
  bool isValidInfo(String user, String pass){
    if(!Validations.isValidUser(user)){
      _userController.sink.addError("Email không hợp lệ");
      return false;
    }
    _userController.sink.add("Ok");

    if(!Validations.isValidPass(pass)){
      _userController.sink.addError("Mật khẩu phải lớn hơn 6 kí tự");
      return false;
    }
    _passController.sink.add("Ok");

    return true;
  }

  void dispose(){
    _userController.close();
    _passController.close();
  }
}