import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/core/search/search_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late ScrollController _scrollController;

class CustomerSearchPage extends StatefulWidget {
  const CustomerSearchPage({Key? key}) : super(key: key);

  @override
  State<CustomerSearchPage> createState() => _CustomerSearchPageState();
}

class _CustomerSearchPageState extends State<CustomerSearchPage> {
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('customerSearchPage'),
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppSearchBar(),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        buildWhen: (previous, current) =>
            previous.isSearchInProgress != current.isSearchInProgress,
        builder: (context, state) {
          var customerBloc = context.read<CustomerCodeBloc>();
          var salesOrgBloc = context.read<SalesOrgBloc>();
          var userBloc = context.read<UserBloc>();

          return Column(
            children: [
              const _HeaderMessage(),
              _BodyContent(
                state: state,
                userBloc: userBloc,
                salesOrgBloc: salesOrgBloc,
                customerBloc: customerBloc,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

bool get _isBottom {
  if (!_scrollController.hasClients) return false;

  return _scrollController.offset >= _scrollController.position.maxScrollExtent;
}

class _HeaderMessage extends StatelessWidget {
  const _HeaderMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
      buildWhen: (previous, current) =>
          previous.customerCodeList != current.customerCodeList,
      builder: (context, customerCodeState) {
        return BlocBuilder<SearchBloc, SearchState>(
          buildWhen: (previous, current) =>
              previous.isSearchInProgress != current.isSearchInProgress,
          builder: (context, searchState) {
            return !searchState.isSearchInProgress &&
                    customerCodeState.customerCodeList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text('Please select a Customer Code').tr(),
                  )
                : const SizedBox.shrink();
          },
        );
      },
    );
  }
}

class _BodyContent extends StatelessWidget {
  final SearchState state;
  final UserBloc userBloc;
  final SalesOrgBloc salesOrgBloc;
  final CustomerCodeBloc customerBloc;
  const _BodyContent({
    Key? key,
    required this.state,
    required this.customerBloc,
    required this.salesOrgBloc,
    required this.userBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: state.isSearchInProgress &&
              customerBloc.state.customeCodeInfo == CustomerCodeInfo.empty()
          ? LoadingShimmer.withChild(
              child: Image.asset(
                'assets/images/ezrxlogo.png',
                width: 80,
                height: 80,
              ),
            )
          : customerBloc.state.customerCodeList.isNotEmpty
              ? ListView.separated(
                  key: const Key('customerCodeSelect'),
                  controller: _scrollController
                    ..addListener(() {
                      if (_isBottom &&
                          customerBloc.state.isLoadMore &&
                          !customerBloc.state.isFetching) {
                        customerBloc.add(
                          CustomerCodeEvent.fetch(
                            salesOrganisation:
                                salesOrgBloc.state.salesOrganisation,
                            salesOrgCustomerInfo: state.searchText.isNotEmpty
                                ? [
                                    SalesOrgCustomerInfo(
                                      customerCodeSoldTo: CustomerCode(
                                        state.searchText,
                                      ),
                                      shipToInfos: [],
                                    ),
                                  ]
                                : salesOrgBloc
                                    .state.salesOrganisation.customerInfos,
                            pageIndex:
                                customerBloc.state.customerCodeList.length,
                            hidecustomer: false,
                            userRoleType:
                                userBloc.state.user.role.type.loginUserType,
                            userName: userBloc.state.user.username.toString(),
                          ),
                        );
                      }
                    }),
                  itemCount: customerBloc.state.isLoadMore
                      ? customerBloc.state.customerCodeList.length + 1
                      : customerBloc.state.customerCodeList.length,
                  itemBuilder: (context, index) {
                    if (index == customerBloc.state.customerCodeList.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    return _ListContent(
                      customerCodeInfo:
                          customerBloc.state.customerCodeList[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                )
              : NoRecordFound.showMessage(),
    );
  }
}

class _ListContent extends StatelessWidget {
  final CustomerCodeInfo customerCodeInfo;
  const _ListContent({Key? key, required this.customerCodeInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}
