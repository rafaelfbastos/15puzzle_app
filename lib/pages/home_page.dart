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
            '15 Puzzle',
            style: GoogleFonts.pressStart2p(
                fontSize: 18, color: const Color(0xffffe73c)),
          ),
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/backgroud.png"),
              fit: BoxFit.fill,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(20))),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/game");
                    game.reinicarJogo();
                  },
                  child: Text(
                    "Começar",
                    style: GoogleFonts.pressStart2p(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffffe73c),
                        shadows: <Shadow>[
                          const Shadow(
                              color: Color(0xfff6a5c00),
                              blurRadius: 15,
                              offset: Offset(0, 3))
                        ]),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
