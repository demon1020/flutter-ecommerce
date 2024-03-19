import 'package:flutter/material.dart';

import '../repository/auth_repository.dart';

class AuthViewModel with ChangeNotifier {

  final _myRepo = ProfileRepository();

  bool loading = false;
  bool isEdit = false;

  setLoading(isLoading){
    loading = isLoading;
    notifyListeners();
  }

}
