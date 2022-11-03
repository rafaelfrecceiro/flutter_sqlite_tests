import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSqLite {
  void openConnection() async {
    var databasePath = await getDatabasesPath();
    final databaseFinalPath = join(databasePath, 'sqlite_example');

    await openDatabase(
      databaseFinalPath,
      version: 1,
      onCreate: (db, version) {
        final batch = db.batch();
        batch.execute('''
          create table teste(
            id Integer primary key autoincrement,
            nome varchar(200)
          );
        ''');
        batch.commit();
      },
      onUpgrade: (db, oldVersion, newVersion) {},
    );
  }
}
