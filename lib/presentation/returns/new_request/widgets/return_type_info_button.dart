import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/return_type_info_bottomsheet.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ReturnTypeInfoIcon extends StatelessWidget {
  final ReturnType returnType;
  const ReturnTypeInfoIcon({
    Key? key,
    required this.returnType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        builder: (_) => ReturnTypeInfoBottomSheet(
          returnType: returnType,
        ),
      ),
      color: ZPColors.primary,
      icon: const Icon(Icons.info, size: 20),
    );
  }
}
