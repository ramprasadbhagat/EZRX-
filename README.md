# ezrxmobile
This is second generation of eZRx mobile app created by Domain-Driven Design Architecture. 
To know more about Domain Driven Design in flutter please visit:
https://resocoder.com/2020/03/09/flutter-firebase-ddd-course-1-domain-driven-design-principles/

### Require
- [Vscode](https://code.visualstudio.com/)
- [Flutter extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)
- [FVM](https://fvm.app/docs/getting_started/installation)

### Optional
- [Bloc extension](https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc)
- [Version Lens](https://marketplace.visualstudio.com/items?itemName=pflannery.vscode-versionlens)
- [Coverage Gutters](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-coverage-gutters)
- [Flutter Coverage](https://marketplace.visualstudio.com/items?itemName=Flutterando.flutter-coverage)
- [Edit csv](https://marketplace.visualstudio.com/items?itemName=janisdd.vscode-edit-csv)
- [GraphQl](https://marketplace.visualstudio.com/items?itemName=mquandalle.graphql)

### Setup
1. Install [FVM](https://fvm.app/docs/getting_started/installation)
2. Git clone project
3. Open project with Vscode, check ".fvm/fvm_config.json" file, check the "flutterSdkVersion" inside and use ```fvm use <flutterSdkVersion_you_saw>```
4. Restart vscode

### Auto build json_serializable, freezed, auto_route_generator, hive_generator 
```fvm flutter pub run build_runner watch --delete-conflicting-outputs```

### Edit localization lang file csv
- directory : assets/langs/langs.csv
- [Edit csv](https://marketplace.visualstudio.com/items?itemName=janisdd.vscode-edit-csv) edit your csv easily
- Ensure the csv file is using CRLF to works. ref:https://stackoverflow.com/a/39532890

### SonarCube
1. [Read this](https://medium.com/@rajeswari3699/sonarqube-with-flutter-e294e48018f2)
2. Follow the guide download Sonarqube, SonarScanner, Sonar-Flutter Plugin and put to the correct directory.
3. ```nano /etc/paths``` add ```/Applications/SonarScanner/bin``` and ```/Applications/SonarScanner/bin``` 
4. Start SonarCube local server ```sh /Applications/SonarQube/bin/macosx-universal-64/sonar.sh console```
5. http://localhost:9000/about > Wait for a while until Login screen appear > Login and create project 
6. Config sonar-project.properties
7. ```fvm flutter test --machine --coverage > tests.output```
8. ```sonar-scanner```
9. open ```http://localhost:9000/dashboard?id=ezrx_mobile```

### Integration test
#### Local test/ CI test
```fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/app_test.dart ```
#### Browserstack test
```fvm flutter test --flavor uat --machine integration_test/app_test.dart > report.json```

### Flavor
| Flavor| Package name | App Name | Endpoint |
|--|--|--|--|
| PROD |  `com.zuelligpharma.ezrxmobile`| eZRx | https://ezrx.com |
| UAT  |  `com.zuelligpharma.ezrxmobile.uat`| eZRx Uat | https://uat.ezrx.com |
| DEV  |  `com.zuelligpharma.ezrxmobile.dev`| eZRx Dev | https://dev.ezrx.com |
| MOCK  |  `com.zuelligpharma.ezrxmobile.mock`| eZRx Mock | local assets json |

### Build app
#### IOS
- ```fvm flutter build ios --flavor mock -t lib/main_mock.dart```
- ```fvm flutter build ios --flavor dev -t lib/main_dev.dart```
- ```fvm flutter build ios --flavor uat -t lib/main_uat.dart```
- ```fvm flutter build ios --flavor prod -t lib/main_prod.dart```

#### Android
- ```fvm flutter build appbundle --flavor mock -t lib/main_mock.dart```
- ```fvm flutter build appbundle --flavor dev -t lib/main_dev.dart```
- ```fvm flutter build appbundle --flavor uat -t lib/main_uat.dart```
- ```fvm flutter build appbundle --flavor prod -t lib/main_prod.dart```
- ```fvm flutter build apk --flavor uat -t lib/main_browserstack.dart --debug```

### Error when run IOS ?
1. go to /ios
2. remove `Pods` folder
3. remove `Podfile.lock` file
4. `fvm flutter clean`
5. `fvm flutter pub get`
6. run you app

## Before submit PR, please run 
### Analyze
- ```fvm flutter analyze --fatal-infos --fatal-warnings```
- ```fvm flutter pub run dart_code_metrics:metrics analyze lib --fatal-style --fatal-performance --fatal-warnings```

### Test Coverage
1. [Read this](https://codewithandrea.com/articles/flutter-test-coverage/)
2. ```brew install lcov```
3. ```fvm flutter test --coverage```
4. ```genhtml coverage/lcov.info -o coverage/html```
5. ```open coverage/html/index.html```

### How to `bloc_test` the loading_more function
Let's assume that we test loading_more function for load a page 2
1. Use `seed` to setup a `state` with page 1 response for `bloc`
2. Setup a mock `repository` with parameters and a `pageSize` equals to page 1 lenght
3. Use `act` to add load_more `event` to `bloc`
4. `expect` section will be the same as when we test the `fetch` function, except that the `state` will have both page 1 and page 2 response

### How to trigger Azure Pipeline Automation Build
1. Create a release branch 
2. Merge all related PR to release branch
3. Make sure checkout to release branch
4. Version bump on pubspec.yaml , then commit
5. type command `make run_uat_cd` to deploy to UAT
6. type command `make run_prod_cd` to deploy to PROD

### How to generate splash screen
- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)
- Run command ```fvm flutter pub run flutter_native_splash:create```

### How to generate app icon
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
- Run command ```fvm flutter pub run flutter_launcher_icons```