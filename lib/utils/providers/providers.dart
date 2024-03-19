
import 'package:ecommerce/data/services/auth_service.dart';
import 'package:ecommerce/features/product_detail/view_model/product_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/auth/view_model/auth_view_model.dart';
import '../../features/home/view_model/home_view_model.dart';
import '../../features/register/view_model/register_view_model.dart';

class Providers {
  static List<SingleChildWidget> getAllProviders() {
    List<SingleChildWidget> _providers = [
      ChangeNotifierProvider(create: (context) => AuthService()),
      ChangeNotifierProvider(create: (context) => AuthViewModel()),
      ChangeNotifierProvider(create: (context) => RegisterViewModel()),
      ChangeNotifierProvider(create: (context) => HomeViewViewModel()),
      ChangeNotifierProvider(create: (context) => ProductViewModel()),
    ];
    return _providers;
  }
}
