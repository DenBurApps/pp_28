import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/services/navigation/route_names.dart';
import '/services/navigation/routes.dart';
import '/services/service_locator.dart';
import '/themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final serviceLocator = ServiceLocator();
  await serviceLocator.setup();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet app',
      theme: DefaultThemeGetter.get(),
      routes: Routes.get(context),
      initialRoute: RouteNames.splash,
    );
  }
}