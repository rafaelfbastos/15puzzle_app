import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_15/Controller/game_controller.dart';
import 'package:puzzle_15/database/data_base_connection.dart';
import 'package:puzzle_15/models/rank_model.dart';

import '../custom_widgets/rank_dialog.dart';
import '../database/rank_DAO.dart';

class Fim extends StatefulWidget {
  const Fim({Key? key}) : super(key: key);

  @override
  State<Fim> createState() => _FimState();
}

class _FimState extends State<Fim> {
  var nomeEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<GameController>().tocarSomWin();

      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: const Text("Digite seu nome"),
              content: Form(
                key: formKey,
                child: TextFormField(
                  validator: (String? nome) {
                    if (nome == null || nome.isEmpty) {
                      return "Digite um nome";
                    }
                  },
                  controller: nomeEC,
                  decoration:
                      const InputDecoration(hintText: "Digite seu nome"),
                ),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () async {
                      var formValidator =
                          formKey.currentState?.validate() ?? false;
                      if (formValidator) {
                        await _gravarBanco(nomeEC.text);
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text("Ok"))
              ],
            );
          }));
    });
  }

  @override
  void dispose() {
    nomeEC.dispose();
    super.dispose();
  }

  Future<void> _gravarBanco(nome) async {
    var data = DateFormat("dd-MM-yy").format(DateTime.now());
    var tempo = context.read<GameController>().segundos;
    var jogadas = context.read<GameController>().jogadas;
    var database = await DataBaseConnection().openConnection();
    context.read<GameController>().setNome(nome);

    database.insert("rank",
        {"nome": nome, "data": data, "jogadas": jogadas, "tempo": tempo});
  }

  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameController>();
    var rank = context.read<RankDAO>();
    var rankList = <RankModel>[];

    Future<void> _atualizar() async {
      rankList = await rank.getList();
    }

    _atualizar();

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: "Rank",
            onPressed: () {
              showDialog(
                  context: context,
                  builder: ((context) {
                    _atualizar();
                    return RankDialog(rankList: rankList);
                  }));
            },
            icon: const Icon(Icons.analytics_outlined),
            iconSize: 30,
          )
        ],
        title: Text(
          'Game Over',
          style: GoogleFonts.pressStart2p(
              fontSize: 18, color: const Color(0xffffe73c)),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            Image.asset("assets/parabens.png"),
            Text(game.nome,
                style:
                    GoogleFonts.pressStart2p(fontSize: 20, color: Colors.red)),
            const SizedBox(
              height: 30,
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
