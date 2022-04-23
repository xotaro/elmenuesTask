import 'dart:convert';

import 'package:elmenues/login_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import 'constants.dart';
import 'package:http/http.dart' as http;

@injectable
class ProfileViewModel extends ChangeNotifier {
  String name = "";
  String pic = "";
  LoginViewModel _loginViewModel;
  ProfileViewModel(this._loginViewModel) {
    name = _loginViewModel.name;
    pic = _loginViewModel.picture;
  }
  Future<Map<String, dynamic>> changeName(String name) async {
    print(_loginViewModel.userIdToken);
    var url =
        'https://$AUTH0_DOMAIN/api/v2/users/${_loginViewModel.userIdToken}';
    final response = await http.patch(Uri.parse(url),
        headers: {'Authorization': 'Bearer $MANAGMENT_TOKEN'},
        body: {'name': '$name'});
    name = jsonDecode(response.body)["name"];
    notifyListeners();
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user details');
    }
  }
}
