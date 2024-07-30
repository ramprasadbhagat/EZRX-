import 'dart:convert';

import 'package:ezrxmobile/infrastructure/auth/datasource/change_password_local.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/reset_password_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ChangePasswordLocalDataSource changePasswordLocalDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      changePasswordLocalDataSource = ChangePasswordLocalDataSource();
    },
  );

  group('Change password Local DataSource Test', () {
    test(
      '=> changePassword',
      () async {
        final data = json.decode(
          await rootBundle
              .loadString('assets/json/changePasswordResponse.json'),
        );
        final result = await changePasswordLocalDataSource.changePassword();

        expect(
          result,
          ResetPasswordDto.fromJson(data['data']['changePassword']).toDomain(),
        );
      },
    );

    test(
      '=> resetPassword',
      () async {
        final data = json.decode(
          await rootBundle
              .loadString('assets/json/resetPasswordV3Response.json'),
        );
        final result = await changePasswordLocalDataSource.resetPassword();

        expect(
          result,
          ResetPasswordDto.fromJson(data['data']['resetPasswordV3']).toDomain(),
        );
      },
    );

    test(
      '=> changePasswordForFirstTime',
      () async {
        final data = json.decode(
          await rootBundle
              .loadString('assets/json/changePasswordFirstTimeResponse.json'),
        );
        final result =
            await changePasswordLocalDataSource.changePasswordForFirstTime();

        expect(
          result,
          ResetPasswordDto.fromJson(data['data']['changePasswordFirstTime'])
              .toDomain(),
        );
      },
    );
  });
}
