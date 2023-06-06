import 'package:ezrxmobile/domain/core/dropdown/generic_dropdown_data.dart';

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

extension AmountTypeListExtension on List<AmountType> {
  List<GenericDropdownData> get items => map(
        (e) => GenericDropdownData.empty().copyWith(
          label: e.name,
          value: e.name,
        ),
      ).toList();
}
