import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ligmone/root/root.dart';
import 'package:ligmone/services/authService.dart';
import 'package:ligmone/services/financeServicer.dart';
import 'package:ligmone/services/paymentServicer.dart';
import 'package:ligmone/utils/appTheme.dart';
import 'package:provider/provider.dart';

//Run|Debug;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      Provider<AuthService>(create: (_) => AuthService()),
      ChangeNotifierProvider.value(value: FinanceServicer.initialize()),
      ChangeNotifierProvider.value(value: PaymentServicer.initialize()),
      //  Provider<AnotherThing>(create: (_) => AnotherThing()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LIGMONE',
      theme: AppTheme().buildTheme(),
      debugShowCheckedModeBanner: false,
      home: OurRoot(),
    );
  }
}
