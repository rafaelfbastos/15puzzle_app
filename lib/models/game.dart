import 'dart:math';
import 'package:flutter/foundation.dart';

class Game {
  final pecas = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0];
  var tabuleiro = [];
  final limitEsquerda = List<int>.generate(4, (index) => index * 4);
  final limitDireita = List<int>.generate(4, (index) => index * 4 + 3);

  Game() {
    tabuleiro = [...pecas];
    tabuleiro.shuffle();
  }
  void swapItens(int pos1, int pos2) {
    int temp = tabuleiro[pos1];
    tabuleiro[pos1] = tabuleiro[pos2];
    tabuleiro[pos2] = temp;
  }

  void shuffleTabuleiro() {
    for (var i = 0; i < 10000; i++) {
      int pos = Random().nextInt(16);
      movePecas(pos);
    }
  }

  bool movePecas(int pos) {
    if (pos - 1 >= 0 && !limitEsquerda.contains(pos)) {
      if (tabuleiro[pos - 1] == 0) {
        swapItens(pos, pos - 1);
        return true;
      }
    }
    if (pos + 1 <= 15 && !limitDireita.contains(pos)) {
      if (tabuleiro[pos + 1] == 0) {
        swapItens(pos, pos + 1);
        return true;
      }
    }
    //verificar cima e baixo
    if (pos - 4 >= 0) {
      if (tabuleiro[pos - 4] == 0) {
        swapItens(pos, pos - 4);
        return true;
      }
    }
    if (pos + 4 <= 15) {
      if (tabuleiro[pos + 4] == 0) {
        swapItens(pos, pos + 4);
        return true;
      }
    }
    return false;
  }

  bool verificarFim() {
    return listEquals(tabuleiro, pecas);
  }
}
