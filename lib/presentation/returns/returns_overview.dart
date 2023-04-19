import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:flutter/material.dart';

class ReturnsOverview extends StatelessWidget {
  const ReturnsOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    trackMixpanelEvent(
      MixpanelEvents.pageViewVisited,
      props: {
        MixpanelProps.pageViewName: runtimeType.toString(),
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Returns Overview').tr()),
      body: Container(),
    );
  }
}
