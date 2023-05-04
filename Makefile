STR := $$(perl -MYAML -le 'print YAML::LoadFile(shift)->{version}' ./pubspec.yaml)
VERSION := $$( echo $(STR) | cut -d '+' -f 1 )
BUILD := $$( echo $(STR) | cut -d '+' -f 2 )
CLIENTUSER := 'order/client_user.dart'
EXTERNALSALESREP := 'order/external_sales_rep.dart'




run_test:
	@fvm flutter analyze --fatal-infos --fatal-warnings
	@fvm flutter pub run dart_code_metrics:metrics analyze lib --fatal-style --fatal-performance --fatal-warnings
	@fvm flutter pub run dart_code_metrics:metrics check-unnecessary-nullable lib --fatal-found
	@fvm flutter pub run dart_code_metrics:metrics check-unused-code lib --fatal-unused
	@fvm flutter pub run dart_code_metrics:metrics check-unused-files lib --fatal-unused  
	@fvm flutter test --coverage && genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html
run_uat_cd:
	@git tag -a uat.${VERSION}-${BUILD} -m "uat ${VERSION}(${BUILD})" && git push origin uat.${VERSION}-${BUILD}
run_prod_cd:
	@git tag -a prod.${VERSION}-${BUILD} -m "prod ${VERSION}(${BUILD})" && git push origin prod.${VERSION}-${BUILD}
revert_uat_tag:
	@git tag -d uat.${VERSION}-${BUILD} && git push --delete origin uat.${VERSION}-${BUILD}
revert_prod_tag:
	@git tag -d prod.${VERSION}-${BUILD} && git push --delete origin prod.${VERSION}-${BUILD}
run_uat:
	@fvm flutter run --flavor uat -t lib/main_stage.dart
run_prod:
	@fvm flutter run --flavor prod -t lib/main_prod.dart
build_ios_uat:
	@flutter build ipa --flavor uat -t lib/main_uat.dart --release --export-options-plist=ios/config/uat/exportOptions.plist
build_android_uat:
	@fvm flutter build appbundle --flavor uat -t lib/main_uat.dart --release
build_ios_prod:
	@fvm flutter build ipa --flavor prod -t lib/main_prod.dart --release --export-options-plist=ios/config/prod/exportOptions.plist
build_android_prod:
	@fvm flutter build appbundle --flavor prod -t lib/main_prod.dart --release
build_xctest:
	@xcodebuild -workspace ios/Runner.xcworkspace -scheme uat -derivedDataPath build/xctest -sdk iphoneos build-for-testing
	@zip -r ezrx_xctest.zip Debug-iphoneos build/xctest/Build/Products/uat_iphoneos16.4.xctestrun
run_sg_client_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/sg/${CLIENTUSER}
run_sg_external_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/sg/${EXTERNALSALESREP}
run_tw_client_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/tw/${CLIENTUSER}
run_tw_external_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/tw/${EXTERNALSALESREP}