enum AmountType {
  manualInput,
  autoDeduction,
  onlyReturn,
  nonReturn,
}

extension AmountTypeExtension on AmountType {
  String get name => _getValueOrLabel(type: this);

  String _getValueOrLabel({required AmountType type}) {
    switch (type) {
      case AmountType.manualInput:
        return 'Manual Input';
      case AmountType.autoDeduction:
        return 'Auto Deduction';
      case AmountType.onlyReturn:
        return 'Return';
      case AmountType.nonReturn:
        return 'Non Return';
    }
  }
}
