import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.suffixIconKey,
    this.prefixIconKey,
    required this.controller,
    this.enabled,
    this.customValidator,
    this.onSearchSubmitted,
    this.isDense,
    required this.onClear,
    this.border,
    this.onSearchChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final bool? enabled;
  final void Function(String)? onSearchSubmitted;
  final bool? isDense;
  final void Function() onClear;
  final Key suffixIconKey;
  final Key? prefixIconKey;
  final InputBorder? border;
  final bool Function()? customValidator;
  final void Function(String)? onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      onChanged: onSearchChanged,
      onFieldSubmitted: (value) => _onSearch(context, value),
      decoration: InputDecoration(
        isDense: isDense,
        prefixIcon: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          key: prefixIconKey,
          icon: const Icon(Icons.search),
          onPressed: () => _onSearch(context, controller.text),
        ),
        suffixIcon: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          key: suffixIconKey,
          icon: const Icon(Icons.clear),
          onPressed: onClear,
        ),
        hintText: 'Search...'.tr(),
        border: border,
      ),
    );
  }

  void _showSnackbar(BuildContext context) => showSnackBar(
        context: context,
        message: 'Please enter at least 2 characters.'.tr(),
      );

  void _onSearch(BuildContext context, String value) {
    final isValid = _isValid();
    if (isValid) {
      onSearchSubmitted?.call(value);
    } else {
      _showSnackbar(context);
    }
  }

  bool _isValid() => customValidator?.call() ?? true;
}
