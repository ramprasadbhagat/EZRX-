import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_dropdown_data.freezed.dart';

@freezed
class GenericDropdownData with _$GenericDropdownData {
  const GenericDropdownData._();

  factory GenericDropdownData({
    required String value,
    required String label,
  }) = _GenericDropdownData;

  factory GenericDropdownData.empty() => GenericDropdownData(
        value: '',
        label: '',
      );
}
