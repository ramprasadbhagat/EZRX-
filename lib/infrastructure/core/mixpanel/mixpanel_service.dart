import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MixpanelService {
  late Mixpanel mixpanel;
  late Config config;

  EZReachBanner banner = EZReachBanner.empty();

  MixpanelService({
    required this.config,
  });

  Future<void> init() async {
    mixpanel = await Mixpanel.init(
      config.mixpanelKey,
      trackAutomaticEvents: true,
    );
  }

  void trackEvent({
    required String eventName,
    required Map<String, dynamic>? properties,
  }) {
    mixpanel.track(
      eventName,
      properties: properties,
    );
  }

  void registerSuperProps({
    required String username,
    required String salesOrg,
    required String customerCode,
    required String shipToAddress,
    required String userRole,
  }) {
    mixpanel.registerSuperProperties({
      MixpanelProps.username: username,
      MixpanelProps.salesOrg: salesOrg,
      MixpanelProps.customerCode: customerCode,
      MixpanelProps.shipToAddress: shipToAddress,
      MixpanelProps.userRole: userRole,
    });
  }

  void onLogout() {
    mixpanel.clearSuperProperties();
  }

  void setUser({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String role,
  }) {
    mixpanel.identify(username);
    mixpanel.getPeople().set(
          MixpanelProps.username,
          username,
        );
    mixpanel.getPeople().set(
          MixpanelProps.firstName,
          firstName,
        );
    mixpanel.getPeople().set(
          MixpanelProps.lastName,
          lastName,
        );
    mixpanel.getPeople().set(
          MixpanelProps.email,
          email,
        );
    mixpanel.getPeople().set(
          MixpanelProps.userRole,
          role,
        );
  }

  void setBannerOrderFlow(EZReachBanner banner) {
    this.banner = banner;
  }

  void resetBannerOrderFlow() {
    banner = EZReachBanner.empty();
  }
}
