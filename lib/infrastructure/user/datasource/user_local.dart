import 'dart:convert';

import 'package:ezrxmobile/domain/auth/local_storage/i_token_storage.dart';
import 'package:ezrxmobile/domain/user/entities/user.dart';
import 'package:ezrxmobile/infrastructure/user/dtos/user_dto.dart';
import 'package:flutter/services.dart';

class UserLocalDataSource {
  final String rootAdminToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Mjc2LCJyb2xlIjoiUk9PVCBBZG1pbiIsInVzZXJuYW1lIjoibW9iaWxlZGVtbyIsInJpZ2h0cyI6W3sidmFsdWUiOlt7InNhbGVzT3JnIjoiMjkwMCIsInNoaXBUb0NvZGUiOlsiYWxsIl0sImN1c3RvbWVyQ29kZSI6ImFsbCJ9LHsic2FsZXNPcmciOiIyNjAxIiwic2hpcFRvQ29kZSI6WyJhbGwiXSwiY3VzdG9tZXJDb2RlIjoiYWxsIn0seyJzYWxlc09yZyI6IjIyMDEiLCJzaGlwVG9Db2RlIjpbImFsbCJdLCJjdXN0b21lckNvZGUiOiJhbGwifSx7InNhbGVzT3JnIjoiMjAwMSIsInNoaXBUb0NvZGUiOlsiYWxsIl0sImN1c3RvbWVyQ29kZSI6ImFsbCJ9LHsic2FsZXNPcmciOiJQSDAzIiwic2hpcFRvQ29kZSI6WyJhbGwiXSwiY3VzdG9tZXJDb2RlIjoiYWxsIn0seyJzYWxlc09yZyI6IjMwNTAiLCJzaGlwVG9Db2RlIjpbImFsbCJdLCJjdXN0b21lckNvZGUiOiJhbGwifSx7InNhbGVzT3JnIjoiMjIwMyIsInNoaXBUb0NvZGUiOlsiYWxsIl0sImN1c3RvbWVyQ29kZSI6ImFsbCJ9LHsic2FsZXNPcmciOiIyNTAwIiwic2hpcFRvQ29kZSI6WyJhbGwiXSwiY3VzdG9tZXJDb2RlIjoiYWxsIn0seyJzYWxlc09yZyI6IjI1MDEiLCJzaGlwVG9Db2RlIjpbIjAwNzAwMDQzMDkiLCIwMDcwMDA0MzEwIl0sImN1c3RvbWVyQ29kZSI6IjAwMzAwMDM2NTIifSx7InNhbGVzT3JnIjoiMzA3MCIsInNoaXBUb0NvZGUiOlsiYWxsIl0sImN1c3RvbWVyQ29kZSI6ImFsbCJ9LHsic2FsZXNPcmciOiIyODAwIiwic2hpcFRvQ29kZSI6WyJhbGwiXSwiY3VzdG9tZXJDb2RlIjoiYWxsIn0seyJzYWxlc09yZyI6IjI4MDEiLCJzaGlwVG9Db2RlIjpbImFsbCJdLCJjdXN0b21lckNvZGUiOiJhbGwifSx7InNhbGVzT3JnIjoiMzA5MCIsInNoaXBUb0NvZGUiOlsiYWxsIl0sImN1c3RvbWVyQ29kZSI6ImFsbCJ9LHsic2FsZXNPcmciOiIxNTAwIiwic2hpcFRvQ29kZSI6WyJhbGwiXSwiY3VzdG9tZXJDb2RlIjoiYWxsIn0seyJzYWxlc09yZyI6IjE1MDEiLCJzaGlwVG9Db2RlIjpbImFsbCJdLCJjdXN0b21lckNvZGUiOiJhbGwifSx7InNhbGVzT3JnIjoiMDAxMSIsInNoaXBUb0NvZGUiOlsiYWxsIl0sImN1c3RvbWVyQ29kZSI6ImFsbCJ9LHsic2FsZXNPcmciOiIxMTIyIiwic2hpcFRvQ29kZSI6WyJhbGwiXSwiY3VzdG9tZXJDb2RlIjoiYWxsIn0seyJzYWxlc09yZyI6IjEyMzQiLCJzaGlwVG9Db2RlIjpbImFsbCJdLCJjdXN0b21lckNvZGUiOiJhbGwifSx7InNhbGVzT3JnIjoiMjkwMiIsInNoaXBUb0NvZGUiOlsiYWxsIl0sImN1c3RvbWVyQ29kZSI6ImFsbCJ9XX1dLCJzYWxlc09yZ3MiOlsiMjkwMCIsIjI2MDEiLCIyMjAxIiwiMjAwMSIsIlBIMDMiLCIzMDUwIiwiMjIwMyIsIjI1MDAiLCIyNTAxIiwiMzA3MCIsIjI4MDAiLCIyODAxIiwiMzA5MCIsIjE1MDAiLCIxNTAxIiwiMDAxMSIsIjExMjIiLCIxMjM0IiwiMjkwMiJdLCJBVVRIX1RPS0VOIjoidzl4cEFhQkRZUSIsImlhdCI6MTY1NTYzMDAxMCwiZXhwIjoxNjU2NDk0MDEwfQ.Q6YQHLxOEEKaYwiqlns_XrNP6atDeEGXQGNGt6Yir24';
  final ITokenStorage tokenStorage;
  UserLocalDataSource({required this.tokenStorage});

  @override
  Future<User> getUser() async {
    final token = await tokenStorage.get();
    final data = json.decode(
      token.access == rootAdminToken
          ? await rootBundle.loadString('assets/json/userResponse.json')
          : await rootBundle.loadString('assets/json/proxyUserResponse.json'),
    );

    return UserDto.fromJson(data['data']['user']).toDomain();
  }
}
