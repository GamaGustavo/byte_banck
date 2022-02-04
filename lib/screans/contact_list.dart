import 'package:byte_banck/database/app_database.dart';
import 'package:byte_banck/models/contact.dart';
import 'package:flutter/material.dart';

import 'contact_form.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: FutureBuilder<List<Contact>>(
        future: findAll(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const Text('Loading'),
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return _ContactIten(
                    contact: contacts.elementAt(index),
                  );
                },
                itemCount: contacts.length,
              );
          }
          return const Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ContactForm(),
            ),
          ).then((value) => setState((){}));
        }
      ),
    );
  }
}

class _ContactIten extends StatelessWidget {
  const _ContactIten({Key? key, required this.contact}) : super(key: key);
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.fullName,
          style: const TextStyle(fontSize: 22.0),
        ),
        subtitle: Text(contact.accountNumber.toString()),
      ),
    );
  }
}
