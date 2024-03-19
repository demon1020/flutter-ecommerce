import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/services/auth_service.dart';
import '../repository/auth_repository.dart';
import '../../../utils/global.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';

class AuthViewModel with ChangeNotifier {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  final _myRepo = AuthRepository();

  bool loading = false;

  setLoading(isLoading){
    loading = isLoading;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data) async {
    setLoading(true);

    var response = await _myRepo.login(data);

    response.fold((failure) => Utils.flushBarErrorMessage(failure.message),
        (loginResponse) async {
      final authService = Provider.of<AuthService>(
          navigatorKey.currentContext!,
          listen: false);
      authService.saveUser(loginResponse);

      Utils.snackBar('Login Successfully');
      Navigator.pushReplacementNamed(navigatorKey.currentContext!, RoutesName.homeView);
    });
    setLoading(false);
    notifyListeners();
  }

  void disposeData(){
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }
}
