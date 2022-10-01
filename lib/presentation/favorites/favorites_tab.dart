import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/favorites/favourite_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites').tr(),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: BlocConsumer<FavouriteBloc, FavouriteState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
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
          },
          buildWhen: (previous, current) =>
              previous.favouriteItems != current.favouriteItems,
          builder: (context, state) {
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
                          const FavouriteEvent.fetch(),
                        ),
                    isLoading: state.isLoading,
                    onLoadingMore: () {},
                    itemBuilder: (context, index, item) => FavouriteListTile(
                      favourite: item,
                    ),
                    items: state.favouriteItems,
                  );
          },
        ),
      ),
    );
  }
}
