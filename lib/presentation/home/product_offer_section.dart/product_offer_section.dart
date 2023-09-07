import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/section_tile.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/custom_card.dart';

import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';

import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

import 'package:ezrxmobile/presentation/core/price_component.dart';

import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';

import 'package:ezrxmobile/locator.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

import 'package:ezrxmobile/domain/order/entities/material_filter.dart';

import 'package:ezrxmobile/domain/order/entities/material_info.dart';

import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';

import 'package:ezrxmobile/presentation/core/icon_label.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';

import 'package:ezrxmobile/presentation/core/responsive.dart';

part 'widgets/product_offer_body_content.dart';
part 'widgets/product_title.dart';
part 'widgets/price_label.dart';

class ProductsOnOffer extends StatelessWidget {
  const ProductsOnOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<MaterialListBloc>(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<EligibilityBloc, EligibilityState>(
            listenWhen: (previous, current) =>
                previous.isLoading != current.isLoading && !current.isLoading,
            listener: (context, state) {
              context.read<MaterialListBloc>().add(
                    MaterialListEvent.fetch(
                      salesOrganisation: context
                          .read<EligibilityBloc>()
                          .state
                          .salesOrganisation,
                      configs:
                          context.read<EligibilityBloc>().state.salesOrgConfigs,
                      customerCodeInfo: context
                          .read<EligibilityBloc>()
                          .state
                          .customerCodeInfo,
                      shipToInfo:
                          context.read<EligibilityBloc>().state.shipToInfo,
                      selectedMaterialFilter: MaterialFilter.empty().copyWith(
                        isProductOffer: true,
                      ),
                    ),
                  );
            },
          ),
          BlocListener<MaterialListBloc, MaterialListState>(
            listenWhen: (previous, current) =>
                previous.nextPageIndex != current.nextPageIndex,
            listener: (context, state) {
              state.apiFailureOrSuccessOption.fold(
                () {},
                (either) => either.fold(
                  (failure) {
                    ErrorUtils.handleApiFailure(context, failure);
                  },
                  (_) {
                    context.read<MaterialPriceBloc>().add(
                          MaterialPriceEvent.fetch(
                            salesOrganisation: context
                                .read<SalesOrgBloc>()
                                .state
                                .salesOrganisation,
                            salesConfigs:
                                context.read<SalesOrgBloc>().state.configs,
                            customerCodeInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .customerCodeInfo,
                            shipToInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .shipToInfo,
                            comboDealEligible: context
                                .read<EligibilityBloc>()
                                .state
                                .comboDealEligible,
                            materials: state.materialList,
                          ),
                        );
                    if (state.selectedMaterialFilter.isProductOffer) {
                      context.read<ProductImageBloc>().add(
                            ProductImageEvent.fetch(
                              list: state.materialList,
                            ),
                          );
                    }
                  },
                ),
              );
            },
          ),
        ],
        child: _ProductOfferBodyContent(ctx: context),
      ),
    );
  }
}
