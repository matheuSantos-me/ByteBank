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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
            child: TextField(
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                  labelText: 'Número da Conta', hintText: '000000-0'),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 32.0),
            child: TextField(
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Número da Conta',
                  hintText: '000000-0'),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text('CONFIRMAR TRANSFERENCIA'),
            onPressed: () {
              print('FGHJKLKJHGFDSDFGHJKLKJHGFDSDFGHJK');
            },
          )
        ],
      ),
    );
  }
}
