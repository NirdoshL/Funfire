import 'package:flutter/material.dart';
import 'package:funfire/Payment/khaltipage.dart';
import 'package:khalti_flutter/khalti_flutter.dart';



class KhaltiPaymentApp extends StatelessWidget {
  const KhaltiPaymentApp({Key? key,required this.fee}) : super(key: key);
  final String fee;
  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: "public_key_",
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
            home: KhaltiPaymentPage(fee:fee),
          );
        });
  }
}