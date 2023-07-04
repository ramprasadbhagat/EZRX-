import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/material_loading_shimmer.dart';
import 'package:ezrxmobile/presentation/products/widgets/material_grid_item.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarProduct extends StatefulWidget {
  const SimilarProduct({Key? key}) : super(key: key);

  @override
  State<SimilarProduct> createState() => _SimilarProductState();
}

class _SimilarProductState extends State<SimilarProduct> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollAtInitialPosition = true;
  bool _isScrollAtFinalPosition = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _isScrollAtInitialPosition = _scrollController.initialScrollOffset ==
          _scrollController.position.pixels;
      _isScrollAtFinalPosition = _scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent;
    });
  }

  void _scrollForward() {
    if (_scrollController.hasClients) {
      final offset =
          _scrollController.offset + MediaQuery.of(context).size.width;
      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollBack() {
    if (_scrollController.hasClients) {
      final offset =
          _scrollController.offset - MediaQuery.of(context).size.width;
      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _resetScroll() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailBloc, ProductDetailState>(
      listenWhen: (previous, current) =>
          previous.productDetailAggregate.similarProduct !=
          current.productDetailAggregate.similarProduct,
      listener: (context, state) {
        _resetScroll();
        final eligibilityBlocState = context.read<EligibilityBloc>().state;
        context.read<MaterialPriceBloc>().add(
              MaterialPriceEvent.fetch(
                salesOrganisation:
                    eligibilityBlocState.salesOrganisation,
                salesConfigs: eligibilityBlocState.salesOrgConfigs,
                customerCodeInfo: eligibilityBlocState.customerCodeInfo,
                shipToInfo: eligibilityBlocState.shipToInfo,
                comboDealEligible: eligibilityBlocState.comboDealEligible,
                materials: state.productDetailAggregate.similarProduct,
              ),
            );
      },
      buildWhen: (previous, current) =>
          previous.productDetailAggregate.similarProduct !=
          current.productDetailAggregate.similarProduct,
      builder: (context, state) {
        return Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Text(
                    'Related products',
                    style: Theme.of(context).textTheme.labelLarge,
                  ).tr(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: state.isFetching
                      ? const _LoadingShimmerSimilarProduct()
                      : state.productDetailAggregate.similarProduct.isNotEmpty
                          ? ListView(
                              controller: _scrollController,
                              physics: const ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children:
                                  state.productDetailAggregate.similarProduct
                                      .map(
                                        (e) => _SimilarProductCard(material: e),
                                      )
                                      .toList(),
                            )
                          : const SizedBox.shrink(),
                ),
              ],
            ),
            state.isFetching ||
                    state.productDetailAggregate.similarProduct.isEmpty
                ? const SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _isScrollAtInitialPosition
                          ? const SizedBox.shrink()
                          : _ScrollIconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_sharp,
                                size: MediaQuery.of(context).size.width * 0.03,
                              ),
                              onTap: _scrollBack,
                            ),
                      _isScrollAtFinalPosition
                          ? const SizedBox.shrink()
                          : _ScrollIconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: MediaQuery.of(context).size.width * 0.03,
                              ),
                              onTap: _scrollForward,
                            ),
                    ],
                  ),
          ],
        );
      },
    );
  }
}

class _ScrollIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;
  const _ScrollIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: const CircleBorder(),
        child: Container(
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: ZPColors.grayishBlue,
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          child: icon,
        ),
      ),
    );
  }
}

class _SimilarProductCard extends StatelessWidget {
  final MaterialInfo material;
  const _SimilarProductCard({
    Key? key,
    required this.material,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: MaterialGridItem(
        materialInfo: material,
        onTap: () => _productOnTap(context, material),
      ),
    );
  }

  void _productOnTap(BuildContext context, MaterialInfo materialInfo) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    context.read<ProductDetailBloc>().add(
          ProductDetailEvent.fetch(
            materialNumber: materialInfo.materialNumber,
            salesOrganisation: eligibilityState.salesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            locale: context.locale,
          ),
        );
    context.read<MaterialPriceBloc>().add(
          MaterialPriceEvent.fetch(
            salesOrganisation: eligibilityState.salesOrganisation,
            salesConfigs: eligibilityState.salesOrgConfigs,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            comboDealEligible: eligibilityState.comboDealEligible,
            materials: [materialInfo],
          ),
        );
  }
}

class _LoadingShimmerSimilarProduct extends StatelessWidget {
  const _LoadingShimmerSimilarProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        4,
        (index) => const MaterialLoading(),
      ),
    );
  }
}
