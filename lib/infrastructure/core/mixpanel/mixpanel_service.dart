import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MixpanelService {
  late Mixpanel mixpanel;
  BannerItem banner = BannerItem.empty();
  String activeNavBarRoute = 'Home Page';

  void init({required Mixpanel mixpanel}) {
    this.mixpanel = mixpanel;
  }

  void trackEvent({
    required String eventName,
    Map<String, dynamic>? properties,
  }) {
    mixpanel.track(
      eventName,
      properties: properties,
    );
  }

  Future<void> registerSuperProps({
    required String username,
    required String salesOrg,
    required String customerCode,
    required String shipToAddress,
    required String userRole,
  }) async {
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
    activeNavBarRoute = 'Home Page';
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

  void setBannerOrderFlow(BannerItem banner) {
    this.banner = banner;
  }

  void resetBannerOrderFlow() {
    banner = BannerItem.empty();
  }
}
