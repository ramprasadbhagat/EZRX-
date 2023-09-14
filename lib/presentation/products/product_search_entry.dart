import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';

import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

class ProductSearchEntry extends StatelessWidget {
  const ProductSearchEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        context.router.pushNamed('product_suggestion_page');
      },
      decoration: InputDecoration(
        hintText: 'Search by product name or code'.tr(),
        prefixIcon: const Icon(
          Icons.search,
          size: 20,
        ),
        suffixIcon: IconButton(
          splashRadius: 1,
          key: WidgetKeys.productScanCameraKey,
          icon: const Icon(
            Icons.camera_alt_outlined,
          ),
          onPressed: () => {
            trackMixpanelEvent(
              MixpanelEvents.scannerClicked,
            ),
            context.router.pushNamed('orders/scan_material_info'),
            context.read<ScanMaterialInfoBloc>().add(
                  ScanMaterialInfoEvent.scanMaterialNumberFromCamera(
                    customerCodeInfo:
                        context.read<EligibilityBloc>().state.customerCodeInfo,
                    salesOrganisation:
                        context.read<EligibilityBloc>().state.salesOrganisation,
                    shipToInfo:
                        context.read<EligibilityBloc>().state.shipToInfo,
                    user: context.read<EligibilityBloc>().state.user,
                    salesOrgConfigs:
                        context.read<EligibilityBloc>().state.salesOrgConfigs,
                  ),
                ),
          },
        ),
      ),
    );
  }
}
