import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import '../../services/navigation/route_names.dart';
import '../../storage/storage_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final _storageService = GetIt.instance<StorageService>();

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () => _navigate());
    super.initState();
  }

  void _navigate() {
    final isFirstLaunch =
        _storageService.getBool(StorageKeys.isFirstLaunch) ?? true;
    if (isFirstLaunch) {
      _storageService.setBool(StorageKeys.isFirstLaunch, false);
      Navigator.of(context).popAndPushNamed(RouteNames.onboarding);
    } else {
      Navigator.of(context).popAndPushNamed(RouteNames.homeMenu);
    }
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
