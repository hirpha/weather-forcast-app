import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Weathe app',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color(0xff14306F),
        primarySwatch: Colors.blue,
      ),
    );
  }
}
