import 'package:flutter/material.dart';
import 'package:flutter_client/models/user_model.dart';
import 'package:flutter_client/services/user_services.dart';

class UserProvider with ChangeNotifier {
  final UserService _userServices = UserService();
  List<User> _users = [];

  // getter
  List<User> get users => _users;

  // initialize
  UserProvider() {
    fetchAllUsers();
  }

  //todo: fetch user
  Future<void> fetchAllUsers() async {
    try {
      _users = await _userServices.getAllUsers();
      notifyListeners();
    } catch (error) {
      print("Error geting user with provide: $error");
    }
  }

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

  // todo: delete user
  Future<void> deleteUser(String id) async {
    try {
      await _userServices.deleteUser(id);
      _users.removeWhere(
        (user) => user.id == id,
      );
      notifyListeners();
    } catch (error) {
      print("deleting user with provider: $error");
    }
  }

  // todo: update user
  Future<void> updateUser(User user) async {
    try {
      await _userServices.updateUser(user);

      // get the index of uodated user
      int index = _users.indexWhere((userinList) => userinList.id == user.id);
      if (index != -1) {
        _users[index] = user;
        notifyListeners();
      }
    } catch (error) {
      print("Error updating user with provider $error");
    }
  }
}
