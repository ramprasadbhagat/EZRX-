import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Please note use this widget instead of SearchBar
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
    this.onSearchChanged,
    this.searchIconKey,
    required this.clearIconKey,
    required this.enabled,
    required this.onSearchSubmitted,
    required this.onClear,
    this.inputFormatters,
    this.hintText = 'Search',
    required this.initialValue,
    required this.customValidator,
    this.autofocus = false,
    this.searchSuffixIcon,
  }) : super(key: key);

  final bool enabled;
  final void Function(String) onSearchSubmitted;
  final void Function() onClear;
  final Key? searchIconKey;
  final Key clearIconKey;
  final void Function(String)? onSearchChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String hintText;
  final String initialValue;
  final bool Function(String) customValidator;
  final bool autofocus;
  final Widget? searchSuffixIcon;

  @override
  Widget build(BuildContext context) {
    var valueText = initialValue;

    return TextFormField(
      autocorrect: false,
      autofocus: autofocus,
      enabled: enabled,
      initialValue: initialValue,
      onChanged: (value) {
        valueText = value;
        onSearchChanged?.call(value);
      },
      onFieldSubmitted: (value) => _onSearch(context, value),
      inputFormatters: inputFormatters,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(height: 1.5),
      decoration: InputDecoration(
        suffixIcon: initialValue.isEmpty
            ? searchSuffixIcon ??
                IconButton(
                  key: searchIconKey,
                  icon: const Icon(
                    Icons.search,
                    size: 22,
                  ),
                  splashRadius: 22,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  onPressed: () => _onSearch(
                    context,
                    valueText,
                  ),
                )
            : IconButton(
                key: clearIconKey,
                icon: const Icon(
                  Icons.clear,
                ),
                onPressed: () => onClear.call(),
              ),
        hintText: hintText.tr(),
      ),
    );
  }

  void _showSnackbar(BuildContext context) => CustomSnackBar(
        messageText: 'Please enter at least 2 characters.'.tr(),
      ).show(context);

  void _onSearch(
    BuildContext context,
    String value,
  ) =>
      customValidator(value)
          ? onSearchSubmitted.call(value)
          : _showSnackbar(context);
}
