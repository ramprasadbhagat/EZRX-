import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:datadog_tracking_http_client/datadog_tracking_http_client.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:flutter/foundation.dart';

class DatadogService {
  final PackageInfoService packageInfoService;
  final Config config;
  final DeviceStorage deviceStorage;

  DatadogService({
    required this.packageInfoService,
    required this.config,
    required this.deviceStorage,
  });

  late DdSdkConfiguration configuration;
  final navigationObserver = DatadogNavigationObserver(
    datadogSdk: DatadogSdk.instance,
  );

  Future<void> init() async {
    final version = await packageInfoService.getVersion();
    final buildNumber = await packageInfoService.getBuildNumber();
    final appVersion = '$version($buildNumber)';
    final apiUrlWithoutHttps = config
        .baseUrl(
          currentMarket: AppMarket(
            deviceStorage.currentMarket(),
          ),
        )
        .replaceFirst('https://', '');
    configuration = DdSdkConfiguration(
      clientToken: config.datadogClientToken,
      env: config.appFlavor.name,
      site: config.datadogSite,
      trackingConsent: TrackingConsent.granted,
      nativeCrashReportEnabled: true,
      loggingConfiguration: LoggingConfiguration(
        sendNetworkInfo: true,
        printLogsToConsole: !kReleaseMode,
        sendLogsToDatadog: true,
      ),
      rumConfiguration: RumConfiguration(
        applicationId: config.datadogRumConfiguration,
        tracingSamplingRate: 100,
      ),
      version: appVersion,
      flavor: config.appFlavor.name,
      firstPartyHostsWithTracingHeaders: {
        apiUrlWithoutHttps: {TracingHeaderType.tracecontext},
        apiUrlWithoutHttps: {TracingHeaderType.datadog},
      },
    );
    configuration.enableHttpTracking();
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
