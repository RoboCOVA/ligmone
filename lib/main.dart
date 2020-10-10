import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ligmone/root/root.dart';
import 'package:ligmone/services/authService.dart';
import 'package:ligmone/utils/appTheme.dart';
import 'package:provider/provider.dart';

//Run|Debug;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: MaterialApp(
        title: 'LIGMONE',
        theme: AppTheme().buildTheme(),
        debugShowCheckedModeBanner: false,
        home: OurRoot(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Ligmone',
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.white,
//         fontFamily: "Muli",
//         textTheme: TextTheme(
//           bodyText1: TextStyle(color: kTextColor),
//           bodyText2: TextStyle(color: kTextColor),
//         ),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       // home: SplashScreen(),
//       // We use routeName so that we dont need to remember the name
//       initialRoute: SplashScreen.routeName,
//      // routes: routes,
//     );
//   }
// }
