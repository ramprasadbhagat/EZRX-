import 'package:ezrxmobile/infrastructure/order/dtos/customer_material_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late CustomerMaterialDto data;
  group('Test CustomerMaterialDto ', () {
    setUp(() async {
      data = const CustomerMaterialDto(
        defaultMaterialDescription: 'test-desc',
        governmentMaterialCode: '',
        hasMandatoryTenderContract: false,
        hasValidTenderContract: false,
        hidePrice: false,
        isFOCMaterial: false,
        isSampleMaterial: false,
        itemBrand: '',
        itemRegistrationNumber: '',
        materialDescription: '',
        materialGroup2: '',
        materialGroup4: '',
        materialNumber: '',
        principalCode: '',
        principalName: '',
        remarks: '',
        taxClassification: '',
        taxes: [],
        taxm1: '',
        therapeuticClass: '',
        unitOfMeasurement: '',
      );
    });

    test('Test toJson', () {
      final configsDto = data.toJson();
      expect(configsDto['defaultMaterialDescription'], 'test-desc');
    });
  });
}
