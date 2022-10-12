import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:puzzle_15/models/game.dart';

class GameController extends ChangeNotifier {
  final game = Game();
  var jogadas = 0;
  var gameStart = false;
  Timer? timer;
  var segundos = 0;
  var fim = false;
  var nome = "";

  void movePecas(int pos, context) {
    if (game.movePecas(pos) && !fim) {
      jogadas++;

      if (!gameStart) {
        startTime();
        gameStart = true;
      }
      if (game.verificarFim()) {
        timer?.cancel();
        fim = true;
        Navigator.of(context).popAndPushNamed("/fim");
      }
    }
    notifyListeners();
  }

  void startTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      segundos++;
      notifyListeners();
    });
  }

  String tempoDeJogo() {
    Duration duration = Duration(seconds: segundos);

    var format = NumberFormat("00");
    var seg = format.format(duration.inSeconds.remainder(60));
    var min = format.format(duration.inMinutes.remainder(60));

    return "$min : $seg";
  }

  void reinicarJogo() {
    jogadas = 0;
    segundos = 0;
    gameStart = false;
    fim = false;
    timer?.cancel();
    game.shuffleTabuleiro();
  }

  void setNome(nome) {
    this.nome = nome;
    notifyListeners();
  }
}
