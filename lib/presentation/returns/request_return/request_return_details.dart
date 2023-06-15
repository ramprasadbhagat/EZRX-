import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/returns/request_return/upload_attachments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/returns/request_return/request_return_bloc.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';

import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';

import 'package:ezrxmobile/domain/returns/entities/usage.dart';

import 'package:ezrxmobile/application/returns/return_price/return_price_bloc.dart';

import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';

import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;

final scaffoldKey = GlobalKey<ScaffoldState>();

class RequestReturnDetails extends StatelessWidget {
  const RequestReturnDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Request Return Details').tr(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _SelectedRequestReturnList(),
          _ProceedSection(),
        ],
      ),
    );
  }
}

class _SelectedRequestReturnList extends StatelessWidget {
  const _SelectedRequestReturnList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestReturnBloc, RequestReturnState>(
      buildWhen: (previous, current) =>
          previous.selectedReturnItems != current.selectedReturnItems,
      builder: (context, state) {
        return state.selectedReturnItems.isNotEmpty
            ? Expanded(
                child: CustomScrollView(
                  key: const Key('selectedReturnItemsList'),
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => _SelectedRequestReturnListItem(
                          returnItem: state.selectedReturnItems[index],
                        ),
                        childCount: state.selectedReturnItems.length,
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: _ReturnRequestNotesSection(),
                    ),
                  ],
                ),
              )
            : const Align(
                alignment: Alignment.center,
                child: NoRecordFound(
                  title: 'No Return Items Added',
                ),
              );
      },
    );
  }
}

class _SelectedRequestReturnListItem extends StatelessWidget {
  const _SelectedRequestReturnListItem({
    Key? key,
    required this.returnItem,
  }) : super(key: key);

  final ReturnItem returnItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: custom.ExpansionTile(
          title: _ReturnItemDetailsSection(
            returnItem: returnItem,
          ),
          initiallyExpanded: true,
          threeLineTitle: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _ReturnType(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _ReturnQuantityInputField(
                        returnItem: returnItem,
                        key: Key(returnItem.uniqueId),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: _SelectedRequestReturnDetailsField(
                        returnItem: returnItem,
                        isEnabled: false,
                        label: RequestReturnLabel.balanceQuantity,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _ReturnReasonDropdown(
                        returnItem: returnItem,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: _SelectedRequestReturnDetailsField(
                        returnItem: returnItem,
                        isEnabled: false,
                        label: RequestReturnLabel.returnValue,
                      ),
                    ),
                  ],
                ),
                _UploadAttachment(
                  returnItem: returnItem,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectedRequestReturnDetailsField extends StatelessWidget {
  final ReturnItem returnItem;
  final bool isEnabled;
  final RequestReturnLabel label;
  final int maxLines;
  final String hintText;

  const _SelectedRequestReturnDetailsField({
    Key? key,
    required this.returnItem,
    required this.isEnabled,
    required this.label,
    this.hintText = '',
    this.maxLines = 1,
  }) : super(key: key);

  String _getInitialValue(
    RequestReturnLabel label,
    BuildContext context,
  ) {
    final configs = context.read<SalesOrgBloc>().state.configs;
    final returnRequestState = context.read<RequestReturnBloc>().state;
    switch (label) {
      case RequestReturnLabel.returnValue:
        return '${configs.currency.getOrDefaultValue('').toUpperCase()} ${returnItem.returnQuantity.returnValue(returnItem.unitPrice)}';
      case RequestReturnLabel.referenceNumber:
        return returnRequestState.returnReferenceNumber;
      case RequestReturnLabel.specialInstructions:
        return returnRequestState.specialInstructions;
      default:
        return returnItem.balanceQuantity.toString();
    }
  }

  Key _getKey(RequestReturnLabel label) {
    switch (label) {
      case RequestReturnLabel.returnValue:
        return Key(
          'returnValue${returnItem.returnQuantity.returnValue(returnItem.unitPrice)}',
        );
      case RequestReturnLabel.balanceQuantity:
        return Key(
          'balanceQuantity${returnItem.uniqueId}',
        );
      default:
        return Key(_getFieldLabel(label));
    }
  }

  String _getFieldLabel(RequestReturnLabel label) {
    switch (label) {
      case RequestReturnLabel.returnValue:
        return 'Return Value (w/o tax):';
      case RequestReturnLabel.referenceNumber:
        return 'Return Reference Number:';
      case RequestReturnLabel.specialInstructions:
        return 'Special Instructions:';
      case RequestReturnLabel.balanceQuantity:
        return 'Balance Quantity:';
      default:
        return '';
    }
  }

  void _onChange(
    RequestReturnLabel label,
    String value,
    BuildContext context,
  ) {
    switch (label) {
      case RequestReturnLabel.returnQuantity:
        context
            .read<RequestReturnBloc>()
            .add(RequestReturnEvent.updateReturnDetails(
              updatedItem: returnItem.copyWith(
                returnQuantity: ReturnQuantity(value),
              ),
            ));
        break;
      case RequestReturnLabel.referenceNumber:
        context.read<RequestReturnBloc>().add(
              RequestReturnEvent.updateReturnRequestReferenceNumber(
                referenceNumber: value,
              ),
            );
        break;
      case RequestReturnLabel.specialInstructions:
        context
            .read<RequestReturnBloc>()
            .add(RequestReturnEvent.updateSpecialInstructions(
              specialInstructions: value,
            ));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              _getFieldLabel(label),
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.black,
                  ),
            ),
          ),
          TextFormField(
            key: _getKey(label),
            onChanged: (value) => _onChange(label, value, context),
            initialValue: _getInitialValue(label, context),
            maxLines: maxLines,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ZPColors.primary, width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              filled: !isEnabled,
              fillColor: ZPColors.extraLightGray,
            ),
            enabled: isEnabled,
          ),
        ],
      ),
    );
  }
}

class _ReturnQuantityInputField extends StatefulWidget {
  final ReturnItem returnItem;
  const _ReturnQuantityInputField({
    Key? key,
    required this.returnItem,
  }) : super(key: key);

  @override
  State<_ReturnQuantityInputField> createState() =>
      _ReturnQuantityInputFieldState();
}

class _ReturnQuantityInputFieldState extends State<_ReturnQuantityInputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(
      text: widget.returnItem.returnQuantity.getOrDefaultValue(''),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'Return Quantity',
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.black,
                  ),
            ),
          ),
          TextFormField(
            controller: _controller,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              FilteringTextInputFormatter.deny(RegExp(r'^0+')),
              LengthLimitingTextInputFormatter(15),
            ],
            onChanged: (value) {
              final offsetValue = ReturnQuantity.validatedValue(
                widget.returnItem.balanceQuantity,
                value,
              ).getValue();
              _controller.value = TextEditingValue(
                text: offsetValue,
                selection: TextSelection.fromPosition(
                  TextPosition(offset: offsetValue.length),
                ),
              );

              context
                  .read<RequestReturnBloc>()
                  .add(RequestReturnEvent.updateReturnDetails(
                    updatedItem: widget.returnItem.copyWith(
                      returnQuantity: ReturnQuantity(_controller.text),
                    ),
                  ));
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Return Quantity'.tr()),
          ),
        ],
      ),
    );
  }
}

class _ReturnReasonDropdown extends StatelessWidget {
  const _ReturnReasonDropdown({
    Key? key,
    required this.returnItem,
  }) : super(key: key);

  final ReturnItem returnItem;

  void _updateReturnRequestReason(BuildContext context, String value) {
    final updatedItem = returnItem.copyWith(
      usage:
          context.read<UsageCodeBloc>().state.getSelectedReturnRequest(value),
    );
    context
        .read<RequestReturnBloc>()
        .add(RequestReturnEvent.updateReturnDetails(
          updatedItem: updatedItem,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final usageList = context.read<UsageCodeBloc>().state.usage;

    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'Reason For Return: ',
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.black,
                  ),
            ),
          ),
          DropdownButtonFormField<String>(
            key: const Key('_returnReasonKey'),
            isExpanded: true,
            value: returnItem.usage == Usage.empty()
                ? null
                : returnItem.usage.usageDescription,
            items: usageList.map(
              (Usage val) {
                return DropdownMenuItem<String>(
                  value: val.usageDescription,
                  child: Text(val.usageDescription),
                );
              },
            ).toList(),
            decoration: InputDecoration(
              hintText: 'Please Select'.tr(),
            ),
            onChanged: (value) => _updateReturnRequestReason(
              context,
              value!,
            ),
          ),
        ],
      ),
    );
  }
}

class _UploadAttachment extends StatelessWidget {
  final ReturnItem returnItem;
  const _UploadAttachment({
    Key? key,
    required this.returnItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<PoAttachmentBloc>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: Text(
              'Upload Attachments: ',
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.black,
                  ),
            ),
          ),
          UploadAttachments(
            returnItem: returnItem,
          ),
        ],
      ),
    );
  }
}

class _ReturnType extends StatelessWidget {
  const _ReturnType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              'Return Type',
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.black,
                  ),
            ),
          ),
          Row(
            children: [
              Radio(
                key: const Key('radioButton'),
                value: '',
                groupValue: '',
                onChanged: (value) {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  'Return',
                  style: Theme.of(context).textTheme.titleSmall?.apply(
                        color: ZPColors.black,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ReturnItemDetailsSection extends StatelessWidget {
  const _ReturnItemDetailsSection({
    Key? key,
    required this.returnItem,
  }) : super(key: key);

  final ReturnItem returnItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              returnItem.materialNumber.displayMatNo,
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.kPrimaryColor,
                  ),
            ),
            Text(
              returnItem.materialDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          iconSize: 18.0,
          color: ZPColors.black,
          onPressed: () {
            context.read<RequestReturnBloc>().add(
                  RequestReturnEvent.updateReturnDetails(
                    updatedItem: returnItem.copyWith(
                      isSelected: false,
                      poDocuments: [],
                      returnQuantity: ReturnQuantity(''),
                      usage: Usage.empty(),
                    ),
                  ),
                );
          },
        ),
      ],
    );
  }
}

class _ProceedSection extends StatelessWidget {
  const _ProceedSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestReturnBloc, RequestReturnState>(
      buildWhen: (previous, current) =>
          previous.returnItemList != current.returnItemList,
      builder: (context, state) {
        return state.selectedReturnItems.isNotEmpty
            ? Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 2.0,
                      offset: Offset(0.0, 0.75),
                    ),
                  ],
                  color: ZPColors.white,
                ),
                child: SafeArea(
                  child: ElevatedButton(
                    key: const ValueKey('goToSubmitReturnsPage'),
                    onPressed: state.isNotValidated
                        ? null
                        : () {
                            context.read<ReturnPriceBloc>().add(
                                  ReturnPriceEvent.fetchReturnPrice(
                                    salesOrg: context
                                        .read<SalesOrgBloc>()
                                        .state
                                        .salesOrganisation,
                                    returnItemList: state.selectedReturnItems,
                                  ),
                                );
                            context.router.pushNamed(
                              'request_return_details_summary',
                            );
                          },
                    child: const Text('Proceed').tr(),
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}

class _ReturnRequestNotesSection extends StatelessWidget {
  const _ReturnRequestNotesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: const Key('requestReturnNotesSection'),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SelectedRequestReturnDetailsField(
              isEnabled: true,
              returnItem: ReturnItem.empty(),
              label: RequestReturnLabel.referenceNumber,
              hintText: 'Enter tour returns reference',
            ),
            _SelectedRequestReturnDetailsField(
              isEnabled: true,
              returnItem: ReturnItem.empty(),
              label: RequestReturnLabel.specialInstructions,
              maxLines: 4,
              hintText:
                  'Eg Instructions to drivers related to pickup return items',
            ),
          ],
        ),
      ),
    );
  }
}
