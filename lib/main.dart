import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/global.dart';
import '../../utils/providers/providers.dart';
import '../../utils/routes/routes.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/theme/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: Providers.getAllProviders(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: RoutesName.wrapperView,
      onGenerateRoute: Routes.generateRoute,
      navigatorKey: navigatorKey,
    );
  }
}
