import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';

class PriceSheet extends StatefulWidget {
  const PriceSheet({Key? key, required this.item, required this.onTap})
      : super(key: key);

  @override
  _PriceSheetState createState() => _PriceSheetState();

  final PriceAggregate item;
  final Function onTap;
}

class _PriceSheetState extends State<PriceSheet> {
  double newPrice = 0;
  @override
  void initState() {
    super.initState();

    newPrice = widget.item.getNewPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height * 35 / 100,
        child: Material(
          elevation: 15.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 0.0,
                  top: 20.0,
                  left: 5,
                  right: 5,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Wrap(
                        children: [
                          Text(
                            widget.item.materialInfo.materialDescription,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: ZPColors.darkGreen,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 2),
                          child: Text(
                            widget.item.salesOrgConfig.currency.symbol,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: ZPColors.darkGreen,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2.0,
                            vertical: 10.0,
                          ),
                          child: SizedBox(
                            width: 120.0,
                            height: 30.0,
                            child: TextFormField(
                              enableInteractiveSelection: false,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                signed: false,
                                decimal: true,
                              ),
                              textAlign: TextAlign.center,
                              controller: TextEditingController.fromValue(
                                TextEditingValue(
                                  text: (newPrice).toStringAsFixed(2),
                                  selection: TextSelection.collapsed(
                                    offset:
                                        (newPrice).toStringAsFixed(2).length,
                                  ),
                                ),
                              ),
                              onChanged: (text) => {
                                if (text.isNotEmpty)
                                  {
                                    newPrice = double.parse(text),
                                  },
                              },
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              BlocConsumer<PriceOverrideBloc, PriceOverrideState>(
                listenWhen: (
                  previous,
                  current,
                ) =>
                    previous.isFetching != current.isFetching,
                listener: (
                  context,
                  state,
                ) {
                  state.apiFailureOrSuccessOption.fold(
                    () {},
                    (either) => either.fold(
                      (failure) {
                        final failureMessage = failure.failureMessage;
                        showSnackBar(
                          context: context,
                          message: failureMessage.tr(),
                        );
                        if (failureMessage == 'authentication failed') {
                          context.read<AuthBloc>().add(
                                const AuthEvent.logout(),
                              );
                        }
                      },
                      (_) {},
                    ),
                  );

                  if (state.cartItemList.isNotEmpty &&
                      state.apiFailureOrSuccessOption.isNone()) {
                    context.read<CartBloc>().add(
                          CartEvent.updateCart(
                            item: state.cartItemList,
                            materialNumber: widget
                                .item.materialInfo.materialNumber
                                .getOrCrash(),
                          ),
                        );
                  }
                },
                buildWhen: (previous, current) =>
                    previous.isFetching != current.isFetching,
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: state.isFetching
                        ? const SizedBox(
                            height: 20,
                            width: 80,
                            child: LoadingIndicator(
                              indicatorType: Indicator.ballPulse,
                              colors: [
                                ZPColors.secondary,
                              ],
                            ),
                          )
                        : GestureDetector(
                            onTap: () async {
                              widget.onTap(newPrice);
                              Navigator.pop(context);
                            },
                            child: Container(
                              width:
                                  MediaQuery.of(context).size.width * 60 / 100,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  18.0,
                                ),
                                gradient: const LinearGradient(
                                  colors: <Color>[
                                    ZPColors.primary,
                                    ZPColors.gradient,
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Override Price'.tr(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
