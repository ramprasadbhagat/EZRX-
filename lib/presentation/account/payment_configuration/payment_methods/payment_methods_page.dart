import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/add_payment_method/add_payment_method_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/manage_payment_method/manage_payment_methods_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/payment_methods_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/available_payment_method.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/dialogs/custom_dialogs.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Methods Management').tr()),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocBuilder<PaymentMethodsBloc, PaymentMethodsState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching ||
              previous.paymentMethodList != current.paymentMethodList,
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
                        state: state,
                      );
                    },
                    items: state.paymentMethodList,
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('addPaymentMethodKey'),
        onPressed: () {
          context
              .read<AddPaymentMethodBloc>()
              .add(const AddPaymentMethodEvent.initialized());
          context.router.pushNamed('add_payment_methods');
        },
        child: const Icon(Icons.add),
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
  final PaymentMethodsState state;

  const _PaymentMethodListItem({
    Key? key,
    required this.paymentMethod,
    required this.index,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManagePaymentMethodsBloc, ManagePaymentMethodsState>(
      listenWhen: (previous, current) =>
          previous.deleteIndex != current.deleteIndex &&
          current.deleteIndex == -1 &&
          previous.isSubmitting != current.isSubmitting &&
          !current.isSubmitting,
      listener: (context, state) {
        context
            .read<PaymentMethodsBloc>()
            .add(const PaymentMethodsEvent.fetch());
      },
      buildWhen: (previous, current) =>
          previous.deleteIndex != current.deleteIndex,
      builder: (context, state) {
        return Card(
          child: CustomSlidable(
            endActionPaneActions: [
              CustomSlidableAction(
                label: 'Delete',
                icon: Icons.delete_outline,
                onPressed: (context) =>
                    context.read<ManagePaymentMethodsBloc>().add(
                          ManagePaymentMethodsEvent.deletePaymentMethod(
                            salesOrg: paymentMethod.salesOrg,
                            paymentMethod: paymentMethod.paymentMethod,
                            deleteIndex: index,
                          ),
                        ),
              ),
            ],
            borderRadius: 8,
            child: ListTile(
              key: Key(
                'paymentMethod$index',
              ),
              onTap: () {
                context.router.push(
                  EditPaymentMethodsPageRoute(
                    salesOrg: paymentMethod.salesOrg,
                    oldPaymentMethod: paymentMethod.paymentMethod,
                  ),
                );
              },
              title: state.deleteIndex == index
                  ? SizedBox(
                      key: const Key('salesorg-loading'),
                      width: 40,
                      child: LoadingShimmer.tile(),
                    )
                  : Text(
                      '${paymentMethod.salesOrg.getOrDefaultValue('')} - ${paymentMethod.salesOrg.buName}',
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.kPrimaryColor,
                          ),
                    ),
              subtitle: state.deleteIndex == index
                  ? SizedBox(
                      key: const Key('paymentmethod-loading'),
                      width: 40,
                      child: LoadingShimmer.tile(),
                    )
                  : Text(
                      paymentMethod.paymentMethod.getOrDefaultValue(''),
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.darkGray,
                          ),
                    ),
              trailing: IconButton(
                key: Key('deleteIcon$index'),
                padding: const EdgeInsets.only(right: 8),
                icon: const Icon(Icons.delete),
                onPressed: () => _deletePaymentMethod(
                  context: context,
                  paymentMethod: paymentMethod,
                  deleteIndex: index,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _deletePaymentMethod({
    required BuildContext context,
    required AvailablePaymentMethod paymentMethod,
    required int deleteIndex,
  }) {
    CustomDialogs.confirmationDialog(
      context: context,
      title: 'Delete payment method'.tr(),
      message: 'Are you sure you want to delete this payment method?'.tr(),
      //onCancelPressed: () => context.router.pop(),
      onAcceptPressed: () async => context.read<ManagePaymentMethodsBloc>().add(
            ManagePaymentMethodsEvent.deletePaymentMethod(
              salesOrg: paymentMethod.salesOrg,
              paymentMethod: paymentMethod.paymentMethod,
              deleteIndex: deleteIndex,
            ),
          ),
      confirmText: 'Delete',
    );
  }
}
