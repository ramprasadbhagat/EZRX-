import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/orders/cart/bonus/widgets/bonus_items_sheet_footer.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/core/scroll_list.dart';

import 'package:ezrxmobile/presentation/core/no_record.dart';

import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';

import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

import 'package:ezrxmobile/presentation/orders/cart/bonus/widgets/bonus_material_tile.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';

class BonusItemsSheet extends StatelessWidget {
  final PriceAggregate cartProduct;
  const BonusItemsSheet({
    Key? key,
    required this.cartProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.isUpserting != current.isUpserting,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {
            if (!state.isUpserting) {
              CustomSnackBar(
                messageText: 'Bonus/sample added to cart'.tr(),
              ).show(context);
              context.read<CartBloc>().add(
                    CartEvent.getDetailsProductsAddedToCart(
                      cartProducts: context.read<CartBloc>().state.cartProducts,
                    ),
                  );
            }
          },
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                'Add bonus/sample item'.tr(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: ZPColors.primary,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18, bottom: 8),
              child: CustomSearchBar(
                onClear: () {},
                onSearchChanged: (v) => {},
                enabled: true,
                onSearchSubmitted: (v) => {},
                initialValue: '',
                customValidator: (v) => true,
              ),
            ),
            const _BonusQuantityEmptyWarning(),
            BlocBuilder<CartBloc, CartState>(
              buildWhen: (previous, current) =>
                  previous.cartProducts != current.cartProducts,
              builder: (context, state) {
                return _BodyContent(
                  cartProduct:
                      state.updatedCartProduct(cartProduct.getMaterialNumber),
                  oldBonusList: cartProduct.bonusSampleItems,
                );
              },
            ),
            const BonusItemsSheetFooter(),
          ],
        ),
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  final PriceAggregate cartProduct;
  final List<BonusSampleItem> oldBonusList;
  const _BodyContent({
    Key? key,
    required this.cartProduct,
    required this.oldBonusList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BonusMaterialBloc, BonusMaterialState>(
      listenWhen: (previous, current) =>
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (context, state) => {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {
              context.read<ProductImageBloc>().add(
                    ProductImageEvent.fetch(
                      list: state.bonusItemList,
                    ),
                  );
            },
          ),
        ),
      },
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          previous.bonusItemList != current.bonusItemList,
      builder: (context, state) {
        return Expanded(
          child: state.isFetching && state.bonusItemList.isEmpty
              ? LoadingShimmer.logo(
                  key: WidgetKeys.loaderImage,
                )
              : ScrollList<MaterialInfo>(
                  noRecordFoundWidget: const Expanded(
                    child: NoRecordFound(title: 'No Bonus Items Found'),
                  ),
                  controller: ScrollController(),
                  onRefresh: () => context.read<BonusMaterialBloc>().add(
                        BonusMaterialEvent.fetch(
                          salesOrganisation: context
                              .read<EligibilityBloc>()
                              .state
                              .salesOrganisation,
                          configs: context
                              .read<EligibilityBloc>()
                              .state
                              .salesOrgConfigs,
                          customerCodeInfo: context
                              .read<EligibilityBloc>()
                              .state
                              .customerCodeInfo,
                          shipToInfo:
                              context.read<EligibilityBloc>().state.shipToInfo,
                          principalData: cartProduct.materialInfo.principalData,
                          user: context.read<EligibilityBloc>().state.user,
                          isGimmickMaterialEnabled: context
                              .read<EligibilityBloc>()
                              .state
                              .isGimmickMaterialEnabled,
                        ),
                      ),
                  onLoadingMore: () => context.read<BonusMaterialBloc>().add(
                        BonusMaterialEvent.loadMoreBonusItem(
                          salesOrganisation: context
                              .read<EligibilityBloc>()
                              .state
                              .salesOrganisation,
                          configs: context
                              .read<EligibilityBloc>()
                              .state
                              .salesOrgConfigs,
                          customerCodeInfo: context
                              .read<EligibilityBloc>()
                              .state
                              .customerCodeInfo,
                          shipToInfo:
                              context.read<EligibilityBloc>().state.shipToInfo,
                          principalData: cartProduct.materialInfo.principalData,
                          user: context.read<EligibilityBloc>().state.user,
                          isGimmickMaterialEnabled: context
                              .read<EligibilityBloc>()
                              .state
                              .isGimmickMaterialEnabled,
                        ),
                      ),
                  isLoading: state.isFetching,
                  itemBuilder: (context, index, item) => BonusMaterialTile(
                    bonusMaterial: item,
                    cartProduct: cartProduct,
                    oldBonusList: oldBonusList,
                  ),
                  items: state.bonusItemList,
                ),
        );
      },
    );
  }
}

class _BonusQuantityEmptyWarning extends StatelessWidget {
  const _BonusQuantityEmptyWarning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BonusMaterialBloc, BonusMaterialState>(
      buildWhen: (previous, current) =>
          previous.isBonusQtyValidated != current.isBonusQtyValidated,
      builder: (context, state) {
        return !state.isBonusQtyValidated
            ? Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: ZPColors.lightRedStatusColor,
                ),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Please enter quantity to add bonus/sample.'.tr(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
