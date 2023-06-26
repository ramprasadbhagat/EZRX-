import 'dart:convert';

import 'package:ezrxmobile/domain/returns/entities/return_item_group.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_item_group_dto.dart';
import 'package:flutter/services.dart';

class ReturnListLocalDataSource {
  ReturnListLocalDataSource();

  Future<List<ReturnItemGroup>> fetchReturnByItems() async {
    await Future.delayed(const Duration(seconds: 2));
    final data = json.decode(
      await rootBundle.loadString('assets/json/getReturnByItemsResponse.json'),
    );

    return List.from(data['data']['requestsByItems']['returnRequestsByItems'])
        .map((e) => ReturnItemGroupDto.fromJson(e).toDomain())
        .toList();
  }
}
