import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/available_payment_method.dart';
import 'package:ezrxmobile/domain/account/entities/delete_payment_method.dart';
import 'package:ezrxmobile/domain/account/entities/edit_payment_method.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_methods_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_methods_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/payment_methods_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class PaymentMethodsLocalDataSourceMock extends Mock
    implements PaymentMethodsLocalDataSource {}

class PaymentMethodsRemoteDataSourceMock extends Mock
    implements PaymentMethodsRemoteDataSource {}

void main() {
  late PaymentMethodsRepository paymentRepo;
  late Config mockConfig;
  late PaymentMethodsLocalDataSource paymentLocalSource;
  late PaymentMethodsRemoteDataSource paymentRemoteSource;

  final paymentMethodMockList = [
    AvailablePaymentMethod.empty(),
    AvailablePaymentMethod.empty(),
  ];

  final updatePaymentMethodsMock = EditPaymentMethod.empty();
  final deletePaymentMethodsMock = DeletePaymentMethod.empty();

  setUpAll(() {
    mockConfig = MockConfig();
    paymentLocalSource = PaymentMethodsLocalDataSourceMock();
    paymentRemoteSource = PaymentMethodsRemoteDataSourceMock();

    paymentRepo = PaymentMethodsRepository(
      config: mockConfig,
      localDataSource: paymentLocalSource,
      remoteDataSource: paymentRemoteSource,
    );
  });

  group(
    'PaymentMethodRepository=>getAvailablePaymentMethods - ',
    () {
      test(
        'successfully locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => paymentLocalSource.getAvailablePaymentMethods())
              .thenAnswer((invocation) async => paymentMethodMockList);

          final result = await paymentRepo.getAvailablePaymentMethods();
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test(
        'fails locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => paymentLocalSource.getAvailablePaymentMethods())
              .thenThrow(MockException());

          final result = await paymentRepo.getAvailablePaymentMethods();
          expect(
            result.isLeft(),
            true,
          );
        },
      );

      test(
        'successfully remotely',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(() => paymentRemoteSource.getAvailablePaymentMethods())
              .thenAnswer((invocation) async => paymentMethodMockList);

          final result = await paymentRepo.getAvailablePaymentMethods();
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test(
        'fails remotely',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(() => paymentRemoteSource.getAvailablePaymentMethods())
              .thenThrow(MockException());

          final result = await paymentRepo.getAvailablePaymentMethods();
          expect(
            result.isLeft(),
            true,
          );
        },
      );
    },
  );

  group(
    'PaymentMethodRepository=>updatePaymentMethods - ',
    () {
      test(
        'successfully locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => paymentLocalSource.updatePaymentMethods())
              .thenAnswer((invocation) async => updatePaymentMethodsMock);

          final result = await paymentRepo.updatePaymentMethods(
            salesOrg: SalesOrg('fake-salesorg'),
            oldPaymentMethod: PaymentMethod('old'),
            newPaymentMethod: PaymentMethod('new'),
          );
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test(
        'fails locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => paymentLocalSource.updatePaymentMethods())
              .thenThrow(MockException());

          final result = await paymentRepo.updatePaymentMethods(
            salesOrg: SalesOrg('fake-salesorg'),
            oldPaymentMethod: PaymentMethod('old'),
            newPaymentMethod: PaymentMethod('new'),
          );
          expect(
            result.isLeft(),
            true,
          );
        },
      );

      test(
        'successfully remotely',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => paymentRemoteSource.updatePaymentMethods(
              salesOrg: 'fake-salesorg',
              oldPaymentMethod: 'old',
              newPaymentMethod: 'new',
            ),
          ).thenAnswer((invocation) async => updatePaymentMethodsMock);

          final result = await paymentRepo.updatePaymentMethods(
            salesOrg: SalesOrg('fake-salesorg'),
            oldPaymentMethod: PaymentMethod('old'),
            newPaymentMethod: PaymentMethod('new'),
          );
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test(
        'fails remotely',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => paymentRemoteSource.updatePaymentMethods(
              salesOrg: 'fake-salesorg',
              oldPaymentMethod: 'old',
              newPaymentMethod: 'new',
            ),
          ).thenThrow(MockException());

          final result = await paymentRepo.updatePaymentMethods(
            salesOrg: SalesOrg('fake-salesorg'),
            oldPaymentMethod: PaymentMethod('old'),
            newPaymentMethod: PaymentMethod('new'),
          );
          expect(
            result.isLeft(),
            true,
          );
        },
      );
    },
  );

  group(
    'PaymentMethodRepository=>deletePaymentMethods - ',
    () {
      test(
        'successfully locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => paymentLocalSource.deletePaymentMethods())
              .thenAnswer((invocation) async => deletePaymentMethodsMock);

          final result = await paymentRepo.deletePaymentMethods(
            salesOrg: SalesOrg('fake-salesorg'),
            paymentMethod: PaymentMethod('payment-method'),
          );
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test(
        'fails locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => paymentLocalSource.deletePaymentMethods())
              .thenThrow(MockException());

          final result = await paymentRepo.deletePaymentMethods(
            salesOrg: SalesOrg('fake-salesorg'),
            paymentMethod: PaymentMethod('payment-method'),
          );
          expect(
            result.isLeft(),
            true,
          );
        },
      );

      test(
        'successfully remotely',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => paymentRemoteSource.deletePaymentMethods(
              salesOrg: 'fake-salesorg',
              paymentMethod: 'payment-method',
            ),
          ).thenAnswer((invocation) async => deletePaymentMethodsMock);

          final result = await paymentRepo.deletePaymentMethods(
            salesOrg: SalesOrg('fake-salesorg'),
            paymentMethod: PaymentMethod('payment-method'),
          );
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test(
        'fails remotely',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => paymentRemoteSource.deletePaymentMethods(
              salesOrg: 'fake-salesorg',
              paymentMethod: 'payment-method',
            ),
          ).thenThrow(MockException());

          final result = await paymentRepo.deletePaymentMethods(
            salesOrg: SalesOrg('fake-salesorg'),
            paymentMethod: PaymentMethod('payment-method'),
          );
          expect(
            result.isLeft(),
            true,
          );
        },
      );
    },
  );
}
