import 'package:anmations_controll/animations/controller.dart';
import 'package:flutter/material.dart';

import 'animations/AnimatedCrossFade/AnimatedSwitcher.dart';
import 'animations/AnimatedCrossFade/Card.dart';
import 'animations/AnimatedCrossFade/changMode.dart';
import 'animations/AnimatedOpacity/fadein_out.dart';
import 'animations/SinglTickerProvider/Benten.dart';
import 'animations/Stack/Animatedposition.dart';
import 'animations/Stack/ChangeMode.dart';
import 'animations/Tween/AnitetedTween.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:Benten()
    );
  }
}
