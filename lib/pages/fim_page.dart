import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_15/Controller/game_controller.dart';

class Fim extends StatefulWidget {
  const Fim({Key? key}) : super(key: key);

  @override
  State<Fim> createState() => _FimState();
}

class _FimState extends State<Fim> {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameController>();
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          'Game Over',
          style: GoogleFonts.pressStart2p(
              fontSize: 18, color: const Color(0xffffe73c)),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/parabens.png"),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                  text: "Jogadas: ",
                  style: GoogleFonts.pressStart2p(
                      fontSize: 18, color: const Color(0xffffe73c)),
                  children: [
                    TextSpan(
                      text: "${game.jogadas}",
                      style: const TextStyle(color: Colors.red),
                    )
                  ]),
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                text: "Tempo: ",
                style: GoogleFonts.pressStart2p(
                    fontSize: 18, color: const Color(0xffffe73c)),
                children: [
                  TextSpan(
                    text: game.tempoDeJogo(),
                    style: const TextStyle(color: Colors.red),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
