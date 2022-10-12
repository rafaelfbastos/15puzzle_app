import 'package:puzzle_15/database/data_base_connection.dart';
import 'package:puzzle_15/models/rank_model.dart';

class RankDAO {
  List<RankModel> rankList = [];

  Future<void> findAll() async {
    rankList.clear();
    var database = await DataBaseConnection().openConnection();
    var result = await database.query("rank");
    result.forEach((e) {
      rankList.add(RankModel.fromMap(result: e));
      rankList.sort();
    });
  }
}
