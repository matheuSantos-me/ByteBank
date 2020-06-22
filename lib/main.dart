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
            CardBankTransfer(ValuesBankTransfer(100.00, 587458-3)),
            CardBankTransfer(ValuesBankTransfer(200.00, 587458-7)),
            CardBankTransfer(ValuesBankTransfer(300.00, 587458-7)),
            CardBankTransfer(ValuesBankTransfer(400.00, 587458-7)),
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
        subtitle: Text(_valuesBankTransfer.bankAccountNumber.toString()),
      ),
    );
  }
}

class ValuesBankTransfer {
  final double valueTransfer;
  final int bankAccountNumber;

  ValuesBankTransfer(this.valueTransfer, this.bankAccountNumber);

  @override
  String toString() {
    return 'ValuesBankTransfer{valor: $valueTransfer, numeroConta $bankAccountNumber}';
  }
}

class BankTransferForm extends StatelessWidget {
  final TextEditingController _controllerBankAccountNumber =
      TextEditingController();
  final TextEditingController _controllerBankTransferAmount =
      TextEditingController();

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
              controller: _controllerBankAccountNumber,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                  labelText: 'Digite o Número da Conta', hintText: '000000-0'),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 32.0),
            child: TextField(
              controller: _controllerBankTransferAmount,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Digite o valor a ser Transferido',
                  hintText: '100,0'),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text('CONFIRMAR TRANSFERÊNCIA'),
            onPressed: () {
              final double BankTransferAmount =
                  double.tryParse(_controllerBankTransferAmount.text);
              final int BankAccountNumber =
                  int.tryParse(_controllerBankAccountNumber.text);
              if (BankTransferAmount != null && BankAccountNumber != null) {
                final CreateBankTransfer =
                    ValuesBankTransfer(BankTransferAmount, BankAccountNumber);
                print('$CreateBankTransfer');
              }
            },
          )
        ],
      ),
    );
  }
}
