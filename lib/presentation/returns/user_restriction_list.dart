import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction/user_restriction_list_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserRestrictionListPage extends StatelessWidget {
  const UserRestrictionListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('user_restriction');

    return Scaffold(
      key: const Key('UserRestrictionListPage'),
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: CustomAppBar(child: UserRestrictionListSearch()),
      ),
      body: BlocConsumer<UserRestrictionListBloc, UserRestrictionListState>(
        listener: (context, state) {
          state.apiFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching ||
            previous.searchKey != current.searchKey,
        builder: (context, state) {
          return Column(
            children: [
              _HeaderMessage(state: state),
              Expanded(
                child: ScrollList<String>(
                  emptyMessage: 'No user restrictions found'.tr(),
                  isLoading: state.isFetching,
                  onRefresh: () {
                    final salesOrg =
                        context.read<SalesOrgBloc>().state.salesOrg;
                    context.read<UserRestrictionListBloc>().add(
                          UserRestrictionListEvent.fetch(
                            salesOrg: salesOrg,
                          ),
                        );
                  },
                  itemBuilder: (_, __, item) => _UserRestrictionItem(
                    username: item,
                  ),
                  key: const Key('userRestrictionList'),
                  items: state.getSearchedUsernamesList,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _UserRestrictionItem extends StatelessWidget {
  final String username;

  const _UserRestrictionItem({Key? key, required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        key: Key('userRestrictionTile-$username'),
        onTap: () {
          //TODO: Implement it later on
        },
        title: Text(
          username,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}

class UserRestrictionListSearch extends StatefulWidget {
  const UserRestrictionListSearch({Key? key}) : super(key: key);

  @override
  State<UserRestrictionListSearch> createState() =>
      _UserRestrictionListSearchState();
}

class _UserRestrictionListSearchState extends State<UserRestrictionListSearch> {
  late TextEditingController _searchController;
  late UserRestrictionListBloc userRestrictionListBloc;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    userRestrictionListBloc = context.read<UserRestrictionListBloc>();
    final searchText = userRestrictionListBloc.state.searchKey;
    if (searchText.isEmpty) return;
    _searchController.value = TextEditingValue(
      text: searchText,
      selection: TextSelection.collapsed(
        offset: _searchController.selection.base.offset,
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserRestrictionListBloc, UserRestrictionListState>(
      listenWhen: (previous, current) =>
          previous.searchKey != current.searchKey,
      listener: (context, state) {
        _searchController.value = TextEditingValue(
          text: state.searchKey,
          selection: TextSelection.collapsed(
            offset: _searchController.selection.base.offset,
          ),
        );
      },
      buildWhen: (previous, current) => previous.searchKey != current.searchKey,
      builder: (context, snapshot) {
        return TextField(
          key: const Key('userRestrictionListSearchField'),
          controller: _searchController,
          onChanged: (value) {
            userRestrictionListBloc
                .add(UserRestrictionListEvent.updateSearchKey(value));
          },
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ZPColors.primary),
            ),
            isDense: true,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              key: const Key('clearUserRestrictionListSearch'),
              icon: const Icon(Icons.clear),
              onPressed: () {
                if (_searchController.text.isEmpty) return;
                userRestrictionListBloc.add(
                  const UserRestrictionListEvent.updateSearchKey(''),
                );
              },
            ),
            hintText: 'Search...'.tr(),
            border: InputBorder.none,
          ),
        );
      },
    );
  }
}

class _HeaderMessage extends StatelessWidget {
  final UserRestrictionListState state;
  const _HeaderMessage({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !state.isFetching && state.usernames.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Please select a User').tr(),
          )
        : const SizedBox.shrink();
  }
}
