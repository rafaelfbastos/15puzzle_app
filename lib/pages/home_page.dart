import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_15/Controller/game_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameController>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '15Puzzle',
            style:
                GoogleFonts.acme(fontSize: 25, color: const Color(0xffffe73c)),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/game");
                    game.reinicarJogo();
                  },
                  child: Text("Começar"))
            ],
          ),
        ));
  }
}
