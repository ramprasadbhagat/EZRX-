import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/sales_district/sales_district_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district_details.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesDistrictPage extends StatelessWidget {
  const SalesDistrictPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sales District Management'.tr())),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocBuilder<SalesDistrictBloc, SalesDistrictState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            return state.isFetching
                ? LoadingShimmer.logo(
                    key: const Key('loaderImage'),
                  )
                : ScrollList<SalesDistrict>(
                    emptyMessage: 'No Sales District found'.tr(),
                    onRefresh: () => _onRefresh(context: context),
                    isLoading: state.isFetching,
                    itemBuilder: (context, index, item) {
                      return _SalesDistrictList(
                        salesDistrict: item,
                      );
                    },
                    items: state.salesDistrictList,
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  void _onRefresh({required BuildContext context}) {
    context
        .read<SalesDistrictBloc>()
        .add(const SalesDistrictEvent.initialized());
    context.read<SalesDistrictBloc>().add(const SalesDistrictEvent.fetch());
  }
}

class _SalesDistrictList extends StatelessWidget {
  final SalesDistrict salesDistrict;
  const _SalesDistrictList({Key? key, required this.salesDistrict})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: salesDistrict.salesDistrictDetails
          .map((e) => _SalesDistrictListItem(
              salesDistrictDetails: e, salesOrg: salesDistrict.salesOrg,))
          .toList(),
    );
  }
}

class _SalesDistrictListItem extends StatelessWidget {
  final SalesDistrictDetails salesDistrictDetails;
  final SalesOrg salesOrg;
  const _SalesDistrictListItem({
    Key? key,
    required this.salesDistrictDetails,
    required this.salesOrg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: CustomSlidable(
          endActionPaneActions: [
            CustomSlidableAction(
              label: 'Delete',
              icon: Icons.delete_outline,
              onPressed: (context) {},
            ),
          ],
          borderRadius: 8,
          child: Column(
            key: Key('salesDistrict${salesDistrictDetails.id}'),
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    salesOrg.getValue(),
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color: ZPColors.kPrimaryColor,
                        ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {},
                  ),
                ],
              ),
              BalanceTextRow(
                keyText: 'Id',
                valueText: salesDistrictDetails.id.toString(),
                keyFlex: 2,
                valueFlex: 3,
              ),
              BalanceTextRow(
                keyText: 'Sales District',
                valueText: salesDistrictDetails.salesDistrict,
                keyFlex: 2,
                valueFlex: 3,
              ),
              BalanceTextRow(
                keyText: 'Sales District Label',
                valueText: salesDistrictDetails.salesDistrictLabel,
                keyFlex: 2,
                valueFlex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
