import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    body: bankTransferList(),
    appBar: AppBar(
      title: Text('Transferências'),
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
    ),
  )));
}

class bankTransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        cardBankTransfer('100.00', '605040-7'),
        cardBankTransfer('200.00', '605847-8'),
        cardBankTransfer('303.00', '215487-2'),
      ],
    );
  }
}

class cardBankTransfer extends StatelessWidget {
  final String valueTransfer;
  final String bankAccountNumber;

  cardBankTransfer(this.valueTransfer, this.bankAccountNumber);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(valueTransfer),
        subtitle: Text(bankAccountNumber),
      ),
    );
  }
}
