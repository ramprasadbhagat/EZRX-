import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:flutter/material.dart';

class PaymentConfigurationPage extends StatelessWidget {
  const PaymentConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Configuration').tr()),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              ListTile(
                key: const Key('paymentMethodTile'),
                title: const Text('Configure Payment Methods').tr(),
                onTap: () => context.router.pushNamed('payment_methods'),
              ),
              ListTile(
                key: const Key('bankBeneficiaryTile'),
                title: const Text('Manage Bank Beneficiary').tr(),
                onTap: () =>
                    context.router.pushNamed('payments/bank_beneficiary'),
              ),
              ListTile(
                key: const Key('paymentAdviceTile'),
                title: Text('Configure Payment Advice'.tr()),
                onTap: () => context.router.pushNamed('payments/advice_footer'),
              ),
              ListTile(
                key: const Key('deductionCodeTile'),
                title: const Text('Configure Deduction Code').tr(),
                onTap: () =>
                    context.router.pushNamed('payments/deduction_code'),
              ),
              ListTile(
                key: const Key('salesDistrictTile'),
                title: const Text('Configure Sales District').tr(),
                onTap: () =>
                    context.router.pushNamed('payments/sales_district'),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }
}
