class BankTransfer {
  final double bankTransferAmount;
  final int bankAccountNumber;

  BankTransfer(this.bankTransferAmount, this.bankAccountNumber);

  @override
  String toString() {
    return 'BankTransfer{valor: $bankTransferAmount, numeroConta: $bankAccountNumber}';
  }
}
