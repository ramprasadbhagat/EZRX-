import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Please note use this widget instead of SearchBar
class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    Key? key,
    this.onSearchChanged,
    required this.enabled,
    required this.onSearchSubmitted,
    required this.onClear,
    this.keyboardType,
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
  final void Function(String)? onSearchChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String hintText;
  final String initialValue;
  final bool Function(String) customValidator;
  final bool autofocus;
  final Widget? searchSuffixIcon;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  Timer? _debounce;
  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var valueText = widget.initialValue;

    return TextFormField(
      key: WidgetKeys.searchBar,
      autocorrect: false,
      autofocus: widget.autofocus,
      enabled: widget.enabled,
      initialValue: widget.initialValue,
      onChanged: (value) {
        valueText = value;
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce = Timer(
          Duration(
            milliseconds: locator<Config>().autoSearchTimeout,
          ),
          () => widget.onSearchChanged?.call(value),
        );
      },
      onFieldSubmitted: (value) => _onSearch(context, value),
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(height: 1.5),
      decoration: InputDecoration(
        suffixIcon: widget.initialValue.isEmpty
            ? widget.searchSuffixIcon ??
                IconButton(
                  key: WidgetKeys.searchIconKey,
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
                key: WidgetKeys.clearIconKey,
                icon: const Icon(
                  Icons.clear,
                ),
                onPressed: () => widget.onClear.call(),
              ),
        hintText: context.tr(widget.hintText),
        hintStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: ZPColors.backgroundCloseButtonSnackBar),
      ),
    );
  }

  void _showSnackbar(BuildContext context) => CustomSnackBar(
        messageText: context.tr('Please enter at least 2 characters.'),
      ).show(context);

  void _onSearch(
    BuildContext context,
    String value,
  ) =>
      widget.customValidator(value)
          ? widget.onSearchSubmitted.call(value)
          : _showSnackbar(context);
}
