import 'package:flutter/material.dart';

import 'package:bytebank/screens/BankTransfer/Form.dart';
import 'package:bytebank/models/BankTransfer.dart';

const _titlePage = 'Transferências criadas';

class ListBankTransfer extends StatefulWidget {
  final List<BankTransfer> _bankTransfer = List();

  @override
  State<StatefulWidget> createState() {
    return ListBankTransferState();
  }
}

class ListBankTransferState extends State<ListBankTransfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_titlePage),
        ),
        body: ListView.builder(
          itemCount: widget._bankTransfer.length,
          itemBuilder: (context, index) {
            final bankTransfer = widget._bankTransfer[index];
            return CardBankTransfer(bankTransfer);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            final Future<BankTransfer> future =
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormBankTransfer();
            }));
            future.then((bankTransferReceived) {
              Future.delayed(Duration(seconds: 2),
                  () => _updateBankTransfer(bankTransferReceived));
            });
          },
        ));
  }

  void _updateBankTransfer(BankTransfer bankTransferReceived) {
    if (bankTransferReceived != null) {
      setState(() {
        widget._bankTransfer.add(bankTransferReceived);
      });
    }
  }
}

class CardBankTransfer extends StatelessWidget {
  final BankTransfer _bankTransfer;

  CardBankTransfer(this._bankTransfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_bankTransfer.bankTransferAmount.toString()),
        subtitle: Text(_bankTransfer.bankAccountNumber.toString()),
      ),
    );
  }
}
