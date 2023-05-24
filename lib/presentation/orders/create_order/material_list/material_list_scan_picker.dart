import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MaterialListScanPicker extends StatelessWidget {
  const MaterialListScanPicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityBlocState = context.read<EligibilityBloc>().state;

    return PlatformAlertDialog(
      key: const ValueKey('scanMaterialInfoDialog'),
      title: const Text(
        'Scan Material Code',
      ).tr(),
      content: const Text(
        'Scan From Camera Or Device Storage',
      ).tr(),
      actions: [
        PlatformDialogAction(
          key: const Key('scanFromCamera'),
          child: Column(
            children: [
              const Icon(
                Icons.photo_camera,
                color: ZPColors.kPrimaryColor,
              ),
              const Text('Camera').tr(),
            ],
          ),
          onPressed: () {
            context.router.pushNamed('orders/scan_material_info');
            context.read<ScanMaterialInfoBloc>().add(
                  ScanMaterialInfoEvent.scanMaterialNumberFromCamera(
                    customerCodeInfo: eligibilityBlocState.customerCodeInfo,
                    salesOrganisation: eligibilityBlocState.salesOrganisation,
                    shipToInfo: eligibilityBlocState.shipToInfo,
                    user: eligibilityBlocState.user,
                  ),
                );
            context.router.pop();
          },
          cupertino: (_, __) => CupertinoDialogActionData(
            textStyle: const TextStyle(
              color: ZPColors.kPrimaryColor,
            ),
          ),
        ),
        PlatformDialogAction(
          key: const Key('scanFromGallery'),
          child: Column(
            children: [
              const Icon(
                Icons.image,
                color: ZPColors.kPrimaryColor,
              ),
              const Text('Gallery').tr(),
            ],
          ),
          onPressed: () {
            context
                .read<ScanMaterialInfoBloc>()
                .add(ScanMaterialInfoEvent.scanImageFromDeviceStorage(
                  customerCodeInfo: eligibilityBlocState.customerCodeInfo,
                  salesOrganisation: eligibilityBlocState.salesOrganisation,
                  shipToInfo: eligibilityBlocState.shipToInfo,
                  user: eligibilityBlocState.user,
                ));
            context.router.pop();
          },
          cupertino: (_, __) => CupertinoDialogActionData(
            textStyle: const TextStyle(color: ZPColors.kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
