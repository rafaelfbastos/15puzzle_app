import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_15/Controller/game_controller.dart';
import 'package:puzzle_15/custom_widgets/pecas.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pecas(
                      onTap: () => game.movePecas(0, context),
                      label: game.game.tabuleiro[0]),
                  const SizedBox(width: 5),
                  Pecas(
                      onTap: () => game.movePecas(1, context),
                      label: game.game.tabuleiro[1]),
                  const SizedBox(width: 5),
                  Pecas(
                      onTap: () => game.movePecas(2, context),
                      label: game.game.tabuleiro[2]),
                  const SizedBox(width: 5),
                  Pecas(
                      onTap: () => game.movePecas(3, context),
                      label: game.game.tabuleiro[3])
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pecas(
                      onTap: () => game.movePecas(4, context),
                      label: game.game.tabuleiro[4]),
                  const SizedBox(width: 5),
                  Pecas(
                      onTap: () => game.movePecas(5, context),
                      label: game.game.tabuleiro[5]),
                  const SizedBox(width: 5),
                  Pecas(
                      onTap: () => game.movePecas(6, context),
                      label: game.game.tabuleiro[6]),
                  const SizedBox(width: 5),
                  Pecas(
                      onTap: () => game.movePecas(7, context),
                      label: game.game.tabuleiro[7])
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pecas(
                      onTap: () => game.movePecas(8, context),
                      label: game.game.tabuleiro[8]),
                  const SizedBox(width: 5),
                  Pecas(
                      onTap: () => game.movePecas(9, context),
                      label: game.game.tabuleiro[9]),
                  const SizedBox(width: 5),
                  Pecas(
                      onTap: () => game.movePecas(10, context),
                      label: game.game.tabuleiro[10]),
                  const SizedBox(width: 5),
                  Pecas(
                      onTap: () => game.movePecas(11, context),
                      label: game.game.tabuleiro[11])
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pecas(
                      onTap: () => game.movePecas(12, context),
                      label: game.game.tabuleiro[12]),
                  const SizedBox(width: 5),
                  Pecas(
                      onTap: () => game.movePecas(13, context),
                      label: game.game.tabuleiro[13]),
                  const SizedBox(width: 5),
                  Pecas(
                      onTap: () => game.movePecas(14, context),
                      label: game.game.tabuleiro[14]),
                  const SizedBox(width: 5),
                  Pecas(
                      onTap: () => game.movePecas(15, context),
                      label: game.game.tabuleiro[15])
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "${game.jogadas}",
                style: GoogleFonts.orbitron(
                    fontSize: 40, color: const Color(0xffffe73c)),
              ),
              const SizedBox(
                height: 40,
              ),
              RichText(
                text: TextSpan(
                    text: "Tempo: ",
                    style: GoogleFonts.orbitron(fontSize: 24),
                    children: [
                      TextSpan(
                          text: game.tempoDeJogo(),
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
