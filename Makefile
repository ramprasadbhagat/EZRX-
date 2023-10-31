STR := $$(perl -MYAML -le 'print YAML::LoadFile(shift)->{version}' ./pubspec.yaml)
VERSION := $$( echo $(STR) | cut -d '+' -f 1 )
BUILD := $$( echo $(STR) | cut -d '+' -f 2 )
CLIENTUSER := 'client_user.dart'
EXTERNALSALESREP := 'external_sales_rep.dart'
SALESORGCONFIG := 'reset_sales_org_config.sh'

clean_ios:
	@cd ios && rm -rf Pods && rm Podfile.lock && fvm flutter pub get && pod install && cd ..
run_test:
	@fvm flutter analyze --fatal-infos --fatal-warnings
	@fvm flutter pub run dart_code_metrics:metrics analyze lib --fatal-style --fatal-performance --fatal-warnings --disable-sunset-warning
	@fvm flutter pub run dart_code_metrics:metrics check-unnecessary-nullable lib --fatal-found --disable-sunset-warning
	@fvm flutter pub run dart_code_metrics:metrics check-unused-code lib --fatal-unused --disable-sunset-warning
	@fvm flutter pub run dart_code_metrics:metrics check-unused-files lib --fatal-unused --disable-sunset-warning
	@fvm flutter test --coverage && genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html
run_uat_test:
	@git tag -a test.uat.${VERSION}-${BUILD} -m "test uat ${VERSION}(${BUILD})" && git push origin test.uat.${VERSION}-${BUILD}
	@git tag -d test.uat.${VERSION}-${BUILD} && git push --delete origin test.uat.${VERSION}-${BUILD}
run_uat_cd:
	@git tag -a uat.${VERSION}-${BUILD} -m "uat ${VERSION}(${BUILD})" && git push origin uat.${VERSION}-${BUILD}
run_prod_cd:
	@git tag -a prod.${VERSION}-${BUILD} -m "prod ${VERSION}(${BUILD})" && git push origin prod.${VERSION}-${BUILD}
revert_uat_tag:
	@git tag -d uat.${VERSION}-${BUILD} && git push --delete origin uat.${VERSION}-${BUILD}
revert_prod_tag:
	@git tag -d prod.${VERSION}-${BUILD} && git push --delete origin prod.${VERSION}-${BUILD}
build_ios_uat:
	@flutter build ipa --flavor uat -t lib/main_uat.dart --release --export-options-plist=ios/config/uat/exportOptions.plist
build_android_uat:
	@fvm flutter build appbundle --flavor uat -t lib/main_uat.dart --release
build_web_uat:
	@fvm flutter build web -t lib/main_uat.dart --release
build_ios_prod:
	@fvm flutter build ipa --flavor prod -t lib/main_prod.dart --release --export-options-plist=ios/config/prod/exportOptions.plist
build_android_prod:
	@fvm flutter build appbundle --flavor prod -t lib/main_prod.dart --release
build_web_prod:
	@fvm flutter build web -t lib/main_prod.dart --release
build_xctest:
	@xcodebuild -workspace ios/Runner.xcworkspace -scheme uat -derivedDataPath build/xctest -sdk iphoneos build-for-testing
	@zip -r ezrx_xctest.zip Debug-iphoneos build/xctest/Build/Products/uat_iphoneos16.4.xctestrun
reset_sg_salesorg_config:
	./integration_test/sg/${SALESORGCONFIG}
reset_my_salesorg_config:
	./integration_test/my/${SALESORGCONFIG}
reset_vn_salesorg_config:
	./integration_test/vn/${SALESORGCONFIG}
reset_th_salesorg_config:
	./integration_test/th/${SALESORGCONFIG}
reset_tw_salesorg_config:
	./integration_test/tw/${SALESORGCONFIG}
reset_ph_salesorg_config:
	./integration_test/ph/${SALESORGCONFIG}
reset_mm_salesorg_config:
	./integration_test/mm/${SALESORGCONFIG}
reset_kh_salesorg_config:
	./integration_test/kh/${SALESORGCONFIG}
run_sg_client_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/sg/${CLIENTUSER}
run_sg_external_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/sg/${EXTERNALSALESREP}
run_tw_client_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/tw/${CLIENTUSER}
run_tw_external_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/tw/${EXTERNALSALESREP}
run_vn_client_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/vn/${CLIENTUSER}
run_vn_external_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/vn/${EXTERNALSALESREP}
run_kh_client_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/kh/${CLIENTUSER}
run_kh_external_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/kh/${EXTERNALSALESREP}
run_mm_client_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/mm/${CLIENTUSER}
run_mm_external_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/mm/${EXTERNALSALESREP}
run_my_client_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/${CLIENTUSER} 
run_my_external_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/${EXTERNALSALESREP}
run_ph_client_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/ph/${CLIENTUSER}
run_ph_external_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/ph/${EXTERNALSALESREP}
run_th_client_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/th/${CLIENTUSER}
run_th_external_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/th/${EXTERNALSALESREP}
run_my_client_Integration_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/product${CLIENTUSER}
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/more/security/${CLIENTUSER}
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/orders/view_by_items/${CLIENTUSER}
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/orders/view_by_orders/${CLIENTUSER}
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/orders/cart/${CLIENTUSER}
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/orders/checkout/${CLIENTUSER}
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/returns/returns_by_items/${CLIENTUSER}
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/returns/returns_by_request/${CLIENTUSER}
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/returns/new_return/step1/${CLIENTUSER}
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/more/contact_us/${CLIENTUSER}
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/payments/account_summary/account_invoice/${CLIENTUSER}
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/payments/payments_home/${CLIENTUSER}
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/home/articles/${CLIENTUSER}
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/soa/${CLIENTUSER}
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/payments/account_summary/account_credits/${CLIENTUSER}
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/payments/payment_summary/${CLIENTUSER}
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/announcement_article/announcement/${CLIENTUSER}