import 'package:bytebank/components/InputText.dart';
import 'package:bytebank/models/BankTransfer.dart';
import 'package:flutter/material.dart';

const _titlePage = 'Criando nova transferência';
const _labelAccountNumber = 'Digite o número da conta com dígito';
const _placeholderAccountNumber = '999999-9';
const _labelValueTransfer = 'Digite o valor a ser transferido';
const _placeholderValueTransfer = '100.00';
const _label = 'CONFIRMAR';

class FormBankTransfer extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FormBankTransferState();
  }
}


class FormBankTransferState extends State<FormBankTransfer> {
  final TextEditingController _controllerInputBankAccountNumber = TextEditingController();
  final TextEditingController _controllerInputBankTransfer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titlePage),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Editor(
                controller: _controllerInputBankAccountNumber,
                placeholder: _placeholderAccountNumber,
                label: _labelAccountNumber),
            Editor(
              controller: _controllerInputBankTransfer,
              placeholder: _placeholderValueTransfer,
              label: _labelValueTransfer,
              icon: Icons.monetization_on,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 48.0, 8.0, 0),
              child: RaisedButton(
                child: Text(_label),
                onPressed: () {
                  _createsBankTransfer(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _createsBankTransfer(BuildContext context) {
    final int bankAccountNumber = int.tryParse(_controllerInputBankTransfer.text);
    final double bankTransferAmount = double.tryParse(_controllerInputBankAccountNumber.text);
    if (bankAccountNumber != null && bankTransferAmount != null) {
      final bankTransferCreated = BankTransfer(bankTransferAmount, bankAccountNumber);
      debugPrint('$bankTransferCreated');
      Navigator.pop(context, bankTransferCreated);
    }
  }
}