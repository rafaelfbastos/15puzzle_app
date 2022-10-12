import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzle_15/models/rank_model.dart';

class RankDialog extends Dialog {
  RankDialog({super.key, required List<RankModel> rankList})
      : super(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: SizedBox(
            width: 500,
            height: 500,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Rank",
                    style: GoogleFonts.pressStart2p(fontSize: 20),
                  ),
                ),
                Expanded(
                    flex: 15,
                    child: SingleChildScrollView(
                      child: DataTable(
                        columnSpacing: 20,
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Expanded(
                              flex: 1,
                              child: Text('Rank'),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              flex: 3,
                              child: Text(
                                'Nome',
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              flex: 1,
                              child: Text(
                                'Jogadas',
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              flex: 1,
                              child: Text(
                                'Tempo',
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              flex: 1,
                              child: Text(
                                'Data',
                              ),
                            ),
                          ),
                        ],
                        rows: List<DataRow>.generate(
                            rankList.length,
                            (index) => DataRow(cells: [
                                  DataCell(Text("${index + 1}")),
                                  DataCell(Text(rankList[index].nome)),
                                  DataCell(Text("${rankList[index].jogadas}")),
                                  DataCell(Text(rankList[index].getTempo())),
                                  DataCell(Text(rankList[index].getData())),
                                ])),
                      ),
                    ))
              ],
            )),
          ),
        );
}
