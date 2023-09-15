import 'dart:convert';

import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // late dynamic data;
  late dynamic similarProductsData;
  group('Test Material Dto ', () {
    setUp(() async {
      //   data = json.decode(
      //     await rootBundle
      //         .loadString('assets/json/getMaterialsWithMetaResponse.json'),
      //   );
      similarProductsData = json.decode(
        await rootBundle.loadString('assets/json/similarSearchesResponse.json'),
      );
    });
    // test('Test toDomain', () {
    //   final configs = MaterialDto.fromJson(
    //     data['data']['materialsWithMeta']['materials'][0],
    //   ).toDomain();
    //   expect(configs.materialNumber.getOrCrash(), '000000000023168451');
    // });

    // test('Test fromDomain', () {
    //   final configsDto = MaterialDto.fromDomain(MaterialDto.fromJson(
    //     data['data']['materialsWithMeta']['materials'][0],
    //   ).toDomain());
    //   expect(configsDto.materialNumber, '000000000023168451');
    // });

    // test('Test toJson', () {

    //   final configsDtoMap = MaterialDto.fromDomain(MaterialDto.fromJson(
    //     data['data']['materialsWithMeta']['materials'][0],
    //   ).toDomain())
    //       .toJson();
    //   expect(configsDtoMap['materialNumber'], '000000000023168451');
    // });

    test('Test Similar Products toDomain for hidePrice', () {
      final similarProducts =
          List.from(similarProductsData['data']['similarSearches']['materials'])
              .map((e) => MaterialDto.fromJson(e).toDomain())
              .toList();
      expect(similarProducts.first.hidePrice, true);
    });
  });
}
