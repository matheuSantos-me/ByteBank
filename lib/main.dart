import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: BankTransferForm(),
    ));
  }
}

class BankTransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        body: Column(
          children: <Widget>[
            CardBankTransfer(ValuesBankTransfer(100.00, '587458-7')),
            CardBankTransfer(ValuesBankTransfer(200.00, '587458-7')),
            CardBankTransfer(ValuesBankTransfer(300.00, '587458-7')),
            CardBankTransfer(ValuesBankTransfer(400.00, '587458-7')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ));
  }
}

class CardBankTransfer extends StatelessWidget {
  final ValuesBankTransfer _valuesBankTransfer;

  CardBankTransfer(this._valuesBankTransfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_valuesBankTransfer.valueTransfer.toString()),
        subtitle: Text(_valuesBankTransfer.bankAccountNumber),
      ),
    );
  }
}

class ValuesBankTransfer {
  final double valueTransfer;
  final String bankAccountNumber;

  ValuesBankTransfer(this.valueTransfer, this.bankAccountNumber);
}

class BankTransferForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Transferência'),
      ),
    );
  }
}
