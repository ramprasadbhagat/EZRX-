import 'dart:convert';

import 'package:ezrxmobile/domain/user/entities/user.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/user/datasource/user_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/user/dtos/user_dto.dart';

class UserRemoteDataSource {
  HttpService httpService;
  UserQueryMutation userQueryMutation;
  UserRemoteDataSource({
    required this.httpService,
    required this.userQueryMutation,
  });

  Future<User> getUser() async {
    final res = await httpService.request(
      method: 'POST',
      url: '/api/strapiEngine',
      data: jsonEncode({
        'query': userQueryMutation.fetchUserData(),
        'variables': {'id': '10797'}, //@@@@@@@ need to remove dependency
      }),
    );

    return UserDto.fromJson(res.data['data']['user']).toDomain();
  }
}
