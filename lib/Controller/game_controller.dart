import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
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
  var song = true;
  final player = AudioPlayer();

  void movePecas(int pos, context) {
    if (game.movePecas(pos) && !fim) {
      jogadas++;
      if (song) tocarSom();

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

  Future<void> reinicarJogo() async {
    jogadas = 0;
    segundos = 0;
    gameStart = false;
    fim = false;
    timer?.cancel();
    game.shuffleTabuleiro();
    await player.setSource(AssetSource('transition.wav'));
  }

  void setNome(nome) {
    this.nome = nome;
    notifyListeners();
  }

  Future<void> tocarSom() async {
    await player.setSource(AssetSource('transition.wav'));
    await player.resume();
  }

  Future<void> tocarSomWin() async {
    await player.setSource(AssetSource('win.wav'));
    await player.resume();
  }

  void mutar() {
    if (song == true) {
      song = false;
    } else {
      song = true;
    }
    notifyListeners();
  }
}
