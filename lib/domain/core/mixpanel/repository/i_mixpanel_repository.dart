abstract class IMixpanelRepository {
  void registerSuperProps({
    required String username,
    required String salesOrg,
    required String customerCode,
    required String shipToAddress,
    required String userRole,
  });
}
