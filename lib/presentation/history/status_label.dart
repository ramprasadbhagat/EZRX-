import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter/material.dart';

class StatusLabel extends StatelessWidget {
  const StatusLabel({
    Key? key,
    required this.status,
  }) : super(key: key);

  final StatusType status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: status.displayStatusLabelColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Text(
        status.getOrCrash(),
        style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
  }
}
