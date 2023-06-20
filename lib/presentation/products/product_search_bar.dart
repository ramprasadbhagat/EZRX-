import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class ProductSearchBar extends StatefulWidget {
  const ProductSearchBar({
    Key? key,
    required this.enabled,
    required this.onClear,
    required this.border,
    required this.customValidator,
    required this.onSearchChanged,
    required this.onSearchSubmitted,
    this.isAutoSearch = true,
    required this.controller,
  }) : super(key: key);

  final bool enabled;
  final bool isAutoSearch;
  final Function() onClear;
  final InputBorder border;
  final TextEditingController controller;
  final void Function(String) onSearchSubmitted;
  final bool Function() customValidator;
  final void Function(String) onSearchChanged;

  @override
  State<ProductSearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<ProductSearchBar> {
  late final TextEditingController _controller;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: _controller,
      enabled: widget.enabled,
      onChanged: (value) => _onSearchChanged(context, value),
      onFieldSubmitted: (value) => _onSearch(context, value),
      decoration: InputDecoration(
        suffixIcon: _controller.text.isEmpty
            ? IconButton(
                key: WidgetKeys.productScanCameraKey,
                icon: const Icon(
                  Icons.camera_alt_outlined,
                ),
                onPressed: () => {},
              )
            : IconButton(
                key: WidgetKeys.productSearchClearKey,
                icon: const Icon(
                  Icons.clear,
                ),
                onPressed: () => _onClear(),
              ),
        hintText: 'Search'.tr(),
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
      widget.onSearchSubmitted.call(value);
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
        _debounce = Timer(const Duration(milliseconds: 1000), () {
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

  bool _isValid() => widget.customValidator.call();
}
