import 'package:flutter/material.dart';

import 'package:bytebank/screens/BankTransfer/List.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        buttonTheme: ButtonThemeData(
          height: 50,
          minWidth: 350,
          buttonColor: Colors.green[900],
          textTheme: ButtonTextTheme.primary
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData (
          backgroundColor: Colors.green[900]
        )
      ),
        home: ListaTransferencias(),
    );
  }
}