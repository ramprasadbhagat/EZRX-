import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/dropdown/generic_dropdown_data.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class GenericDropdown extends StatelessWidget {
  const GenericDropdown({
    Key? key,
    required this.labelText,
    required this.validator,
    required this.onChanged,
    required this.items,
    required this.isSubmitting,
    required this.value,
    this.isDisabled = false,
  }) : super(key: key);
  final String labelText;
  final Function(String?) validator;
  final Function(String?) onChanged;
  final List<GenericDropdownData> items;
  final bool isSubmitting;
  final String value;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isDisabled,
      child: DropdownButtonFormField2<String>(
        key: key,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: items.isEmpty ? 'No Data Available'.tr() : labelText,
          enabled: items.isNotEmpty,
          contentPadding: const EdgeInsets.fromLTRB(0, 10, 12, 10),
        ),
        iconStyleData: IconStyleData(
          icon: isSubmitting
              ? const SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: ZPColors.black,
                ),
        ),
        items: items.map(
          (item) {
            return DropdownMenuItem<String>(
              value: item.value,
              child: Text(item.label),
            );
          },
        ).toList(),
        onChanged: isSubmitting ? null : onChanged,
        validator: (value) => validator(value),
        value: value.isEmpty ? null : value,
      ),
    );
  }
}
