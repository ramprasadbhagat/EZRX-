part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_tab.dart';

class _ReturnMaterialWidget extends StatelessWidget {
  final ReturnMaterial data;
  const _ReturnMaterialWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 12),
          child: data.eligibleForReturn
              ? EdgeCheckbox(
                  onChanged: (bool value) {
                    context.read<NewRequestBloc>().add(
                          NewRequestEvent.toggleReturnItem(
                            salesOrg:
                                context.read<SalesOrgBloc>().state.salesOrg,
                            selected: value,
                            item: data,
                          ),
                        );
                    context.read<NewRequestBloc>().add(
                          const NewRequestEvent.validateStep(
                            step: 1,
                          ),
                        );
                  },
                  value: state.selectedItems.contains(data),
                  body: _ReturnMaterialInfo(data: data),
                )
              : _DisabledBox(
                  child: _ReturnMaterialInfo(data: data),
                  onTap: () {
                    CustomSnackBar(
                      icon: const Icon(
                        Icons.warning,
                        color: ZPColors.warning,
                      ),
                      backgroundColor: ZPColors.warning,
                      messageText: 'Material is not eligible for return'.tr(),
                    ).show(context);
                  },
                ),
        );
      },
    );
  }
}

class _DisabledBox extends StatelessWidget {
  const _DisabledBox({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ColorFiltered(
        colorFilter: const ColorFilter.mode(
          ZPColors.translucentWhite,
          BlendMode.dstATop,
        ),
        child: child,
      ),
    );
  }
}
