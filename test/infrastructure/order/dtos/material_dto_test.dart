
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // late dynamic data;
  group('Test bundleInfoDto ', () {
    setUp(() async {
    //   data = json.decode(
    //     await rootBundle
    //         .loadString('assets/json/getMaterialsWithMetaResponse.json'),
    //   );
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
  });
}
