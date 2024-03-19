import 'package:ecommerce/features/product_detail/view/product_detail_view.dart';
import 'package:ecommerce/features/profile/view/profile_view.dart';
import 'package:ecommerce/features/register/view/register_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/view/wrapper_view.dart';
import '../../utils/routes/routes_name.dart';
import '../../features/auth/view/auth_view.dart';
import '../../features/home/view/home_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.wrapperView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Wrapper());

      case RoutesName.loginView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AuthView());

      case RoutesName.registerView:
        return MaterialPageRoute(
            builder: (BuildContext context) => RegisterView());

      case RoutesName.profileView:
        return MaterialPageRoute(
            builder: (BuildContext context) => ProfileView());

      case RoutesName.homeView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());

      case RoutesName.productDetailView:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                ProductDetailView(id: settings.arguments as int));

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
