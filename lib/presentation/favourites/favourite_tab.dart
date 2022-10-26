import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/valid_customer_material/valid_customer_material_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/cart_button.dart';
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
                (previous.favouriteItems.isEmpty &&
                    current.favouriteItems.isNotEmpty);
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
            if (state.favouriteItems.isNotEmpty) {
              final materialList = <Favourite>[...state.favouriteItems];
              materialList.retainWhere((element) => !element.isFOC);
              final focMaterialList = <Favourite>[...state.favouriteItems];
              focMaterialList.retainWhere((element) => element.isFOC);
              context
                  .read<ValidCustomerMaterialBloc>()
                  .add(ValidCustomerMaterialEvent.validate(
                    //TODO: Implement validateId for favorite later
                    validateId: '',
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
              previous.favouriteItems != current.favouriteItems,
          builder: (context, state) {
            return BlocBuilder<ValidCustomerMaterialBloc,
                ValidCustomerMaterialState>(
              builder: (context, validatedMaterailState) {
                final validatedFavouriteItems = state.favouriteItems
                    .where(
                      (Favourite element) =>
                          element.materialNumber.isValidMaterial(
                        validatedMaterailState.validMaterialNumberList,
                      ),
                    )
                    .toList();

                return state.isLoading && state.favouriteItems.isEmpty
                    ? LoadingShimmer.withChild(
                        child: Image.asset(
                          'assets/images/ezrxlogo.png',
                          key: const Key('LoaderImage'),
                          width: 80,
                          height: 80,
                        ),
                      )
                    : ScrollList<Favourite>(
                        emptyMessage: 'No favorite found',
                        onRefresh: () => context.read<FavouriteBloc>().add(
                              FavouriteEvent.fetch(
                                user: context.read<UserBloc>().state.user,
                              ),
                            ),
                        isLoading: state.isLoading,
                        onLoadingMore: () {},
                        itemBuilder: (context, index, item) =>
                            FavouriteListTile(
                          favourite: item,
                        ),
                        items: validatedFavouriteItems,
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
