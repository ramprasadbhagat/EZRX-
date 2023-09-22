import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/core/device/repository/device_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/new_payment_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class NewPaymentRepositoryMock extends Mock implements NewPaymentRepository {}

class DeviceRepositoryMock extends Mock implements DeviceRepository {}

void main() {
  late NewPaymentRepository newPaymentRepository;
  late DeviceRepository deviceRepository;
  late CustomerOpenItem customerOpenItem;

  setUpAll(() {
    newPaymentRepository = NewPaymentRepositoryMock();
    deviceRepository = DeviceRepositoryMock();
    customerOpenItem = CustomerOpenItem.empty().copyWith(
      openAmountInTransCrcy: 100,
    );
  });

  group(
    'New Payment Bloc Invoices ',
    () {
      blocTest(
        'Initialize',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        setUp: () {
          when(
            () => newPaymentRepository.fetchPaymentMethods(
              salesOrganisation: SalesOrganisation.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [PaymentMethodValue('')],
            ),
          );
        },
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.initialized(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            user: User.empty(),
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            isFetchingPaymentMethod: true,
          ),
          NewPaymentState.initial().copyWith(
            isFetchingPaymentMethod: false,
            paymentMethods: [PaymentMethodValue('')],
            selectedPaymentMethod: PaymentMethodValue(''),
          ),
        ],
      );

      blocTest(
        'UpdateAllInvoices',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updateAllInvoices(
            items: [
              CustomerOpenItem.empty(),
            ],
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            selectedInvoices: [CustomerOpenItem.empty()],
          )
        ],
      );

      blocTest(
        'ToggleInvoice selected => deselect',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => NewPaymentState.initial().copyWith(
          selectedInvoices: [CustomerOpenItem.empty()],
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.toggleInvoice(
            item: CustomerOpenItem.empty(),
            selected: false,
          ),
        ),
        expect: () => [NewPaymentState.initial()],
      );

      blocTest(
        'ToggleInvoice deselect => select',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.toggleInvoice(
            item: CustomerOpenItem.empty(),
            selected: true,
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            selectedInvoices: [CustomerOpenItem.empty()],
          )
        ],
      );
    },
  );

  group(
    'New Payment Bloc Credits',
    () {
      blocTest(
        'UpdateAllCredits',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updateAllCredits(
            items: [
              CustomerOpenItem.empty(),
            ],
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            selectedCredits: [CustomerOpenItem.empty()],
          )
        ],
      );

      blocTest(
        'ToggleCredit selected => deselect',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => NewPaymentState.initial().copyWith(
          selectedCredits: [CustomerOpenItem.empty()],
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.toggleCredit(
            item: CustomerOpenItem.empty(),
            selected: false,
          ),
        ),
        expect: () => [NewPaymentState.initial()],
      );

      blocTest(
        'ToggleCredit deselect => select',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => NewPaymentState.initial().copyWith(
          selectedInvoices: [
            customerOpenItem,
          ],
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.toggleCredit(
            item: customerOpenItem,
            selected: true,
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            selectedInvoices: [
              customerOpenItem,
            ],
            selectedCredits: [
              customerOpenItem,
            ],
          ),
        ],
        verify: (NewPaymentBloc bloc) {
          expect(
            bloc.state.amountTotal,
            customerOpenItem.openAmountInTransCrcy * 2,
          );
        },
      );
    },
  );
}
