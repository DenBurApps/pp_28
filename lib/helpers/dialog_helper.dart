import 'package:flutter/cupertino.dart';
import 'package:pp_28/services/navigation/route_names.dart';


class DialogHelper {
  static Future<void> showNoInternetDialog(BuildContext context) async =>
      await showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('No Internet Connection'),
          content: const Text(
              'You have lost your internet connection. Please check your settings and try again.'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteNames.splash,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      );

}