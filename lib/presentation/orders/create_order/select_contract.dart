import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/orders/create_order/tender_contract_item.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/domain/utils/error_utils.dart';

class SelectContract extends StatelessWidget {
  const SelectContract({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: const Key('selectContract'),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(height: 35),
          Text(
            'Contract Selection',
            style: Theme.of(context).textTheme.titleMedium?.apply(
                  color: ZPColors.black,
                ),
          ),
          const SizedBox(height: 15),
          const TenderContractList(),
        ],
      ),
    );
  }
}

class TenderContractList extends StatelessWidget {
  const TenderContractList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TenderContractBloc, TenderContractState>(
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
        return state.isFetching && state.tenderContractList.isEmpty
            ? LoadingShimmer.logo()
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => TenderContractItem(
                  tenderContract: state.tenderContractList[index],
                ),
                itemCount: state.tenderContractList.length,
              );
      },
    );
  }
}
