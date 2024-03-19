import 'dart:developer';

import '../../core.dart';
import '../../features/auth/model/user_model.dart';

class AuthService with ChangeNotifier{
  UserModel? user;

  Future<bool> saveUser(UserModel user)async{
    final stringStorage = StringSecureStorageService();
    await stringStorage.setItem('token', user.token.toString());
    final token = await stringStorage.getItem('token');
    log('token: $token');
    notifyListeners();
    return true ;
  }

  Future<UserModel?> getUser()async{
    final stringStorage = StringSecureStorageService();
    final token = await stringStorage.getItem('token');
    if(token == null){
      return null;
    }
    user = UserModel(token: token.toString());
    return user;
  }

  Future<bool> remove()async{
    final stringStorage = StringSecureStorageService();
    stringStorage.deleteItem('token');
    return true;
  }
}