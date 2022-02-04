import 'package:byte_banck/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebanck.db');
    return openDatabase(
      path,
      onCreate: (database, version) {
        database.execute('CREATE TABLE contacts( '
            'id INTEGER PRIMARY KEY, '
            'full_name TEXT, '
            'account_number INTEGER)');
      },
      version: 1,
      onDowngrade: onDatabaseDowngradeDelete,
    );
  });
}

Future<int> save(Contact contact) {
  return createDatabase().then((database) {
    Map<String, dynamic> contactMap = {};
    contactMap['full_name'] = contact.fullName;
    contactMap['account_number'] = contact.accountNumber;
    return database.insert('contacts', contactMap);
  });
}

Future<List<Contact>> findAll() {
  return createDatabase().then((database) {
    return database.query('contacts').then((maps) {
      {
        List<Contact> contacts = [];
        for (Map<String, dynamic> map in maps) {
          contacts.add(
            Contact(
              map['id'],
              map['full_name'],
              map['account_number'],
            ),
          );
        }
        return contacts;
      }
    });
  });
}
