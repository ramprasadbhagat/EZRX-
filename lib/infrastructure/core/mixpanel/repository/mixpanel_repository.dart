import 'package:ezrxmobile/domain/core/mixpanel/repository/i_mixpanel_repository.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';

class MixpanelRepository extends IMixpanelRepository {
  final MixpanelService mixpanelService;

  MixpanelRepository({
    required this.mixpanelService,
  });

  @override
  void registerSuperProps({
    required String username,
    required String salesOrg,
    required String customerCode,
    required String shipToAddress,
    required String userRole,
  }) {
    mixpanelService.registerSuperProps(
      username: username,
      salesOrg: salesOrg,
      customerCode: customerCode,
      shipToAddress: shipToAddress,
      userRole: userRole,
    );
  }
}
