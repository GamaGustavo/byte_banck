import 'package:flutter/material.dart';

import 'models/contact.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _fullName = TextEditingController();

  final TextEditingController _acountNumber = TextEditingController();

  @override
  void initState() {
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _fullName,
                decoration: const InputDecoration(
                  labelText: 'Full name',
                ),
                style: const TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _acountNumber,
                decoration: const InputDecoration(
                  labelText: 'Acount number',
                ),
                style: const TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    fixedSize: const Size.fromWidth(
                      double.maxFinite,
                    ),
                    primary: Theme.of(context).colorScheme.secondary),
                onPressed: () {
                  final String fullName = _fullName.text;
                  final int acountNumbe = int.parse(_acountNumber.text);
                  Navigator.of(context).pop(Contact(fullName,acountNumbe));
                },
                child: const Text('Create'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
