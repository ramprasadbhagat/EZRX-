import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction/user_restriction_list_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserRestrictionListPage extends StatelessWidget {
  const UserRestrictionListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('user_restriction');

    return Scaffold(
      key: const Key('UserRestrictionListPage'),
      appBar: AppBar(title: const Text('User Restriction').tr()),
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
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: state.isFetching
                    ? LoadingShimmer.logo(
                        key: const Key('loading-shimmer'),
                      )
                    : ScrollList<String>(
                        emptyMessage: 'No user restrictions found'.tr(),
                        isLoading: false,
                        onRefresh: () {
                          final salesOrg =
                              context.read<SalesOrgBloc>().state.salesOrg;
                          context.read<UserRestrictionListBloc>().add(
                                UserRestrictionListEvent.fetch(
                                  salesOrg: salesOrg,
                                ),
                              );
                        },
                        itemBuilder: (context, index, item) =>
                            _UserRestrictionItem(
                          username: state.usernames[index],
                        ),
                        items: state.usernames,
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
    return Container(
      key: Key(
        'userRestriction-$username',
      ),
      child: Card(
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
      ),
    );
  }
}
