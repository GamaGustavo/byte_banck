import 'package:flutter/material.dart';

import 'screans/dashboard.dart';

void main() {
  runApp(const ByteBanck());
}

class ByteBanck extends StatelessWidget {
  const ByteBanck({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BytbanckApp',
      theme: ThemeData(
        /*primaryColor: Colors.green.shade900,*/
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green.shade900,
          secondary: Colors.blueAccent.shade700,
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent.shade700,
            textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const Dashboard(title: 'Dashboard'),
    );
  }
}
