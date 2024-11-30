import 'package:flutter/material.dart';
import 'package:flutter_client/models/user_model.dart';
import 'package:flutter_client/services/user_services.dart';

class UserProvider with ChangeNotifier {
  final UserService _userServices = UserService();
  List<User> _users = [];

  // getter
  List<User> get users => _users;

  //todo: fetch user

  // todo: create user
  Future<void> addUser(User user) async {
    try {
      await _userServices.createUser(user);
      _users.add(user);

      notifyListeners();
    } catch (error) {
      print("Error adding user with provide package $error");
    }
  }
}
