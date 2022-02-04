import 'package:byte_banck/database/dao/contact_dao.dart';
import 'package:flutter/material.dart';

import '../models/contact.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _fullName = TextEditingController();

  final TextEditingController _accountNumber = TextEditingController();

  final ContactDao _contactDao = ContactDao();

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
            _TextField(
              controller: _fullName,
              labelText: 'Full name',
            ),
            _TextField(
              controller: _accountNumber,
              labelText: 'Acount number',
              keyboardType: TextInputType.number,
            ),
            _Button(
              contactDao: _contactDao,
              accountNumberController: _accountNumber,
              fullNameController: _fullName,
            )
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(
      {Key? key,
      required this.fullNameController,
      required this.accountNumberController,
      required this.contactDao})
      : super(key: key);
  final TextEditingController fullNameController;

  final TextEditingController accountNumberController;

  final ContactDao contactDao;

  final String _textButton = 'Create';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
            fixedSize: const Size.fromWidth(
              double.maxFinite,
            ),
            primary: Theme.of(context).colorScheme.secondary),
        onPressed: () => createContact(context),
        child: Text(_textButton),
      ),
    );
  }

  void createContact(BuildContext context) {
    final String fullName = fullNameController.text;
    final int accountNumbe = int.parse(accountNumberController.text);
    contactDao
        .save(Contact(
          fullName: fullName,
          accountNumber: accountNumbe,
        ))
        .then((id) => Navigator.pop(context));
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    Key? key,
    required this.controller,
    this.keyboardType,
    this.labelText,
    this.fontSize = 24.0,
  }) : super(key: key);
  final TextEditingController controller;
  final String? labelText;
  final double fontSize;

  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
        ),
        keyboardType: keyboardType,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
