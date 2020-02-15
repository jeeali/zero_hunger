import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zero_hunger/components/screens/liquid_screen.dart';

import 'components/screens/nav_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'Zero Hunger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          title: TextStyle(
            fontFamily: 'Rubik',
          ),
        )
      ),
      initialRoute: '/liquid',
      routes: {
        '/liquid': (context) => MyLiquidScreen(),
        '/navigation': (context) => NavScreen(),
      },
    );
  }
}
