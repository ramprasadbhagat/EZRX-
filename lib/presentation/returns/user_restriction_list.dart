import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction/user_restriction_list_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/returns/user_restriction_details/user_restriction_details_bloc.dart';

import 'package:ezrxmobile/domain/auth/value/value_objects.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class UserRestrictionListPage extends StatelessWidget {
  const UserRestrictionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.userRestrictionListPage,
      appBar: CustomAppBar.commonAppBar(
        title: const UserRestrictionListSearch(),
        customerBlockedOrSuspended:
            context.read<EligibilityBloc>().state.customerBlockOrSuspended,
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
                key: WidgetKeys.userRestrictionListLoader,
              );
            }

            return Column(
              children: [
                _HeaderMessage(state: state),
                _UserRestrictionScrollList(state: state),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final eligibilityState = context.read<EligibilityBloc>().state;
          context.read<UserRestrictionDetailsBloc>().add(
                UserRestrictionDetailsEvent.initialized(
                  salesOrganisation: eligibilityState.salesOrganisation,
                ),
              );
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

class _UserRestrictionScrollList extends StatelessWidget {
  const _UserRestrictionScrollList({
    required this.state,
  });

  final UserRestrictionListState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollList<String>(
        noRecordFoundWidget:
            const NoRecordFound(title: 'No user restrictions found'),
        controller: ScrollController(),
        isLoading: state.isFetching,
        onRefresh: () {
          final salesOrg = context.read<EligibilityBloc>().state.salesOrg;
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
    );
  }
}

class _UserRestrictionItem extends StatelessWidget {
  final String username;

  const _UserRestrictionItem({required this.username});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        key: WidgetKeys.userRestrictionTile(username),
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
  const UserRestrictionListSearch({super.key});

  @override
  State<UserRestrictionListSearch> createState() =>
      _UserRestrictionListSearchState();
}

class _UserRestrictionListSearchState extends State<UserRestrictionListSearch> {
  late UserRestrictionListBloc userRestrictionListBloc;

  @override
  void initState() {
    super.initState();
    userRestrictionListBloc = context.read<UserRestrictionListBloc>();
    final searchText = userRestrictionListBloc.state.searchKey;
    if (searchText.isEmpty) return;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserRestrictionListBloc, UserRestrictionListState>(
      buildWhen: (previous, current) => previous.searchKey != current.searchKey,
      builder: (context, snapshot) {
        return CustomSearchBar(
          key: WidgetKeys.genericKey(
            key: (SearchKey(snapshot.searchKey)).searchValueOrEmpty,
          ),
          enabled: !snapshot.isFetching,
          initialValue: (SearchKey(snapshot.searchKey)).searchValueOrEmpty,
          customValidator: (value) => SearchKey.searchFilter(value).isValid(),
          onSearchSubmitted: (value) {},
          onClear: () => userRestrictionListBloc.add(
            const UserRestrictionListEvent.updateSearchKey(''),
          ),
          onSearchChanged: (value) => userRestrictionListBloc
              .add(UserRestrictionListEvent.updateSearchKey(value)),
        );
      },
    );
  }
}

class _HeaderMessage extends StatelessWidget {
  final UserRestrictionListState state;

  const _HeaderMessage({required this.state});

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
