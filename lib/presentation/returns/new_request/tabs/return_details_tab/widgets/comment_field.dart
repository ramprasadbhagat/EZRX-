part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';

class _CommentsField extends StatelessWidget {
  const _CommentsField({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  final String uuid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.getReturnItemDetails(uuid).remarks !=
          current.getReturnItemDetails(uuid).remarks,
      builder: (context, state) {
        return TextFieldWithLabel(
          fieldKey: WidgetKeys.returnCommentField(uuid),
          labelText: 'Comments'.tr(),
          onChanged: (value) => context.read<NewRequestBloc>().add(
                NewRequestEvent.additionInfoChanged(
                  additionInfo: context
                      .read<NewRequestBloc>()
                      .state
                      .getReturnItemDetails(uuid)
                      .copyWith(
                        remarks: Remarks(value),
                      ),
                ),
              ),
          initValue:
              state.getReturnItemDetails(uuid).remarks.getOrDefaultValue(''),
          maxLength: 200,
          decoration:
              InputDecoration(hintText: 'Max. 200 characters (Optional)'.tr()),
          isEnabled: true,
        );
      },
    );
  }
}
