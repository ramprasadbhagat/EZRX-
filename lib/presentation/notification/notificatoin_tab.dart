import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:flutter/material.dart';

class NotificationTab extends StatelessWidget {
  const NotificationTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        automaticallyImplyLeading: false,
        centerTitle: false,
      ),
      body: NoRecordFound(
        title: 'No notifications to show'.tr(),
        subTitle: 'We\'ll notify you when there is something',
        svgImage: SvgImage.notification,
      ),
    );
  }
}
