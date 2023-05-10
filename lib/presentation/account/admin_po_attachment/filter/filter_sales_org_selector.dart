import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/admin_po_attachment/filter/admin_po_attachment_filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AdminPoAttachmentFilterSalesOrgSelector extends StatelessWidget {
  const AdminPoAttachmentFilterSalesOrgSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      title: FittedBox(
        child: const Text('Please select a Sales Org').tr(),
      ),
      material: (context, platform) => MaterialAlertDialogData(
        scrollable: true,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: context
            .read<UserBloc>()
            .state
            .userSalesOrganisations
            .map(
              (e) => PlatformDialogAction(
                key: Key('salesOrgOption${e.salesOrg.getOrDefaultValue('')}'),
                child: Text(e.salesOrg.fullName),
                onPressed: () {
                  context.read<AdminPoAttachmentFilterBloc>().add(
                        AdminPoAttachmentFilterEvent.salesOrgChanged(
                          e.salesOrg,
                        ),
                      );
                  context.router.pop();
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
