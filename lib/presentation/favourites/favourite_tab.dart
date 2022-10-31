import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/valid_customer_material/valid_customer_material_bloc.dart';
import 'package:ezrxmobile/application/order/valid_customer_material/valid_customer_material_view_model.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/presentation/core/cart_button.dart';
import 'package:ezrxmobile/presentation/core/invalid_material_number_dialog.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/favourites/favourite_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesTab extends StatelessWidget {
  const FavouritesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites').tr(),
        automaticallyImplyLeading: false,
        actions: const [CartButton()],
      ),
      body: SafeArea(
        child: BlocConsumer<FavouriteBloc, FavouriteState>(
          listenWhen: (previous, current) {
            return previous.failureOrSuccessOption !=
                    current.failureOrSuccessOption ||
                (previous.isLoading != current.isLoading);
          },
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  final failureMessage = failure.failureMessage;
                  showSnackBar(
                    context: context,
                    message: failureMessage.tr(),
                  );
                  if (failureMessage == 'authentication failed') {
                    context.read<AuthBloc>().add(const AuthEvent.logout());
                  }
                },
                (_) {},
              ),
            );
            if (state.favouriteItems.isNotEmpty && !state.isLoading) {
              final materialList = <Favourite>[...state.favouriteItems];
              materialList.retainWhere((element) => !element.isFOC);
              final focMaterialList = <Favourite>[...state.favouriteItems];
              focMaterialList.retainWhere((element) => element.isFOC);
              context
                  .read<ValidCustomerMaterialBloc>()
                  .add(ValidCustomerMaterialEvent.validate(
                    validateId: validateFavoriteMaterialId,
                    materialList: materialList
                        .map((Favourite e) => e.materialNumber)
                        .toList(),
                    focMaterialList: focMaterialList
                        .map((Favourite e) => e.materialNumber)
                        .toList(),
                    user: context.read<UserBloc>().state.user,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
                  ));
            }
          },
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          builder: (context, state) {
            if (state.isLoading) {
              return LoadingShimmer.withChild(
                child: Image.asset(
                  'assets/images/ezrxlogo.png',
                  key: const Key('LoaderImage'),
                  width: 80,
                  height: 80,
                ),
              );
            }

            return BlocConsumer<ValidCustomerMaterialBloc,
                ValidCustomerMaterialState>(
              listenWhen: (previous, current) =>
                  previous.validatingStatusById(validateFavoriteMaterialId) !=
                      current
                          .validatingStatusById(validateFavoriteMaterialId) &&
                  current.validatingStatusById(validateFavoriteMaterialId) !=
                      ValidatingStatus.loading,
              listener: (context, validMaterialState) async {
                if (validMaterialState
                        .validatingStatusById(validateFavoriteMaterialId) ==
                    ValidatingStatus.success) {
                  final validFavouriteMaterials = state.favouriteItems
                      .where(
                        (Favourite element) =>
                            element.materialNumber.isValidMaterial(
                          validMaterialState.validMaterialNumberById(
                            validateFavoriteMaterialId,
                          ),
                        ),
                      )
                      .toList();
                  context.read<MaterialPriceDetailBloc>().add(
                        MaterialPriceDetailEvent.fetch(
                          customerCode: context
                              .read<CustomerCodeBloc>()
                              .state
                              .customerCodeInfo,
                          salesOrganisation: context
                              .read<SalesOrgBloc>()
                              .state
                              .salesOrganisation,
                          salesOrganisationConfigs:
                              context.read<SalesOrgBloc>().state.configs,
                          shipToCode:
                              context.read<ShipToCodeBloc>().state.shipToInfo,
                          materialInfos: validFavouriteMaterials
                              .map(
                                (item) => MaterialQueryInfo.fromFavorite(
                                  material: item,
                                ),
                              )
                              .toList(),
                        ),
                      );
                  final invalidMaterialNumbers =
                      validMaterialState.filterInvalidMaterialNumber(
                    state.favouriteItems
                        .map((e) => e.materialNumber.getOrDefaultValue(''))
                        .toList(),
                  );
                  if (invalidMaterialNumbers.isNotEmpty) {
                    await InvalidMaterialNumberDialog.show(
                      context: context,
                      invalidMaterialNumbers: invalidMaterialNumbers,
                    );
                  }
                } else {
                  //TODO: Show SnackBar when calling API failure
                }
              },
              buildWhen: (previous, current) =>
                  previous.validatingStatusById(validateFavoriteMaterialId) !=
                  current.validatingStatusById(validateFavoriteMaterialId),
              builder: (context, validMaterialState) {
                switch (validMaterialState
                    .validatingStatusById(validateFavoriteMaterialId)) {
                  case ValidatingStatus.failure:
                  case ValidatingStatus.success:
                    final validFavouriteMaterials = state.favouriteItems
                        .where(
                          (Favourite element) =>
                              element.materialNumber.isValidMaterial(
                            validMaterialState.validMaterialNumberById(
                              validateFavoriteMaterialId,
                            ),
                          ),
                        )
                        .toList();

                    return ScrollList<Favourite>(
                      emptyMessage: 'No favorite found',
                      onRefresh: () {
                        context.read<FavouriteBloc>().add(
                              FavouriteEvent.fetch(
                                user: context.read<UserBloc>().state.user,
                              ),
                            );
                        context
                            .read<MaterialPriceDetailBloc>()
                            .add(const MaterialPriceDetailEvent.initialized());
                        context.read<ValidCustomerMaterialBloc>().add(
                              const ValidCustomerMaterialEvent.initialized(),
                            );
                      },
                      isLoading: state.isLoading,
                      onLoadingMore: () {},
                      itemBuilder: (context, index, item) => FavouriteListTile(
                        favourite: item,
                      ),
                      items: validFavouriteMaterials,
                    );

                  case ValidatingStatus.loading:
                    return LoadingShimmer.withChild(
                      child: Image.asset(
                        'assets/images/ezrxlogo.png',
                        key: const Key('LoaderImage'),
                        width: 80,
                        height: 80,
                      ),
                    );
                  default:
                    return const SizedBox();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
