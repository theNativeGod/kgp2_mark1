import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kgp2_mark1/views/profanity_screen.dart';
import 'package:provider/provider.dart';

import 'models/photo.dart';
import 'models/script.dart';
import 'views/home_screen.dart';
import 'views/nudity_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Script()),
        ChangeNotifierProvider(create: (ctx) => Photo()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KGP2 Mark-1',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
