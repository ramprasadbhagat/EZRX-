import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceSheet extends StatefulWidget {
  const PriceSheet({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<PriceSheet> createState() => _PriceSheetState();

  final PriceAggregate item;
}

class _PriceSheetState extends State<PriceSheet> {
  double newPrice = 0;
  TextEditingController _controller = TextEditingController();

  TextEditingController _getInitValueWithController({required String text}) {
    return TextEditingController.fromValue(
      TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(
          offset: _controller.selection.base.offset,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    newPrice = widget.item.price.priceOverride.getOrDefaultValue(0);
    _controller = _getInitValueWithController(
      text: newPrice == 0.0 ? '' : StringUtils.formatter.format(newPrice),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isVN = widget.item.salesOrgConfig.currency.isVN;

    return Padding(
      key: const Key('priceSheetKey'),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 35 / 100,
        child: Material(
          elevation: 15.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
              top: 20.0,
              left: 5,
              right: 5,
            ),
            child: BlocConsumer<PriceOverrideBloc, PriceOverrideState>(
              listenWhen: (previous, current) =>
                  previous.isFetching != current.isFetching,
              listener: (context, state) {
                state.apiFailureOrSuccessOption.fold(
                  () {
                    if (!state.isFetching) {
                      // context.read<CartBloc>().add(
                      //       CartEvent.updateCart(
                      //         item: state.cartItemList,
                      //         materialNumber: widget
                      //             .item.materialInfo.materialNumber
                      //             .getOrCrash(),
                      //       ),
                      //     );
                      context.router.pop(state.cartItemList);
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
              buildWhen: (previous, current) =>
                  previous.showErrorMessages != current.showErrorMessages ||
                  previous.isFetching != current.isFetching,
              builder: (context, state) {
                return Form(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  child: ListView(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              widget.item.materialInfo.materialDescription,
                              style:
                                  Theme.of(context).textTheme.titleLarge?.apply(
                                        color: ZPColors.black,
                                      ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: _PriceOverrideField(
                              controller: _controller,
                              isVN: isVN,
                              currencyCode:
                                  widget.item.salesOrgConfig.currency.code,
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                      ElevatedButton(
                        key: const Key('priceOverrideSubmitButton'),
                        onPressed: state.isFetching
                            ? null
                            : () {
                                FocusScope.of(context).unfocus();
                                if (widget.item.salesOrgConfig.priceOverride) {
                                  context.read<PriceOverrideBloc>().add(
                                        PriceOverrideEvent.fetch(
                                          item: widget.item,
                                          salesOrganisation: context
                                              .read<SalesOrgBloc>()
                                              .state
                                              .salesOrganisation,
                                          customerCodeInfo: context
                                              .read<CustomerCodeBloc>()
                                              .state
                                              .customerCodeInfo,
                                        ),
                                      );
                                }
                              },
                        child: LoadingShimmer.withChild(
                          enabled: state.isFetching,
                          child: const Text('Override Price').tr(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _PriceOverrideField extends StatelessWidget {
  final TextEditingController controller;
  final bool isVN;
  final String currencyCode;

  const _PriceOverrideField({
    Key? key,
    required this.controller,
    required this.isVN,
    required this.currencyCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceOverrideBloc, PriceOverrideState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return TextFormField(
          key: const Key('priceOverrideTextFormField'),
          decoration: InputDecoration(
            hintText: 'Enter price override',
            prefixText: isVN ? null : '  ${currencyCode.tr()}',
            suffixText: isVN ? '${currencyCode.tr()}  ' : null,
            contentPadding: EdgeInsets.zero,
          ),
          style: Theme.of(context).textTheme.titleSmall,
          enableInteractiveSelection: false,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(
              RegExp(r'^\d+\.?\d{0,2}'),
            ),
          ],
          keyboardType: const TextInputType.numberWithOptions(
            signed: false,
            decimal: true,
          ),
          textAlign: TextAlign.center,
          controller: controller,
          validator: (text) => PriceOverrideValue(
            text == null || text.isEmpty ? 0.0 : double.parse(text),
          ).value.fold(
                (f) => f.maybeMap(
                  numberMustBiggerThanZero: (_) =>
                      'Priceoverride cannot be empty or zero.'.tr(),
                  orElse: () => null,
                ),
                (_) => null,
              ),
          onChanged: (text) => context.read<PriceOverrideBloc>().add(
                PriceOverrideEvent.priceOverrideValueChanged(
                  newPrice: text.isNotEmpty ? text : '0.0',
                ),
              ),
        );
      },
    );
  }
}
