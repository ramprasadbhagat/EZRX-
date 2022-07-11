# ezrxmobile

A new Flutter project.

## Require
- [Vscode](https://code.visualstudio.com/)
- [Flutter extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)
- [FVM](https://fvm.app/docs/getting_started/installation)

## Optional
- [Bloc extension](https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc)
- [Version Lens](https://marketplace.visualstudio.com/items?itemName=pflannery.vscode-versionlens)
- [Coverage Gutters](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-coverage-gutters)
- [Flutter Coverage](https://marketplace.visualstudio.com/items?itemName=Flutterando.flutter-coverage)

## Setup
1. Install [FVM](https://fvm.app/docs/getting_started/installation)
2. Git clone project
3. Open project with Vscode, check ".fvm/fvm_config.json" file, check the "flutterSdkVersion" inside and use ```fvm use <flutterSdkVersion_you_saw>```
4. Restart vscode

## Test Coverage
1. [Read this](https://codewithandrea.com/articles/flutter-test-coverage/)
2. brew install lcov
3. fvm flutter test --coverage
4. genhtml coverage/lcov.info -o coverage/html

## Integration test
```flutter drive --driver=test_driver/integration_driver.dart --target=integration_test/login_test.dart```

## Auto build json_serializable, freezed, auto_route_generator, hive_generator 
```fvm flutter pub run build_runner watch --delete-conflicting-outputs```