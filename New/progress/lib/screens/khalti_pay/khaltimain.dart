import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:progress/screens/khalti_pay/khaltibody.dart';


class KhaltiPaymentApp extends StatelessWidget {
  const KhaltiPaymentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: "test_public_key_30e12814fed64afa9a7d4a92a2194aeb",
        builder: (context, navigatorKey) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
            KhaltiLocalizations.delegate,
            ],
            theme: ThemeData(
            primaryColor: const Color(0xFF56328c),
            appBarTheme: const AppBarTheme(
            color: Color(0xFF56328c),
            )),
            title: 'Khalti Payment',
            home: const KhaltiPaymentPage(),
          );
        });
  }
}