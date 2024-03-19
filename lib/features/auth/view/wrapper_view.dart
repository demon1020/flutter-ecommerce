import 'package:ecommerce/data/services/auth_service.dart';
import 'package:ecommerce/features/auth/view/auth_view.dart';
import 'package:ecommerce/features/home/view/home_view.dart';

import '../../../core.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final authService = Provider.of<AuthService?>(context, listen: false);
    authService?.getUser();
  }
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService?>(context);
    if (authService?.user?.token != null) {
      return const HomeView();
    } else {
      return const AuthView();
    }
  }
}
