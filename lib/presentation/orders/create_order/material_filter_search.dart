import 'package:ezrxmobile/presentation/core/search_bar.dart';
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
    return SearchBar(
      key: const Key('materialFilterSearchField'),
      controller: _searchController,
      onSearchChanged: (value) => widget.onSearchMethod(value),
      onSearchSubmitted: (value) => widget.onSearchMethod(value),
      suffixIconKey: const Key('clearMaterialFilterSearch'),
      isDense: true,
      border: InputBorder.none,
      onClear: () {
        widget.onSearchMethod('');
        _searchController.clear();
      },
    );
  }
}
