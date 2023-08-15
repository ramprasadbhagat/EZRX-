import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MarketSelector extends StatefulWidget {
  const MarketSelector({Key? key}) : super(key: key);

  @override
  State<MarketSelector> createState() => _MarketSelectorState();
}

class _MarketSelectorState extends State<MarketSelector> {
  List<AppMarket> markets = [
    AppMarket('kh'),
    AppMarket('hk'),
    AppMarket('id'),
    AppMarket('kr'),
    AppMarket('my'),
    AppMarket('mm'),
    AppMarket('ph'),
    AppMarket('sg'),
    AppMarket('tw'),
    AppMarket('th'),
    AppMarket('vn'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Market'.tr(),
            style: Theme.of(context).textTheme.labelSmall,
            children: <TextSpan>[
              TextSpan(
                text: ' *',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: ZPColors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        BlocBuilder<LoginFormBloc, LoginFormState>(
          builder: (context, state) {
            return DropdownButtonFormField2<AppMarket>(
              key: WidgetKeys.appMarketSelector,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 10, 12, 10),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: ZPColors.black,
                ),
              ),
              selectedItemBuilder: (context) {
                return markets.map<Widget>((AppMarket item) {
                  return Row(
                    children: [
                      ClipOval(
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: SvgPicture.asset(
                            item.countryFlag,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(state.currentMarket.marketName),
                    ],
                  );
                }).toList();
              },
              items:
                  markets.map((marketType) {
                return DropdownMenuItem<AppMarket>(
                  value: marketType,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: SvgPicture.asset(
                                marketType.countryFlag,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(marketType.marketName),
                        ],
                      ),
                      state.currentMarket == marketType
                          ? const Icon(
                              Icons.check,
                              color: ZPColors.black,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                );
              }).toList(),
              value: state.currentMarket,
              onChanged: (selectedMarket) => {
                context.read<LoginFormBloc>().add(
                      LoginFormEvent.setCurrentMarket(
                        selectedMarket?.getValue() ??
                            AppMarket('my').getValue(),
                      ),
                    ),
              },
            );
          },
        ),
      ],
    );
  }
}
