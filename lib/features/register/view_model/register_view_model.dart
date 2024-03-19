import 'dart:developer';

import 'package:ecommerce/features/register/model/user_register_model.dart';
import 'package:ecommerce/features/register/repository/register_repository.dart';
import 'package:flutter/material.dart';
import '../../../utils/global.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';

class RegisterViewModel with ChangeNotifier {
  final _myRepo = RegisterRepository();

  bool loading = false;

  setLoading(isLoading){
    loading = isLoading;
    notifyListeners();
  }

  Future<void> registerUserApi(dynamic data) async {
    setLoading(true);

    var response = await _myRepo.register(data);

    response.fold((failure) => Utils.flushBarErrorMessage(failure.message),
        (registerResponse) async {
      log(registerResponse.toString());
      Utils.snackBar('User Registered Successfully');
      Navigator.pushReplacementNamed(navigatorKey.currentContext!, RoutesName.loginView);
    });
    setLoading(false);
    notifyListeners();
  }


}
