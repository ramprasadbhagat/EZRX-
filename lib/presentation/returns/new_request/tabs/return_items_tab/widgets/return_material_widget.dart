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
          child: EdgeCheckbox(
            onChanged: (bool value) {
              context.read<NewRequestBloc>().add(
                    NewRequestEvent.toggleReturnItem(
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
          ),
        );
      },
    );
  }
}
