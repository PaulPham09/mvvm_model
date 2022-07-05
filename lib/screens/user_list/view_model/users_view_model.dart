import 'package:flutter/material.dart';
import 'package:mvvm_model/models/user.dart';
import 'package:mvvm_model/repositories/api_status.dart';
import 'package:mvvm_model/repositories/user_service.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userList = [];
  // UserError _userError;

  UsersViewModel() {
    getUsers();
  }

  bool get loading => _loading;
  List<UserModel> get userList => _userList;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserList(List<UserModel> userList) async {
    _userList = userList;
    notifyListeners();
  }

  getUsers() async {
    setLoading(true);
    await Future.delayed(Duration(seconds: 2));
    final response = await UserService.getUser();
    if (response is Success) {
      setUserList(response.response as List<UserModel>);
    }
    if (response is Failure) {}
    setLoading(false);
  }
}
