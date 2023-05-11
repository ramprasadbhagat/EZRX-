import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/payment_methods_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/available_payment_method.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Methods Management').tr()),
      body: BlocBuilder<PaymentMethodsBloc, PaymentMethodsState>(
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          return state.isFetching
              ? LoadingShimmer.logo(
                  key: const Key('loaderImage'),
                )
              : ScrollList<AvailablePaymentMethod>(
                  emptyMessage: 'No payment method found'.tr(),
                  onRefresh: () => _onRefresh(context: context),
                  isLoading: state.isFetching,
                  onLoadingMore: () {},
                  itemBuilder: (context, index, item) {
                    return _PaymentMethodListItem(
                      paymentMethod: item,
                      index: index,
                    );
                  },
                  items: state.paymentMethodList,
                );
        },
      ),
    );
  }

  void _onRefresh({required BuildContext context}) {
    context
        .read<PaymentMethodsBloc>()
        .add(const PaymentMethodsEvent.initialized());
    context.read<PaymentMethodsBloc>().add(const PaymentMethodsEvent.fetch());
  }
}

class _PaymentMethodListItem extends StatelessWidget {
  final AvailablePaymentMethod paymentMethod;
  final int index;

  const _PaymentMethodListItem({
    Key? key,
    required this.paymentMethod,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CustomSlidable(
        endActionPaneActions: [
          CustomSlidableAction(
            label: 'Delete',
            icon: Icons.delete_outline,
            onPressed: (context) {},
          ),
        ],
        borderRadius: 8,
        child: ListTile(
          key: Key(
            'paymentMethod$index',
          ),
          onTap: () {},
          title: Text(
            '${paymentMethod.salesOrg.getOrCrash()} - ${paymentMethod.salesOrg.buName}',
            style: Theme.of(context).textTheme.titleSmall?.apply(
                  color: ZPColors.kPrimaryColor,
                ),
          ),
          subtitle: Text(
            paymentMethod.paymentMethod,
            style: Theme.of(context).textTheme.titleSmall?.apply(
                  color: ZPColors.darkGray,
                ),
          ),
          trailing: IconButton(
            padding: const EdgeInsets.only(right: 8),
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
