import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:flutter/foundation.dart';

class DatadogService {
  final PackageInfoService packageInfoService;
  final Config config;

  DatadogService({
    required this.packageInfoService,
    required this.config,
  });

  late DdSdkConfiguration configuration;
  final navigationObserver = DatadogNavigationObserver(
    datadogSdk: DatadogSdk.instance,
  );

  Future<void> init() async {
    final version = await packageInfoService.getVersion();
    final buildNumber = await packageInfoService.getBuildNumber();
    final appVersion = '$version($buildNumber)';
    configuration = DdSdkConfiguration(
      clientToken: config.datadogClientToken,
      env: config.appFlavor.name,
      site: DatadogSite.us3,
      trackingConsent: TrackingConsent.granted,
      nativeCrashReportEnabled: true,
      loggingConfiguration: LoggingConfiguration(
        sendNetworkInfo: true,
        printLogsToConsole: !kReleaseMode,
        sendLogsToDatadog: true,
      ),
      rumConfiguration: RumConfiguration(
        applicationId: config.datadogRumConfiguration,
      ),
      version: appVersion,
      flavor: config.appFlavor.name,
    );
  }

  void setUserInfo(User user) {
    DatadogSdk.instance.setUserInfo(
      id: user.id,
      name: user.username.getOrDefaultValue(''),
      email: user.email.getOrDefaultValue(''),
    );
  }

  DdLogs? get logs => DatadogSdk.instance.logs;
}
