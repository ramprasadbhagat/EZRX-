import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerSearchPage extends StatelessWidget {
  const CustomerSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('customerSearchPage'),
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppSearchBar(),
      ),
      body: BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          return Column(
            children: [
              _HeaderMessage(
                state: state,
              ),
              _BodyContent(
                state: state,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _HeaderMessage extends StatelessWidget {
  final CustomerCodeState state;
  const _HeaderMessage({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !state.isFetching && state.customerCodeList.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Please select a Customer Code').tr(),
          )
        : const SizedBox.shrink();
  }
}

class _BodyContent extends StatelessWidget {
  final CustomerCodeState state;
  const _BodyContent({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesOrgBloc = context.read<SalesOrgBloc>();
    final userBloc = context.read<UserBloc>();

    return Expanded(
      child: ScrollList<CustomerCodeInfo>(
        key: const Key('customerCodeSelect'),
        onRefresh: () {
          //TODO: Implement case have search text
          context.read<CustomerCodeBloc>().add(
                CustomerCodeEvent.fetch(
                  userInfo: userBloc.state.user,
                  selectedSalesOrg: salesOrgBloc.state.salesOrganisation,
                  isRefresh: true,
                  hidecustomer: false,
                ),
              );
        },
        onLoadingMore: () {
          //TODO: Implement case have search text
          if (state.canLoadMore && !state.isFetching) {
            context.read<CustomerCodeBloc>().add(
                  CustomerCodeEvent.fetch(
                    userInfo: userBloc.state.user,
                    selectedSalesOrg: salesOrgBloc.state.salesOrganisation,
                    hidecustomer: false,
                  ),
                );
          }
        },
        isLoading: state.isFetching,
        itemBuilder: (_, __, item) => _ListContent(customerCodeInfo: item),
        items: state.customerCodeList,
        emptyMessage: 'No Customer Code Found',
      ),
    );
  }
}

class _ListContent extends StatelessWidget {
  final CustomerCodeInfo customerCodeInfo;
  const _ListContent({Key? key, required this.customerCodeInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          key: Key(
            'customerCodeOption${customerCodeInfo.customerCodeSoldTo}',
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                customerCodeInfo.customerCodeSoldTo,
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.kPrimaryColor,
                    ),
              ),
              Text(
                customerCodeInfo.customerName.toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              RichText(
                text: TextSpan(
                  text: customerCodeInfo.customerAddress.toString(),
                  style: Theme.of(context).textTheme.subtitle2?.apply(
                        color: ZPColors.lightGray,
                      ),
                  children: [
                    TextSpan(
                      text: customerCodeInfo.postalCode,
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            context.read<CustomerCodeBloc>().add(
                  CustomerCodeEvent.selected(
                    customerCodeInfo: customerCodeInfo,
                  ),
                );
            context.router.pop();
          },
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
        ),
      ],
    );
  }
}
