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
        body: Center(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/bemvindo.png"),
            ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(20))),
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
                          color: Color(0xff6a5c00),
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
