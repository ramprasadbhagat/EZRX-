import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ResetPasswordMock extends Mock implements ResetPassword {}

void main() {
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  // final dio = Dio(
  //   BaseOptions(
  //     baseUrl:
  //         'https://zpprodapiportalapimgmt.apimanagement.ap1.hana.ondemand.com',
  //   ),
  // );
  // final dioAdapter = DioAdapter(
  //   dio: dio,
  //   matcher: const UrlRequestMatcher(),
  // );
  // final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
    },
  );
  group(
    'Change password remote',
    () {
      // test(
      //   'Change password success',
      //   () async {
      //     final res = json.decode(
      //       await rootBundle
      //           .loadString('assets/json/changePasswordResponse.json'),
      //     );

      //     dioAdapter.onPost(
      //       '/api/loginAd',
      //       (server) => server.reply(
      //         200,
      //         res,
      //         delay: const Duration(seconds: 1),
      //       ),
      //       headers: {'Content-Type': 'application/json; charset=utf-8'},
      //       data: jsonEncode({
      //         'query': remoteDataSource.authQueryMutation.changePassword(),
      //       }),
      //     );

      //     final result = await remoteDataSource.setUserPassword(
      //       'username',
      //       'password',
      //       'password',
      //     );

      //     expect(
      //       result,
      //       ResetPasswordDto.fromJson(res['data']['changePassword']).toDomain(),
      //     );
      //   },
      // );

      // test(
      //   'Change password success but empty',
      //   () async {
      //     dioAdapter.onPost(
      //       '/api/loginAd',
      //       (server) => server.reply(
      //         200,
      //         {
      //           'data': {
      //             'changePassword': {
      //               'success': true,
      //               'status': '',
      //             },
      //           }
      //         },
      //         delay: const Duration(seconds: 1),
      //       ),
      //       headers: {'Content-Type': 'application/json; charset=utf-8'},
      //       data: jsonEncode({
      //         'query': remoteDataSource.authQueryMutation.changePassword(),
      //       }),
      //     );

      //     await remoteDataSource
      //         .setUserPassword(
      //       'username',
      //       'password',
      //       'password',
      //     )
      //         .onError((error, _) async {
      //       expect(error, isA<OtherException>());
      //       return Future.value(ResetPasswordMock());
      //     });
      //   },
      // );

      // test(
      //   'Change password error with data null and have errors',
      //   () async {
      //     dioAdapter.onPost(
      //       '/api/loginAd',
      //       (server) => server.reply(
      //         200,
      //         {
      //           'data': null,
      //           'errors': [
      //             {'message': 'fake-error'}
      //           ],
      //         },
      //         delay: const Duration(seconds: 1),
      //       ),
      //       headers: {'Content-Type': 'application/json; charset=utf-8'},
      //       data: jsonEncode({
      //         'query': remoteDataSource.authQueryMutation.changePassword(),
      //       }),
      //     );

      //     await remoteDataSource
      //         .setUserPassword(
      //       'username',
      //       'password',
      //       'password',
      //     )
      //         .onError((error, _) async {
      //       expect(error, isA<ServerException>());
      //       return Future.value(ResetPasswordMock());
      //     });
      //   },
      // );

      // test(
      //   'Change password error with status code != 200',
      //   () async {
      //     dioAdapter.onPost(
      //       '/api/loginAd',
      //       (server) => server.reply(
      //         204,
      //         {'data': []},
      //         delay: const Duration(seconds: 1),
      //       ),
      //       headers: {'Content-Type': 'application/json; charset=utf-8'},
      //       data: jsonEncode({
      //         'query': remoteDataSource.authQueryMutation.changePassword(),
      //       }),
      //     );

      //     await remoteDataSource
      //         .setUserPassword(
      //       'username',
      //       'password',
      //       'password',
      //     )
      //         .onError((error, _) async {
      //       expect(error, isA<ServerException>());
      //       return Future.value(ResetPasswordMock());
      //     });
      //   },
      // );
    },
  );
}
