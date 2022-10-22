import 'package:flutter/material.dart';
import 'package:restaurant/model/RestaurantResponse.dart';
import 'package:restaurant/ui/pages/DetailScreen.dart';
import 'package:restaurant/ui/pages/HomeScreen.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/homescreen': (context) => const HomeScreen(),
          DetailScreen.routeName: (context) => DetailScreen(
                restaurant:
                    ModalRoute.of(context)?.settings.arguments as Restaurant,
              ),
        });
  }
}
