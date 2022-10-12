import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_15/Controller/game_controller.dart';
import 'package:puzzle_15/pages/fim_page.dart';
import 'package:puzzle_15/pages/game_page.dart';
import 'package:puzzle_15/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (__) => GameController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          "/": (context) => const Home(),
          "/game": (context) => const Game(),
          "/fim": (context) => const Fim()
        },
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[900],
          primarySwatch: Colors.grey,
        ),
        initialRoute: "/",
      ),
    );
  }
}
