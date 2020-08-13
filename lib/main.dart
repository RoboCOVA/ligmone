import 'package:flutter/material.dart';
import 'package:ligmone/root/root.dart';
import 'package:ligmone/states/currentUser.dart';
import 'package:ligmone/utils/appTheme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
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
