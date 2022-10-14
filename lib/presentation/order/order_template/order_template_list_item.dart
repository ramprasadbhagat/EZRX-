import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/presentation/core/action_button.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTemplateListItem extends StatelessWidget {
  final OrderTemplate orderTemplate;
  const OrderTemplateListItem({Key? key, required this.orderTemplate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderTemplateListBloc, OrderTemplateListState>(
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {},
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return Container(
          key: Key(
            'materialOption${orderTemplate.templateId}',
          ),
          child: Card(
            elevation: 1.0,
            margin: const EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Template Name : ${orderTemplate.templateName}',
                          softWrap: true,
                          style: _textStyle,
                        ),
                      ),
                    ],
                  ),
                  _sizedBoxH20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ActionButton(
                        text: 'Delete',
                        width: 72,
                        onTap: () {
                          context.read<OrderTemplateListBloc>().add(
                                OrderTemplateListEvent.delete(
                                  orderTemplate,
                                ),
                              );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static const _sizedBoxH20 = SizedBox(
    height: 20,
  );
  static const _textStyle = TextStyle(
    fontSize: 15.0,
    color: ZPColors.primary,
    fontWeight: FontWeight.w500,
  );
}
