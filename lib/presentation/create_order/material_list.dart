import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/material/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/material/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late ScrollController _scrollController;

class MaterialListPage extends StatefulWidget {
  const MaterialListPage({Key? key}) : super(key: key);

  @override
  State<MaterialListPage> createState() => _MaterialListPageState();
}

class _MaterialListPageState extends State<MaterialListPage> {
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('materialListPage'),
      backgroundColor: ZPColors.white,
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

  @override
  void dispose() {
    _scrollController.dispose();
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
      child:
          materialListState.isFetching && materialListState.materialList.isEmpty
              ? LoadingShimmer.withChild(
                  child: Image.asset(
                    'assets/images/ezrxlogo.png',
                    key: const Key('LaoderImage'),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ZPColors.darkGray.withOpacity(0.15)),
          color: const Color.fromARGB(255, 251, 251, 251),
        ),
        key: Key(
          'materialOption${materialInfo.materialCode.getOrCrash()}',
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                materialInfo.materialCode.materialNumber,
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
        ),
      ),
    );
  }
}
