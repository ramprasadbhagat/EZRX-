import 'package:flutter/material.dart';

class AccountSuspendedBanner extends StatelessWidget {
  const AccountSuspendedBanner({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(0.0),),),
        child: const Center(
          child: Text('Customer is suspended, please contact ZP Admin for support',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),),
      ),
    );
  }
}