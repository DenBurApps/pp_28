import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_28/helpers/dialog_helper.dart';
import 'package:pp_28/models/arguments.dart';
import 'package:pp_28/services/remote_config_service.dart';
import 'package:pp_28/widgets/screens/agreement.dart';
import '../../services/navigation/route_names.dart';
import '../../storage/storage_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final _remoteConfigService = GetIt.instance<RemoteConfigService>();
  final _storageService = GetIt.instance<StorageService>();
  final _connectivity = Connectivity();

  late bool usePrivacyAgreement;

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    await _initConnectivity(
      () async => await DialogHelper.showNoInternetDialog(context),
    );
    usePrivacyAgreement = _remoteConfigService.getBool(ConfigKey.usePrivacy);
    _navigate();
  }

  Future<void> _initConnectivity(Future<void> Function() callback) async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        await callback.call();
        return;
      }
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }
  }

  void _navigate() {
    if (usePrivacyAgreement) {
      final seenOnboarding =
          _storageService.getBoolOrFalse(StorageKeys.seenOnboarding);
      if (!seenOnboarding) {
        Navigator.of(context).pushReplacementNamed(RouteNames.onboarding);
      } else {
        final seenPrivacyAgreement =
            _storageService.getBoolOrFalse(StorageKeys.seenPrivacyAgreement);
        if (!seenPrivacyAgreement) {
          _storageService.setBool(StorageKeys.seenPrivacyAgreement, true);
          DialogHelper.showPrivacyAgreementDialog(
            context,
            yes: () => Navigator.of(context).pushReplacementNamed(
              RouteNames.agreement,
              arguments: AgreementViewArguments(
                agreementType: AgreementType.privacy,
                usePrivacyAgreement: true,
              ),
            ),
            no: () => Navigator.of(context).pushReplacementNamed(
              RouteNames.homeMenu,
            ),
          );
        } else {
          Navigator.of(context).pushReplacementNamed(RouteNames.homeMenu);
        }
      }
    } else {
      Navigator.of(context).pushReplacementNamed(RouteNames.privacy);
    }
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
