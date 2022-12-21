import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/repository/ship_to_code_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockShipToCodeRepo extends Mock implements ShipToCodeRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final mockShipToCodeRepo = MockShipToCodeRepo();
  final fakeShipToInfo = ShipToInfo.empty().copyWith(building: 'fakeBuilding');

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
  });

  group('Ship To Code Bloc', () {
    blocTest('Ship To code Initial',
        build: () => ShipToCodeBloc(
              shipToCodeRepository: mockShipToCodeRepo,
            ),
        act: (ShipToCodeBloc bloc) {
          bloc.add(const ShipToCodeEvent.initialized());
        },
        expect: () => [ShipToCodeState.initial()]);

    blocTest('Ship To Code Selected',
        build: () => ShipToCodeBloc(
              shipToCodeRepository: mockShipToCodeRepo,
            ),
        setUp: () => when(() => mockShipToCodeRepo.storeShipToCode(
                shipToCode: fakeShipToInfo.shipToCustomerCode)).thenAnswer(
              (invocation) async => const Right(unit),
            ),
        act: (ShipToCodeBloc bloc) {
          bloc.add(ShipToCodeEvent.selected(shipToInfo: fakeShipToInfo));
        },
        expect: () =>
            [ShipToCodeState.initial().copyWith(shipToInfo: fakeShipToInfo)]);

    blocTest(
      'Ship To Code Search fail',
      build: () => ShipToCodeBloc(
        shipToCodeRepository: mockShipToCodeRepo,
      ),
      act: (ShipToCodeBloc bloc) {
        bloc.add(const ShipToCodeEvent.search(
          shipToInfos: [],
        ));
      },
      expect: () => [
        ShipToCodeState.initial().copyWith(
          shipToInfoList: [],
        ),
      ],
    );

    blocTest(
      'Ship To Code Search Success',
      build: () => ShipToCodeBloc(
        shipToCodeRepository: mockShipToCodeRepo,
      ),
      act: (ShipToCodeBloc bloc) {
        bloc.add(const ShipToCodeEvent.updateSearchKey('fake-ship-to-code'));
        bloc.add(ShipToCodeEvent.search(
          shipToInfos: [
            ShipToInfo.empty().copyWith(shipToCustomerCode: 'fake-ship-to-code')
          ],
        ));
      },
      expect: () => [
        ShipToCodeState.initial()
            .copyWith(searchKey: SearchKey('fake-ship-to-code')),
        ShipToCodeState.initial().copyWith(shipToInfoList: [
          ShipToInfo.empty().copyWith(shipToCustomerCode: 'fake-ship-to-code')
        ], searchKey: SearchKey('fake-ship-to-code'))
      ],
    );

    blocTest(
      'Ship To Code Load fail',
      build: () => ShipToCodeBloc(
        shipToCodeRepository: mockShipToCodeRepo,
      ),
      act: (ShipToCodeBloc bloc) {
        bloc.add(const ShipToCodeEvent.load(
          shipToInfos: [],
        ));
      },
      expect: () => [
        ShipToCodeState.initial().copyWith(
          shipToInfoList: [],
        ),
      ],
    );

    blocTest(
      'Ship To Code Load Success',
      build: () => ShipToCodeBloc(
        shipToCodeRepository: mockShipToCodeRepo,
      ),
      act: (ShipToCodeBloc bloc) {
        bloc.add(ShipToCodeEvent.load(
          shipToInfos: [
            ShipToInfo.empty().copyWith(shipToCustomerCode: 'fake-ship-to-code')
          ],
        ));
      },
      expect: () => [
        ShipToCodeState.initial().copyWith(
          shipToInfoList: [
            ShipToInfo.empty().copyWith(shipToCustomerCode: 'fake-ship-to-code')
          ],
        ),
      ],
    );

    blocTest<ShipToCodeBloc, ShipToCodeState>(
      'Ship To Code LoadSavedShipToCode isLeft',
      setUp: () {
        when(
          () => mockShipToCodeRepo.getShipToCode(),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('Fake Error'),
          ),
        );
        when(
          () => mockShipToCodeRepo.storeShipToCode(
            shipToCode: 'default-ship-to-code',
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      build: () => ShipToCodeBloc(
        shipToCodeRepository: mockShipToCodeRepo,
      ),
      act: (ShipToCodeBloc bloc) {
        bloc.add(
          ShipToCodeEvent.loadSavedShipToCode(
            shipToInfos: [
              ShipToInfo.empty().copyWith(
                shipToCustomerCode: 'fake-ship-to-code',
              )
            ],
            defaultShipToInfo: ShipToInfo.empty().copyWith(
              shipToCustomerCode: 'default-ship-to-code',
            ),
          ),
        );
      },
      expect: () => [
        ShipToCodeState.initial().copyWith(
          shipToInfo: ShipToInfo.empty().copyWith(
            shipToCustomerCode: 'default-ship-to-code',
          ),
        ),
      ],
    );

    blocTest<ShipToCodeBloc, ShipToCodeState>(
      'Ship To Code LoadSavedShipToCode isRight firstWhere',
      setUp: () {
        when(
          () => mockShipToCodeRepo.getShipToCode(),
        ).thenAnswer(
          (invocation) async => const Right(
            'dummy-ship-to-code',
          ),
        );
        when(
          () => mockShipToCodeRepo.storeShipToCode(
            shipToCode: 'dummy-ship-to-code',
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      build: () => ShipToCodeBloc(
        shipToCodeRepository: mockShipToCodeRepo,
      ),
      act: (ShipToCodeBloc bloc) {
        bloc.add(
          ShipToCodeEvent.loadSavedShipToCode(
            shipToInfos: [
              ShipToInfo.empty().copyWith(
                shipToCustomerCode: 'fake-ship-to-code',
              ),
              ShipToInfo.empty().copyWith(
                shipToCustomerCode: 'dummy-ship-to-code',
              ),
            ],
            defaultShipToInfo: ShipToInfo.empty().copyWith(
              shipToCustomerCode: 'default-ship-to-code',
            ),
          ),
        );
      },
      expect: () => [
        ShipToCodeState.initial().copyWith(
          shipToInfo: ShipToInfo.empty().copyWith(
            shipToCustomerCode: 'dummy-ship-to-code',
          ),
        ),
      ],
    );

    blocTest<ShipToCodeBloc, ShipToCodeState>(
      'Ship To Code LoadSavedShipToCode isRight orElse',
      setUp: () {
        when(
          () => mockShipToCodeRepo.getShipToCode(),
        ).thenAnswer(
          (invocation) async => const Right(
            'dummy-ship-to-code',
          ),
        );
        when(
          () => mockShipToCodeRepo.storeShipToCode(
            shipToCode: 'default-ship-to-code',
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      build: () => ShipToCodeBloc(
        shipToCodeRepository: mockShipToCodeRepo,
      ),
      act: (ShipToCodeBloc bloc) {
        bloc.add(
          ShipToCodeEvent.loadSavedShipToCode(
            shipToInfos: [
              ShipToInfo.empty().copyWith(
                shipToCustomerCode: 'default-ship-to-code',
              ),
            ],
            defaultShipToInfo: ShipToInfo.empty().copyWith(
              shipToCustomerCode: 'default-ship-to-code',
            ),
          ),
        );
      },
      expect: () => [
        ShipToCodeState.initial().copyWith(
          shipToInfo: ShipToInfo.empty().copyWith(
            shipToCustomerCode: 'default-ship-to-code',
          ),
        ),
      ],
    );
  });
}
