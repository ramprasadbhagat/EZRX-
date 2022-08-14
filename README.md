# ezrxmobile

## Require
- [Vscode](https://code.visualstudio.com/)
- [Flutter extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)
- [FVM](https://fvm.app/docs/getting_started/installation)

## Optional
- [Bloc extension](https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc)
- [Version Lens](https://marketplace.visualstudio.com/items?itemName=pflannery.vscode-versionlens)
- [Coverage Gutters](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-coverage-gutters)
- [Flutter Coverage](https://marketplace.visualstudio.com/items?itemName=Flutterando.flutter-coverage)
- [Edit csv](https://marketplace.visualstudio.com/items?itemName=janisdd.vscode-edit-csv)

## Setup
1. Install [FVM](https://fvm.app/docs/getting_started/installation)
2. Git clone project
3. Open project with Vscode, check ".fvm/fvm_config.json" file, check the "flutterSdkVersion" inside and use ```fvm use <flutterSdkVersion_you_saw>```
4. Restart vscode

## Edit localization lang file csv
- directory : assets/langs/langs.csv
- [Edit csv](https://marketplace.visualstudio.com/items?itemName=janisdd.vscode-edit-csv) edit your csv easily
- Ensure the csv file is using CRLF to works. ref:https://stackoverflow.com/a/39532890

## Analyze
```fvm flutter analyze```

## Test Coverage
1. [Read this](https://codewithandrea.com/articles/flutter-test-coverage/)
2. ```brew install lcov```
3. ```fvm flutter test --coverage```
4. ```genhtml coverage/lcov.info -o coverage/html```
5. ```open coverage/html/index.html```

## Integration test
```fvm flutter drive --driver=test_driver/integration_driver.dart --target=integration_test/app_test.dart --flavor uat```

## Auto build json_serializable, freezed, auto_route_generator, hive_generator 
```fvm flutter pub run build_runner watch --delete-conflicting-outputs```


## Flavor
| Flavor| Package name | App Name | Endpoint |
|--|--|--|--|
| PROD |  `com.zuelligpharma.ezrxmobile`| eZRx | https://ezrx.com |
| UAT  |  `com.zuelligpharma.ezrxmobile.uat`| eZRx Uat | https://zpprodapiportalapimgmt.apimanagement.ap1.hana.ondemand.com |
| DEV  |  `com.zuelligpharma.ezrxmobile.dev`| eZRx Dev | https://dev.ezrx.com/ |
| MOCK  |  `com.zuelligpharma.ezrxmobile.mock`| eZRx Mock | local json |

## Build app
### IOS
- ```fvm flutter build ios --flavor mock -t lib/main_mock.dart```
- ```fvm flutter build ios --flavor dev -t lib/main_dev.dart```
- ```fvm flutter build ios --flavor uat -t lib/main_uat.dart```
- ```fvm flutter build ios --flavor prod -t lib/main_prod.dart```
### Android
- ```fvm flutter build appbundle --flavor mock -t lib/main_mock.dart```
- ```fvm flutter build appbundle --flavor dev -t lib/main_dev.dart```
- ```fvm flutter build appbundle --flavor uat -t lib/main_uat.dart```
- ```fvm flutter build appbundle --flavor prod -t lib/main_prod.dart```