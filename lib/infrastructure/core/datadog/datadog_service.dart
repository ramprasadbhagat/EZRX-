import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/locator.dart';

class DatadogService {
  late DdSdkConfiguration configuration;

  final navigationObserver = DatadogNavigationObserver(
    datadogSdk: DatadogSdk.instance,
  );

  Future<void> init() async {
    final packageInfoService = locator<PackageInfoService>();
    final config = locator<Config>();
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
        printLogsToConsole: true,
        sendLogsToDatadog: true,
      ),
      rumConfiguration: RumConfiguration(
        applicationId: config.datadogRumConfiguration,
      ),
      version: appVersion,
      flavor: config.appFlavor.name,
    );
  }
}
