import 'package:intl/intl.dart';

class RankModel implements Comparable<RankModel> {
  String nome;
  int jogadas;
  int tempo;
  DateTime data;

  RankModel(
      {required this.nome,
      required this.jogadas,
      required this.tempo,
      required this.data});

  factory RankModel.fromMap({required Map<String, dynamic> result}) {
    var nome = result["nome"] ?? "";
    var jogadas = result["jogadas"] ?? 0;
    var tempo = result["tempo"] ?? 0;
    var dataString = result["data"] ?? "";

    var data = DateFormat("dd-MM-yy").parse(dataString);
    return RankModel(data: data, nome: nome, jogadas: jogadas, tempo: tempo);
  }

  @override
  int compareTo(RankModel other) {
    return (jogadas.compareTo(other.jogadas) != 0)
        ? jogadas.compareTo(other.jogadas)
        : tempo.compareTo(other.tempo);
  }

  String getTempo() {
    Duration duration = Duration(seconds: tempo);
    var format = NumberFormat("00");
    var seg = format.format(duration.inSeconds.remainder(60));
    var min = format.format(duration.inMinutes.remainder(60));

    return "$min : $seg";
  }

  String getData() {
    return DateFormat("dd-MM-yy").format(data);
  }
}
