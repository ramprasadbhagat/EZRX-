import 'package:ezrxmobile/application/core/search/search_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSearchBar extends StatefulWidget {
  final bool automaticallyImplyLeading;
  final List<Widget> actionWidget;
  const AppSearchBar({
    Key? key,
    this.automaticallyImplyLeading = true,
    this.actionWidget = const [],
  }) : super(key: key);

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  final _searchController = TextEditingController();

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      // The search area here
      backgroundColor: ZPColors.primary,
      titleSpacing: widget.actionWidget.isNotEmpty ? 0 : 10,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      iconTheme: const IconThemeData(
        color: ZPColors.white, //change your color here
      ),
      title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: BlocConsumer<SearchBloc, SearchState>(
            listenWhen: (previous, current) =>
                previous.searchText != current.searchText,
            listener: (context, state) {
              final searchText = state.searchText;
              _searchController.value = TextEditingValue(
                text: searchText,
                selection: TextSelection.collapsed(offset: searchText.length),
              );
            },
            buildWhen: (previous, current) =>
                previous.searchText != current.searchText ||
                previous.isSearchInProgress != current.isSearchInProgress,
            builder: (context, state) {
              return TextField(
                controller: _searchController,
                enabled: !state.isSearchInProgress,
                onChanged: (value) {
                  context.read<SearchBloc>().add(
                        SearchEvent.searchTextChanged(value),
                      );
                },
                decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      context
                          .read<SearchBloc>()
                          .add(const SearchEvent.clearSearchText());
                    },
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
              );
            },
          ),
        ),
      ),
      actions: widget.actionWidget,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
