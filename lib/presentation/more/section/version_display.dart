import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';

class VersionDisplay extends StatelessWidget {
  const VersionDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FutureBuilder<String>(
        future: locator<PackageInfoService>().getString(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Text(
              snapshot.data ?? '',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          );
        },
      ),
    );
  }
}
