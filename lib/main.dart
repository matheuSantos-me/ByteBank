import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: BankTransferList(),
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
            CardBankTransfer(ValuesBankTransfer(100.00, 587458 - 3)),
            CardBankTransfer(ValuesBankTransfer(200.00, 587458 - 7)),
            CardBankTransfer(ValuesBankTransfer(300.00, 587458 - 7)),
            CardBankTransfer(ValuesBankTransfer(400.00, 587458 - 7)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BankTransferForm();
            }));
          },
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
          Input(
              controller: _controllerBankAccountNumber,
              placeholder: 'Digite o Número da Conta',
              label: '000000-0'),
          Input(
              controller: _controllerBankTransferAmount,
              placeholder: 'Digite o valor a ser Transferido',
              label: '100.0',
              iconData: Icons.monetization_on),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 0),
            child: RaisedButton(
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
            ),
          )
        ],
      ),
    );
  }
}

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final String label;
  final IconData iconData;

  Input({this.controller, this.placeholder, this.label, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            icon: iconData != null ? Icon(iconData) : null,
            labelText: placeholder,
            hintText: label),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
