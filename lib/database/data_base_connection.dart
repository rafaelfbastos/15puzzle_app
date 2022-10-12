import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseConnection {
  Future<Database> openConnection() async {
    final dataBasePath = await getDatabasesPath();
    final dataBaseFinalPath = join(dataBasePath, "score");

    return await openDatabase(
      dataBaseFinalPath,
      version: 1,
      onCreate: (db, version) {
        final batch = db.batch();

        batch.execute(''' 
                      CREATE TABLE rank(
                      id Integer primary key autoincrement,
                      nome	varchar(100),
                      data	varchar(50),
                      tempo	Integer,
                      jogadas Integer
                      )
        ''');
        batch.commit();
      },
    );
  }
}
