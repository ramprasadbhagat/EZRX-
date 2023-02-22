import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_rights_details.dart';
import 'package:ezrxmobile/presentation/core/confirm_clear_cart_dialog.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction_details/user_restriction_details_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction/user_restriction_list_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';

class AddEditUserRestrictionPage extends StatelessWidget {
  final bool isEditing;

  AddEditUserRestrictionPage({
    Key? key,
    required this.isEditing,
  }) : super(key: key);
  final returnApprovalLimitFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('AddEditUserRestrictionPage'),
      backgroundColor: ZPColors.white,
      appBar: AppBar(
        title: Text(isEditing ? 'Configure Restriction' : 'Add Restriction'),
      ),
      body:
          BlocConsumer<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
        listenWhen: (previous, current) =>
            previous.userRestrictionStatus !=
                current.userRestrictionStatus ||
            previous.apiFailureOrSuccessOption !=
                current.apiFailureOrSuccessOption,
        listener: (context, state) {
          state.apiFailureOrSuccessOption.fold(
            () {
              if (state.userRestrictionStatus.ifUserAdded) {
                if (state
                    .userRestrictionStatus.ifUserNotConfigured) {
                  showSnackBar(
                    context: context,
                    message: 'No New Records Added',
                  );

                  return;
                }
                context.read<UserRestrictionListBloc>().add(
                      UserRestrictionListEvent.fetch(
                        salesOrg: context
                            .read<EligibilityBloc>()
                            .state
                            .salesOrganisation
                            .salesOrg,
                      ),
                    );
                context.router.pop();
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
        builder: (context, state) {
          return state.isFetching
              ? LoadingShimmer.logo(
                  key: const Key('LoaderImage'),
                )
              : Padding(
                  padding: const EdgeInsets.all(15),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'User Restrictions',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Form(
                              key: returnApprovalLimitFormKey,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  _TextFormField(
                                    label: UserRestrictionLabel.userName,
                                    keyText: 'userNameKey',
                                    value: state.approverRights.userName
                                        .getValue(),
                                    isFromEdit: isEditing,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  _TextFormField(
                                    label:
                                        UserRestrictionLabel.returnLowerLimit,
                                    keyText: 'returnLowerLimit',
                                    value: state.approvalLimits.valueLowerLimit
                                        .parsedValue,
                                    isFromEdit: isEditing,
                                    keyboardType: TextInputType.number,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  _TextFormField(
                                    label:
                                        UserRestrictionLabel.returnUpperLimit,
                                    keyText: 'returnUpperLimit',
                                    value: state.approvalLimits.valueUpperLimit
                                        .parsedValue,
                                    isFromEdit: isEditing,
                                    keyboardType: TextInputType.number,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Approver Rights',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  key: const Key('addApproverRightsButton'),
                                  onPressed: () {
                                    context
                                        .read<UserRestrictionDetailsBloc>()
                                        .add(
                                          UserRestrictionDetailsEvent
                                              .addApproverRights(
                                            salesOrg: context
                                                .read<EligibilityBloc>()
                                                .state
                                                .salesOrganisation
                                                .salesOrg,
                                          ),
                                        );
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: ZPColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => _ApproverRights(
                            approverRights:
                                state.addedApproverRightsList[index],
                            index: index,
                            isFromEdit: isEditing,
                          ),
                          childCount: state.addedApproverRightsList.length,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: _AddDeleteButton(
                          isEditing: isEditing,
                          formKey: returnApprovalLimitFormKey,
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

class _AddDeleteButton extends StatelessWidget {
  final bool isEditing;
  final GlobalKey<FormState> formKey;

  const _AddDeleteButton({
    Key? key,
    required this.isEditing,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (isEditing)
            OutlinedButton(
              key: const Key('onDeletePressed'),
              onPressed: () {
                ConfirmClearDialog.show(
                  context: context,
                  onCancel: () {
                    context.router.pop();
                  },
                  title: 'Confirm Delete'.tr(),
                  description: 'User Restriction Will be deleted'.tr(),
                  onConfirmed: () {
                    context.read<UserRestrictionDetailsBloc>().add(
                          const UserRestrictionDetailsEvent
                              .deleteUserRestriction(),
                        );
                    context.router.pop();
                  },
                  confirmText: 'Confirm',
                );
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: ZPColors.primary),
              ).tr(),
            ),
          ElevatedButton(
            key: const Key('onAddPressed'),
            onPressed: () => _onSubmit(context),
            child: const Text('Submit').tr(),
          ),
        ],
      ),
    );
  }

  void _onSubmit(BuildContext context) {
    final state = context.read<UserRestrictionDetailsBloc>().state;
    if (!state.isRestrictionAdded) {
      showSnackBar(
        context: context,
        message: 'User Restriction Not Added'.tr(),
      );

      return;
    }
    if (formKey.currentState!.validate()) {
      context.read<UserRestrictionDetailsBloc>().add(
            isEditing
                ? const UserRestrictionDetailsEvent.configureUserRestriction()
                : const UserRestrictionDetailsEvent.addUserRestriction(),
          );
    }
  }
}

class _ApproverRights extends StatelessWidget {
  final ApproverRightsDetails approverRights;
  final int index;
  final bool isFromEdit;

  const _ApproverRights({
    Key? key,
    required this.approverRights,
    required this.index,
    required this.isFromEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return custom.ExpansionTile(
      title: Row(
        children: [
          Text(approverRights.salesOrg.getOrCrash()),
          _showDeleteIcon(context)
              ? IconButton(
                  icon: const Icon(Icons.delete),
                  iconSize: 18.0,
                  color: ZPColors.black,
                  onPressed: () {
                    context.read<UserRestrictionDetailsBloc>().add(
                          UserRestrictionDetailsEvent.deleteApproverRights(
                            approverRightsDetails: approverRights,
                          ),
                        );
                  },
                )
              : const SizedBox.shrink(),
        ],
      ),
      children: [
        const SizedBox(
          height: 15,
        ),
        _TextFormField(
          label: UserRestrictionLabel.salesOrg,
          keyText: 'salesOrganization',
          value: approverRights.salesOrg.getValue(),
          index: index,
          isFromEdit: isFromEdit,
        ),
        const SizedBox(
          height: 15,
        ),
        _TextFormField(
          label: UserRestrictionLabel.principal,
          keyText: 'principal',
          value: approverRights.principal,
          index: index,
          isFromEdit: isFromEdit,
        ),
        const SizedBox(
          height: 15,
        ),
        _TextFormField(
          label: UserRestrictionLabel.industryCode1,
          keyText: 'industryCode1',
          value: approverRights.industryCode1,
          index: index,
          isFromEdit: isFromEdit,
        ),
        const SizedBox(
          height: 15,
        ),
        _TextFormField(
          label: UserRestrictionLabel.industryCode2,
          keyText: 'industryCode2',
          value: approverRights.industryCode2,
          index: index,
          isFromEdit: isFromEdit,
        ),
        const SizedBox(
          height: 15,
        ),
        _TextFormField(
          label: UserRestrictionLabel.industryCode3,
          keyText: 'industryCode3',
          value: approverRights.industryCode3,
          index: index,
          isFromEdit: isFromEdit,
        ),
        const SizedBox(
          height: 15,
        ),
        _TextFormField(
          label: UserRestrictionLabel.industryCode4,
          keyText: 'industryCode4',
          value: approverRights.industryCode4,
          index: index,
          isFromEdit: isFromEdit,
        ),
        const SizedBox(
          height: 15,
        ),
        _TextFormField(
          label: UserRestrictionLabel.industryCode5,
          keyText: 'industryCode5',
          value: approverRights.industryCode5,
          index: index,
          isFromEdit: isFromEdit,
        ),
        const SizedBox(
          height: 15,
        ),
        _TextFormField(
          label: UserRestrictionLabel.plant,
          keyText: 'plant',
          value: approverRights.plant,
          index: index,
          isFromEdit: isFromEdit,
        ),
        const SizedBox(
          height: 15,
        ),
        _TextFormField(
          label: UserRestrictionLabel.materialNumber,
          keyText: 'materialNumber',
          value: approverRights.materialNumber.getValue(),
          index: index,
          isFromEdit: isFromEdit,
        ),
      ],
    );
  }

  bool _showDeleteIcon(BuildContext context) {
    final state = context.read<UserRestrictionDetailsBloc>().state;
    if (index == 0) return false;

    return index > state.approverRightsList.length - 1;
  }
}

class _TextFormField extends StatefulWidget {
  final UserRestrictionLabel label;
  final String keyText;
  final bool isFromEdit;
  final TextInputType keyboardType;
  final String value;
  final int index;

  const _TextFormField({
    required this.label,
    required this.keyText,
    required this.value,
    this.index = 0,
    this.keyboardType = TextInputType.text,
    required this.isFromEdit,
    Key? key,
  }) : super(key: key);

  @override
  State<_TextFormField> createState() => _TextFormFieldState();
}

class _TextFormFieldState extends State<_TextFormField> {
  late TextEditingController _controller;

  TextEditingController _getController({required String text}) {
    return TextEditingController.fromValue(TextEditingValue(
      text: text,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = _getController(
      text: widget.value,
    );
    super.initState();
  }

  String? _validate(UserRestrictionLabel label, String value) {
    final userRestrictionsDetailsState =
        context.read<UserRestrictionDetailsBloc>().state;
    switch (label) {
      case UserRestrictionLabel.returnUpperLimit:
        return userRestrictionsDetailsState.approvalLimits.valueLowerLimit.value
            .fold(
          (f) => f.maybeMap(
            empty: (_) => null,
            orElse: () => null,
          ),
          (_) {
            if (!userRestrictionsDetailsState
                .approvalLimits.isValidReturnLimitValue) {
              return 'Return Upper Limit should be greater than Return Lower Limit';
            }

            return null;
          },
        );
      default:
        if (value.isEmpty) return 'Please fill in this field';
    }

    return null;
  }

  String _getLabelText(UserRestrictionLabel label) {
    switch (label) {
      case UserRestrictionLabel.userName:
        return 'UserName';
      case UserRestrictionLabel.industryCode1:
        return 'Industry Code 1';
      case UserRestrictionLabel.industryCode2:
        return 'Industry Code 2';
      case UserRestrictionLabel.industryCode3:
        return 'Industry Code 3';
      case UserRestrictionLabel.industryCode4:
        return 'Industry Code 4';
      case UserRestrictionLabel.industryCode5:
        return 'Industry Code 5';
      case UserRestrictionLabel.plant:
        return 'Plant';
      case UserRestrictionLabel.principal:
        return 'Principal';
      case UserRestrictionLabel.materialNumber:
        return 'Material Number';
      case UserRestrictionLabel.returnLowerLimit:
        return 'Return Lower Limit';
      case UserRestrictionLabel.returnUpperLimit:
        return 'Return Upper Limit';
      case UserRestrictionLabel.salesOrg:
        return 'Sales Organisation';
    }
  }

  bool get _isEnabled {
    final state = context.read<UserRestrictionDetailsBloc>().state;
    if (widget.label == UserRestrictionLabel.salesOrg) return false;
    if (widget.label == UserRestrictionLabel.userName) return true;
    if (widget.label == UserRestrictionLabel.returnLowerLimit ||
        widget.label == UserRestrictionLabel.returnUpperLimit) {
      return !widget.isFromEdit;
    }

    if (state.approverRightsList.isEmpty) return true;

    return widget.index > state.approverRightsList.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: Key(widget.keyText),
      controller: _controller,
      onChanged: (value) {
        context.read<UserRestrictionDetailsBloc>().add(
              UserRestrictionDetailsEvent.updateTextField(
                value: value,
                index: widget.index,
                label: widget.label,
              ),
            );
      },
      decoration: InputDecoration(
        labelText: _getLabelText(widget.label),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ZPColors.primary, width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        filled: !_isEnabled,
        fillColor: ZPColors.extraLightGray,
      ),
      validator: (value) => _validate(widget.label, _controller.text),
      enabled: _isEnabled,
    );
  }
}
