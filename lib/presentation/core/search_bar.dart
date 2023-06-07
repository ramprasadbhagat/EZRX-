import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    required this.onSearchChanged,
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
    this.isAutoSearch = true,
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
  final void Function(String) onSearchChanged;
  final bool isAutoSearch;

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
      controller: widget.controller,
      enabled: widget.enabled,
      onChanged: (value) => _onSearchChanged(context, value),
      onFieldSubmitted: (value) => _onSearch(context, value),
      decoration: InputDecoration(
        isDense: widget.isDense,
        prefixIcon: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          key: widget.prefixIconKey,
          icon: const Icon(Icons.search),
          onPressed: () => _onSearch(context, widget.controller.text),
        ),
        suffixIcon: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          key: widget.suffixIconKey,
          icon: const Icon(Icons.clear),
          onPressed: () => _onClear(),
        ),
        hintText: 'Search...'.tr(),
        border: widget.border,
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
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      widget.onSearchSubmitted?.call(value);
    } else {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _showSnackbar(context);
    }
  }

  void _onSearchChanged(BuildContext context, String value) {
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
