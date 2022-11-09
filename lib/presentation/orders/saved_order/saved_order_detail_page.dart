import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_material_item.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedOrderDetailPage extends StatelessWidget {
  final SavedOrder order;
  const SavedOrderDetailPage({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('SavedOrderDetailPage'),
      backgroundColor: ZPColors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBar(
          title: Text(order.companyName.name),
        ),
      ),
      body: RefreshIndicator(
        color: ZPColors.primary,
        onRefresh: () async => context.read<MaterialPriceDetailBloc>().add(
              MaterialPriceDetailEvent.refresh(
                user: context.read<UserBloc>().state.user,
                customerCode:
                    context.read<CustomerCodeBloc>().state.customerCodeInfo,
                salesOrganisation:
                    context.read<SalesOrgBloc>().state.salesOrganisation,
                salesOrganisationConfigs:
                    context.read<SalesOrgBloc>().state.configs,
                shipToCode: context.read<ShipToCodeBloc>().state.shipToInfo,
                materialInfoList: order.items
                    .map(
                      (item) => MaterialQueryInfo.fromSavedOrder(
                        orderMaterial: item,
                      ),
                    )
                    .toList(),
              ),
            ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _InvalidMaterialWarning(order: order),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = order.items[index];

                  return SavedOrderMaterialItem(
                    enableDefaultMD: context
                        .read<SalesOrgBloc>()
                        .state
                        .configs
                        .enableDefaultMD,
                    material: item,
                  );
                },
                childCount: order.items.length,
              ),
            ),
            SliverToBoxAdapter(
              child: _ActionButtonSet(order: order),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButtonSet extends StatelessWidget {
  const _ActionButtonSet({
    Key? key,
    required this.order,
  }) : super(key: key);

  final SavedOrder order;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialPriceDetailBloc, MaterialPriceDetailState>(
      buildWhen: (previous, current) =>
          previous.isValidating != current.isValidating,
      builder: (context, state) {
        if (state.isValidating) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingShimmer.withChild(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const SizedBox(),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              LoadingShimmer.withChild(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const SizedBox(),
                ),
              ),
            ],
          );
        }

        final enableAddToCart = order.items.any(
          (item) => state.isValidMaterial(
            query: MaterialQueryInfo.fromSavedOrder(
              orderMaterial: item,
            ),
          ),
        );

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              //TODO: Implement Add to cart
              onPressed: () {},
              style: enableAddToCart
                  ? null
                  : ElevatedButton.styleFrom(
                      backgroundColor: ZPColors.darkGray,
                    ),
              child: const Text('Add to Cart').tr(),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                context.read<SavedOrderListBloc>().add(
                      SavedOrderListEvent.delete(
                        order: order,
                        user: context.read<UserBloc>().state.user,
                      ),
                    );
              },
              child: const Text('Delete').tr(),
            ),
          ],
        );
      },
    );
  }
}

class _InvalidMaterialWarning extends StatelessWidget {
  const _InvalidMaterialWarning({
    Key? key,
    required this.order,
  }) : super(key: key);

  final SavedOrder order;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialPriceDetailBloc, MaterialPriceDetailState>(
      buildWhen: (previous, current) =>
          previous.isValidating != current.isValidating,
      builder: (context, state) {
        if (state.isValidating) {
          return const SizedBox();
        }

        final isAllMaterialInvalid = order.items.every(
          (item) => !state.isValidMaterial(
            query: MaterialQueryInfo.fromSavedOrder(
              orderMaterial: item,
            ),
          ),
        );
        if (isAllMaterialInvalid) {
          return Padding(
            padding: const EdgeInsets.only(
              right: 10,
              left: 10,
              top: 5,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.info_outlined,
                ),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'All materials are invalid and can not be added to cart!'
                            .tr(),
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
