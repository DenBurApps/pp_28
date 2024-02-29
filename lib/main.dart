import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '/services/navigation/route_names.dart';
import '/services/navigation/routes.dart';
import '/services/service_locator.dart';
import '/themes/app_theme.dart';

Future<void> main() async {
 final widgetsBinding =  WidgetsFlutterBinding.ensureInitialized();
 FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
      title: 'SecureWalletPass',
      theme: DefaultThemeGetter.get(),
      routes: Routes.get(context),
      initialRoute: RouteNames.splash,
    );
  }
}