import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction/user_restriction_list_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/returns/user_restriction_details/user_restriction_details_bloc.dart';

import 'package:ezrxmobile/domain/auth/value/value_objects.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';

class UserRestrictionListPage extends StatelessWidget {
  const UserRestrictionListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('UserRestrictionListPage'),
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: CustomAppBar(child: UserRestrictionListSearch()),
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocConsumer<UserRestrictionListBloc, UserRestrictionListState>(
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
            if (state.isFetching) {
              return LoadingShimmer.logo(
                key: const Key('LoaderImage'),
              );
            }

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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final eligibilityState = context.read<EligibilityBloc>().state;
          context
              .read<UserRestrictionDetailsBloc>()
              .add(UserRestrictionDetailsEvent.initialized(
                salesOrganisation: eligibilityState.salesOrganisation,
              ));
          context.router.push(
            AddEditUserRestrictionPageRoute(
              isEditing: false,
            ),
          );
        },
        child: const Icon(Icons.add),
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
          final eligibilityState = context.read<EligibilityBloc>().state;
          context.read<UserRestrictionDetailsBloc>().add(
                UserRestrictionDetailsEvent.fetchUserRestrictionDetails(
                  salesOrganisation: eligibilityState.salesOrganisation,
                  userName: Username(
                    username,
                  ),
                ),
              );
          context.router.push(
            AddEditUserRestrictionPageRoute(
              isEditing: true,
            ),
          );
        },
        title: Text(
          username,
          style: Theme.of(context).textTheme.titleSmall,
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
        return SearchBar(
          key: const Key('userRestrictionListSearchField'),
          suffixIconKey: const Key('clearUserRestrictionListSearch'),
          controller: _searchController,
          onClear: () {
            if (_searchController.text.isEmpty) return;
            _searchController.clear();
            userRestrictionListBloc.add(
              const UserRestrictionListEvent.updateSearchKey(''),
            );
          },
          border: InputBorder.none,
          onSearchChanged: (value) {
            userRestrictionListBloc
                .add(UserRestrictionListEvent.updateSearchKey(value));
          },
          onSearchSubmitted: (value) {
            userRestrictionListBloc
                .add(UserRestrictionListEvent.updateSearchKey(value));
          },
          isDense: true,
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
