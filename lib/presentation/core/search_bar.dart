import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

//Please note use CustomSearchBar widget instead of SearchBar
class SearchBar extends StatefulWidget {
  const SearchBar({
    required this.onSearchChanged,
    Key? key,
    this.searchIconKey,
    required this.clearIconKey,
    required this.controller,
    this.enabled,
    this.customValidator,
    this.onSearchSubmitted,
    this.isDense,
    required this.onClear,
    this.border,
    this.isAutoSearch = true,
    this.inputFormatters = const <TextInputFormatter>[],
    this.keyboardType = TextInputType.text,
    this.hintText = 'Search',
  }) : super(key: key);

  final TextEditingController controller;
  final bool? enabled;
  final void Function(String)? onSearchSubmitted;
  final bool? isDense;
  final void Function() onClear;
  final Key? searchIconKey;
  final Key clearIconKey;
  final InputBorder? border;
  final bool Function()? customValidator;
  final void Function(String) onSearchChanged;
  final bool isAutoSearch;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final String hintText;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      controller: widget.controller,
      enabled: widget.enabled,
      onChanged: (value) => _onSearchChanged(value),
      onFieldSubmitted: (value) => _onSearch(context, value),
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(height: 24 / 16),
      decoration: InputDecoration(
        isDense: widget.isDense,
        suffixIcon: widget.controller.text.isEmpty
            ? IconButton(
                key: widget.searchIconKey,
                icon: const Icon(
                  Icons.search,
                  size: 22,
                ),
                splashRadius: 22,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                onPressed: () => _onSearch(context, widget.controller.text),
              )
            : IconButton(
                key: widget.clearIconKey,
                icon: const Icon(
                  Icons.clear,
                ),
                onPressed: () => _onClear(),
              ),
        hintText: widget.hintText.tr(),
        border: widget.border,
      ),
    );
  }

  void _showSnackbar(BuildContext context) => CustomSnackBar(
        icon: const Icon(
          Icons.info,
          color: ZPColors.checkSnackBar,
        ),
        messageText: 'Please enter at least 2 characters.'.tr(),
      ).show(context);

  void _onSearch(BuildContext context, String value) {
    final isValid = _isValid();
    if (isValid) {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      widget.onSearchSubmitted?.call(value);
    } else {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _showSnackbar(context);
    }
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    final isValid = _isValid();
    if (isValid) {
      if (widget.isAutoSearch) {
        _debounce = Timer(const Duration(milliseconds: 3000), () {
          widget.onSearchChanged.call(value);
        });
      } else {
        widget.onSearchChanged.call(value);
      }
    }
  }

  void _onClear() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    widget.onClear.call();
  }

  bool _isValid() => widget.customValidator?.call() ?? true;
}
