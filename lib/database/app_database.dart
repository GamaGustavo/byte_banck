import 'package:byte_banck/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebanck.db');
    return openDatabase(
      path,
      onCreate: (database, version) {
        database.execute(ContactDao.tableSql);
      },
      version: 1,
    );
  });
}


