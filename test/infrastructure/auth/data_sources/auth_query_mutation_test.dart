import 'dart:convert';

import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
    },
  );
  group(
    'Auth Query Mutation Test',
    (() {
      // TODO: V3 migrate skip for now
      // test('Get login query with local storage', () async {
      //   final authQueryMutation = AuthQueryMutation();

      //   final loginQueryLocal = json.decode(
      //     await rootBundle.loadString('assets/json/loginAdQuery.json'),
      //   )['query'];

      //   expect(
      //     authQueryMutation.getLoginQuery(),
      //     loginQueryLocal,
      //   );
      // });

      // test('Get Proxy Login query with local storage', () async {
      //   final authQueryMutation = AuthQueryMutation();

      //   final proxyLoginQueryLocal = json.decode(
      //     await rootBundle.loadString('assets/json/proxyLoginQuery.json'),
      //   )['query'];

      //   expect(
      //     authQueryMutation.getProxyLoginQuery(),
      //     proxyLoginQueryLocal,
      //   );
      // });

      test('Change Password mutation with local storage', () async {
        final authQueryMutation = AuthQueryMutation();

        final changePasswordMutationLocal = json.decode(
          await rootBundle.loadString('assets/json/changePasswordQuery.json'),
        )['query'];

        expect(
          authQueryMutation.changePassword(),
          changePasswordMutationLocal,
        );
      });
    }),
  );
}
