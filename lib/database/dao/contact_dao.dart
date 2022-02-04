import 'package:byte_banck/models/contact.dart';

import '../app_database.dart';
import 'package:sqflite_common/sqlite_api.dart';

class ContactDao {
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _fullName = 'full_name';
  static const String _accountNumber = 'account_number';

  static const String tableSql = 'CREATE TABLE $_tableName( '
      '$_id INTEGER PRIMARY KEY, '
      '$_fullName TEXT, '
      '$_accountNumber INTEGER)';

  Future<int> save(Contact contact) async {
    final Database database = await getDatabase();
    return database.insert(_tableName, _toMap(contact));
  }

  Future<List<Contact>> findAll() async {
    final Database database = await getDatabase();
    return _toList(await database.query(_tableName));
  }

  Map<String, dynamic> _toMap(Contact contact) {
    Map<String, dynamic> contactMap = {
      _fullName: contact.fullName,
      _accountNumber: contact.accountNumber,
    };
    return contactMap;
  }

  List<Contact> _toList(List<Map<String, Object?>> maps) {
    List<Contact> contacts = [];
    for (Map<String, dynamic> map in maps) {
      contacts.add(
        Contact(
          id: map[_id],
          fullName: map[_fullName],
          accountNumber: map[_accountNumber],
        ),
      );
    }
    return contacts;
  }
}
