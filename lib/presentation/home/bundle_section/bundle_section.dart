import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/core/section_tile.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';

class BundleSection extends StatelessWidget {
  const BundleSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return BlocProvider<MaterialListBloc>(
      create: (context) => locator<MaterialListBloc>()
        ..add(
          MaterialListEvent.fetch(
            salesOrganisation: eligibilityState.salesOrganisation,
            configs: eligibilityState.salesOrgConfigs,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            selectedMaterialFilter: MaterialFilter.empty().copyWith(
              bundleOffers: true,
            ),
            user: context.read<UserBloc>().state.user,
          ),
        ),
      child: BlocListener<EligibilityBloc, EligibilityState>(
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading && !current.isLoading,
        listener: (context, state) {
          context.read<MaterialListBloc>().add(
                MaterialListEvent.fetch(
                  salesOrganisation: state.salesOrganisation,
                  configs: state.salesOrgConfigs,
                  customerCodeInfo: state.customerCodeInfo,
                  shipToInfo: state.shipToInfo,
                  selectedMaterialFilter: MaterialFilter.empty().copyWith(
                    bundleOffers: true,
                  ),
                  user: context.read<UserBloc>().state.user,
                ),
              );
        },
        child: BlocBuilder<MaterialListBloc, MaterialListState>(
          buildWhen: (previous, current) =>
              previous.materialList != current.materialList,
          builder: (_, state) {
            return state.isFetching || state.materialList.isNotEmpty
                ? Column(
                    key: WidgetKeys.bundlesBody,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: SectionTitle(
                          key: WidgetKeys.bundles,
                          title: 'Bundles',
                          onTapIconButton: () => state.isFetching
                              ? null
                              : _navigateForMoreBundle(context),
                        ),
                      ),
                      SizedBox(
                        height: 220,
                        child: state.isFetching
                            ? LoadingShimmer.logo(
                                key: WidgetKeys.bundleSectionLoaderImage,
                              )
                            : ListView(
                                key: WidgetKeys.bundlesList,
                                scrollDirection: Axis.horizontal,
                                children: state.materialList
                                    .map(
                                      (e) => _BundleSectionItem(
                                        materialInfo: e,
                                      ),
                                    )
                                    .toList(),
                              ),
                      ),
                    ],
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _navigateForMoreBundle(BuildContext context) {
    context.read<MaterialListBloc>().add(
          MaterialListEvent.fetch(
            salesOrganisation:
                context.read<EligibilityBloc>().state.salesOrganisation,
            configs: context.read<EligibilityBloc>().state.salesOrgConfigs,
            customerCodeInfo:
                context.read<EligibilityBloc>().state.customerCodeInfo,
            shipToInfo: context.read<EligibilityBloc>().state.shipToInfo,
            selectedMaterialFilter: MaterialFilter.empty().copyWith(
              bundleOffers: true,
            ),
            user: context.read<UserBloc>().state.user,
          ),
        );
    context.navigateTo(const ProductsTabRoute());
  }
}

class _BundleSectionItem extends StatelessWidget {
  const _BundleSectionItem({Key? key, required this.materialInfo})
      : super(key: key);
  final MaterialInfo materialInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _bundleOnTap(context, materialInfo),
      child: CustomCard(
        margin: const EdgeInsets.all(8),
        width: Responsive.isMobile(context)
            ? MediaQuery.of(context).size.width * 0.85
            : MediaQuery.of(context).size.width * 0.4,
        child: Column(
          key: WidgetKeys.bundlesListItem,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ColoredBox(
              color: ZPColors.blueTagColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTag.bundleOffer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          materialInfo.bundle.bundleCode,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: ZPColors.darkerGrey,
                                  ),
                          key: WidgetKeys.bundlesNumber,
                        ),
                        Text(
                          materialInfo.bundle.bundleName.getOrDefaultValue(''),
                          style: Theme.of(context).textTheme.labelSmall,
                          key: WidgetKeys.bundlesDescription,
                        ),
                        Text(
                          materialInfo.manufactured,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: ZPColors.darkerGrey,
                                  ),
                          key: WidgetKeys.bundlesManufactured,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ...materialInfo.listingVisibleMaterial.take(2).map(
              (e) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 5,
                  ),
                  child: Text(
                    '\u2022  ${e.materialDescription.getOrDefaultValue('')}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            ),
            materialInfo.listingVisibleMaterial.length > 2
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      top: 5,
                      bottom: 10,
                    ),
                    child: Text(
                      '+ ${materialInfo.data.skip(2).length} ${context.tr('materials')}',
                      key: WidgetKeys.bundleMaterialCount(
                        materialInfo.bundle.bundleCode,
                      ),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.darkerGrey,
                          ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  void _bundleOnTap(BuildContext context, MaterialInfo materialInfo) {
    trackMixpanelEvent(
      MixpanelEvents.productItemClicked,
      props: {
        MixpanelProps.clickAt:
            RouterUtils.buildRouteTrackingName(context.router.currentPath),
        MixpanelProps.isBundle: true,
        MixpanelProps.productName: materialInfo.displayDescription,
        MixpanelProps.productCode: materialInfo.materialNumber.displayMatNo,
        MixpanelProps.productManufacturer: materialInfo.getManufactured,
        MixpanelProps.section: 'Bundles',
      },
    );

    context.router.push(BundleDetailPageRoute(materialInfo: materialInfo));
  }
}
