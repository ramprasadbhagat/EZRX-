import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/material/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/material/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialListPage extends StatelessWidget {
  const MaterialListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('materialListPage'),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppSearchBar(
          actionWidget: [
            IconButton(
              key: const Key('CartButton'),
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
          ],
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
      child:
          materialListState.isFetching && materialListState.materialList.isEmpty
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
                        const MaterialListEvent.fetch(),
                      ),
                  onLoadingMore: () => context.read<MaterialListBloc>().add(
                        const MaterialListEvent.loadMore(),
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
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              materialInfo.materialDescription,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              materialInfo.principalData.principalName,
              style: Theme.of(context).textTheme.bodyText2,
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
                        Favourite(
                          id: '',
                          materialNumber: materialInfo.materialNumber,
                          isFOC: materialInfo.materialGroup4.isFOC,
                          isTenderContract: false,
                          materialDescription: materialInfo.materialDescription,
                        ),
                        false,
                      ),
                    ),
              )
            : IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: ZPColors.secondary,
                ),
                onPressed: () => context
                    .read<FavouriteBloc>()
                    .add(FavouriteEvent.delete(favourite)),
              );
      },
    );
  }
}
