import 'package:flutter/cupertino.dart';
import 'package:puzzle_15/database/data_base_connection.dart';
import 'package:puzzle_15/models/rank_model.dart';

class RankDAO extends ChangeNotifier {
  List<RankModel> rankList = [];

  Future<void> findAll() async {
    rankList = [];
    var database = await DataBaseConnection().openConnection();
    var result = await database.query("rank");
    result.forEach((e) {
      rankList.add(RankModel.fromMap(result: e));
      notifyListeners();
    });
  }

  Future<List<RankModel>> getList() async {
    var list = <RankModel>[];
    var database = await DataBaseConnection().openConnection();
    var result = await database.query("rank");
    result.forEach((e) {
      list.add(RankModel.fromMap(result: e));
      notifyListeners();
    });
    list.sort();
    return list;
  }
}
