import 'package:flutter/material.dart';

import 'contact_form.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Text('Gustavo',style: TextStyle(fontSize: 22.0),),
              subtitle: Text('20000'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ContactForm(),
        ),
      ).then((value) {
        debugPrint(value.toString());
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}