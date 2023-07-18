import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MarketSelector extends StatefulWidget {
  const MarketSelector({Key? key}) : super(key: key);

  @override
  State<MarketSelector> createState() => _MarketSelectorState();
}

class _MarketSelectorState extends State<MarketSelector> {
  List<String> markets = [
    'hk',
    'kh',
    'kr',
    'mm',
    'ph',
    'sg',
    'th',
    'tw',
    'vn',
    'my',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Market'.tr(),
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(height: 8),
        BlocBuilder<LoginFormBloc, LoginFormState>(
          builder: (context, state) {
            return DropdownButtonFormField<AppMarket>(
              key: WidgetKeys.appMarketSelector,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ZPColors.primary, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: ZPColors.black,
              ),
              items:
                  markets.map((e) => AppMarket(e)).toList().map((marketType) {
                return DropdownMenuItem<AppMarket>(
                  value: marketType,
                  child: Text(marketType.marketName),
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
