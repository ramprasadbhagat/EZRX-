import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MaterialFilterSearch extends StatefulWidget {
  final Function onSearchMethod;
  final String searchText;

  const MaterialFilterSearch({
    Key? key,
    required this.onSearchMethod,
    required this.searchText,
  }) : super(key: key);

  @override
  State<MaterialFilterSearch> createState() => _MaterialFilterSearch();
}

class _MaterialFilterSearch extends State<MaterialFilterSearch> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    _searchController.value = TextEditingValue(
      text: widget.searchText,
      selection: TextSelection.collapsed(
        offset: _searchController.selection.base.offset,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('materialFilterSearchField'),
      controller: _searchController,
      onChanged: (value) {
        widget.onSearchMethod(value);
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          key: const Key('clearMaterialFilterSearch'),
          icon: const Icon(Icons.clear),
          onPressed: () {
            widget.onSearchMethod('');
            _searchController.clear();
          },
        ),
        isDense: true,
        hintText: 'Search...'.tr(),
        border: InputBorder.none,
      ),
    );
  }
}
