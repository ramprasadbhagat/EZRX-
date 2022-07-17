import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoService {
  Future<String> getString() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return '${packageInfo.packageName} ${packageInfo.version} ${packageInfo.buildNumber}';
  }
}
