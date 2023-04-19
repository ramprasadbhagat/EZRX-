import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/account_selector_storage_dto.dart';
import 'package:ezrxmobile/infrastructure/account/repository/ship_to_code_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';



class AccountSelectorStorageMock extends Mock
    implements AccountSelectorStorage {}

void main() {
  late ShipToCodeRepository shipToCodeRepository;
  late AccountSelectorStorage accountSelectorStorageMock;

  setUpAll(() {
    accountSelectorStorageMock = AccountSelectorStorageMock();

    shipToCodeRepository = ShipToCodeRepository(
      accountSelectorStorage: accountSelectorStorageMock,
    );

    registerFallbackValue(AccountSelectorStorageDto.empty());
  });

  group('Ship to code repository test', () {
    test('get ship to code success test', () async {
      when(() => accountSelectorStorageMock.get()).thenAnswer(
        (invocation) async => AccountSelectorStorageDto.empty(),
      );

      final result = await shipToCodeRepository.getShipToCode();

      expect(result.isRight(), true);
    });

    test('get ship to code success test', () async {
      when(() => accountSelectorStorageMock.get())
          .thenThrow((invocation) async => MockException());

      final result = await shipToCodeRepository.getShipToCode();

      expect(result.isLeft(), true);
    });

    test('ship to code store successfully test', () async {
      final mockAccountSelectorStorageDto = AccountSelectorStorageDto.empty();
      const mockShipToCode = 'shipToCode';

      when(() => accountSelectorStorageMock.get()).thenAnswer(
        (invocation) async => mockAccountSelectorStorageDto,
      );

      when(
        () {
          return accountSelectorStorageMock.set(
            accountSelectorStorageDto:
                any(named: 'accountSelectorStorageDto', that: isNotNull),
          );
        },
      ).thenAnswer((invocation) async {
        return Future.value();
      });

      final result = await shipToCodeRepository.storeShipToCode(
        shipToCode: mockShipToCode,
      );

      expect(result.isRight(), true);
    });

    test('ship to code store failed test', () async {
      final mockAccountSelectorStorageDto = AccountSelectorStorageDto.empty();
      const mockShipToCode = 'shipToCode';

      when(() => accountSelectorStorageMock.get()).thenAnswer(
            (invocation) async => mockAccountSelectorStorageDto,
      );

      when(
            () {
          return accountSelectorStorageMock.set(
            accountSelectorStorageDto:
            any(named: 'accountSelectorStorageDto', that: isNotNull),
          );
        },
      ).thenThrow((invocation) => MockException());

      final result = await shipToCodeRepository.storeShipToCode(
        shipToCode: mockShipToCode,
      );

      expect(result.isLeft(), true);
    });
  });
}
