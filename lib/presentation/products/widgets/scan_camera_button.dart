import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanCameraButton extends StatelessWidget {
  const ScanCameraButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 1,
            color: ZPColors.inputBorderColor,
          ),
        ),
      ),
      child: IconButton(
        splashRadius: 1,
        key: WidgetKeys.productScanCameraKey,
        icon: const Icon(
          Icons.camera_alt_outlined,
        ),
        onPressed: () => {
          trackMixpanelEvent(TrackingEvents.scanClicked),
          context.router.pushNamed('orders/scan_material_info'),
          context.read<ScanMaterialInfoBloc>().add(
                ScanMaterialInfoEvent.scanMaterialNumberFromCamera(
                  materialFilter:
                      context.read<MaterialFilterBloc>().state.materialFilter,
                ),
              ),
        },
      ),
    );
  }
}
