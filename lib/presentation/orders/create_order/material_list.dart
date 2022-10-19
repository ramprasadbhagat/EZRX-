import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialListPage extends StatefulWidget {
  const MaterialListPage({Key? key}) : super(key: key);

  @override
  State<MaterialListPage> createState() => _MaterialListPageState();
}

class _MaterialListPageState extends State<MaterialListPage> {
  late TextEditingController _searchController;
  late MaterialListBloc materialListBloc;

  @override
  void initState() {
    _searchController = TextEditingController();
    materialListBloc = context.read<MaterialListBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('materialListPage'),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: CustomAppBar(
          actionWidget: [
            IconButton(
              key: const Key('CartButton'),
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
          ],
          child: BlocConsumer<MaterialListBloc, MaterialListState>(
            listenWhen: (previous, current) =>
                previous.searchKey != current.searchKey,
            listener: (context, state) {
              final searchText = state.searchKey.getValue();
              _searchController.value = TextEditingValue(
                text: searchText,
                selection: TextSelection.collapsed(offset: searchText.length),
              );
            },
            buildWhen: (previous, current) =>
                previous.searchKey != current.searchKey ||
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              return Form(
                child: TextFormField(
                  key: const Key('materialSearchField'),
                  autocorrect: false,
                  controller: _searchController,
                  enabled: !state.isFetching,
                  onChanged: (value) {
                    materialListBloc.add(
                      MaterialListEvent.updateSearchKey(value),
                    );
                  },
                  onFieldSubmitted: (value) {
                    if (state.searchKey.isValid()) {
                      // search code goes here
                    } else {
                      showSnackBar(
                        context: context,
                        message:
                            'Search input must be greater than 4 characters.'
                                .tr(),
                      );
                    }
                  },
                  validator: (_) => state.searchKey.value.fold(
                    (f) => f.maybeMap(
                      subceedLength: (f) =>
                          'Search input must be greater than 4 characters.'
                              .tr(),
                      orElse: () => null,
                    ),
                    (_) => null,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: ZPColors.primary),
                    ),
                    isDense: true,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        materialListBloc.add(
                          const MaterialListEvent.updateSearchKey(''),
                        );
                        // fetch code goes here
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      body: BlocConsumer<MaterialListBloc, MaterialListState>(
        listenWhen: (previous, current) =>
            previous.apiFailureOrSuccessOption !=
            current.apiFailureOrSuccessOption,
        listener: (context, state) {
          state.apiFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                final failureMessage = failure.failureMessage;
                showSnackBar(
                  context: context,
                  message: failureMessage.tr(),
                );
              },
              (_) {
                context.read<AuthBloc>().add(const AuthEvent.authCheck());
              },
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          return Column(
            children: [
              _BodyContent(materialListState: state),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class _BodyContent extends StatelessWidget {
  final MaterialListState materialListState;
  const _BodyContent({
    Key? key,
    required this.materialListState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: materialListState.isFetching &&
              materialListState.materialList.isEmpty
          ? LoadingShimmer.withChild(
              child: Image.asset(
                'assets/images/ezrxlogo.png',
                key: const Key('loaderImage'),
                width: 80,
                height: 80,
              ),
            )
          : ScrollList<MaterialInfo>(
              emptyMessage: 'No material found',
              onRefresh: () => context.read<MaterialListBloc>().add(
                    MaterialListEvent.fetch(
                      user: context.read<UserBloc>().state.user,
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      configs: context.read<SalesOrgBloc>().state.configs,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customeCodeInfo,
                      shipToInfo:
                          context.read<ShipToCodeBloc>().state.shipToInfo,
                    ),
                  ),
              onLoadingMore: () => context.read<MaterialListBloc>().add(
                    MaterialListEvent.loadMore(
                      user: context.read<UserBloc>().state.user,
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      configs: context.read<SalesOrgBloc>().state.configs,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customeCodeInfo,
                      shipToInfo:
                          context.read<ShipToCodeBloc>().state.shipToInfo,
                    ),
                  ),
              isLoading: materialListState.isFetching,
              itemBuilder: (context, index, item) =>
                  _ListContent(materialInfo: item),
              items: materialListState.materialList,
            ),
    );
  }
}

class _ListContent extends StatelessWidget {
  final MaterialInfo materialInfo;
  const _ListContent({Key? key, required this.materialInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        key: Key('materialOption${materialInfo.materialNumber.getOrCrash()}'),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              materialInfo.materialNumber.displayMatNo,
              style: Theme.of(context).textTheme.subtitle2?.apply(
                    color: ZPColors.kPrimaryColor,
                  ),
            ),
            Text(
              materialInfo.materialDescription,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              materialInfo.principalData.principalName,
              style: Theme.of(context).textTheme.subtitle2?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
          ],
        ),
        trailing: _FavoriteButton(materialInfo: materialInfo),
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  final MaterialInfo materialInfo;
  const _FavoriteButton({Key? key, required this.materialInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteBloc, FavouriteState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {},
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final favourite = state.favouriteItems.firstWhere(
          (e) => e.materialNumber == materialInfo.materialNumber,
          orElse: () => Favourite.empty(),
        );

        return favourite == Favourite.empty()
            ? IconButton(
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  color: ZPColors.secondary,
                ),
                onPressed: () => context.read<FavouriteBloc>().add(
                      FavouriteEvent.add(
                        item: Favourite(
                          id: '',
                          materialNumber: materialInfo.materialNumber,
                          isFOC: materialInfo.materialGroup4.isFOC,
                          isTenderContract: false,
                          materialDescription: materialInfo.materialDescription,
                        ),
                        isPackAndPick: false,
                        user: context.read<UserBloc>().state.user,
                      ),
                    ),
              )
            : IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: ZPColors.secondary,
                ),
                onPressed: () => context.read<FavouriteBloc>().add(
                      FavouriteEvent.delete(
                        item: favourite,
                        user: context.read<UserBloc>().state.user,
                      ),
                    ),
              );
      },
    );
  }
}
