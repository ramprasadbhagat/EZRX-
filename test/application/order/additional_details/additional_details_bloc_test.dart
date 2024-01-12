import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';

class OrderRepositoryMock extends Mock implements OrderRepository {}

class CartRepositoryMock extends Mock implements CartRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late DeliveryInfoData data;
  group(
    'Additional Details Bloc Test',
    () {
      setUp(
        () {
          data = DeliveryInfoData.empty();
        },
      );
      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Load Bloc with futureDeliveryDay',
        build: () => AdditionalDetailsBloc(),
        act: (bloc) => bloc.add(
          AdditionalDetailsEvent.initialized(
            config: fakeIDSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ),
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              deliveryDate: DateTimeStringValue(''),
              mobileNumber: MobileNumber(''),
            ),
            config: fakeIDSalesOrgConfigs,
          )
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Load Bloc without futureDeliveryDay',
        build: () => AdditionalDetailsBloc(),
        act: (bloc) => bloc.add(
          AdditionalDetailsEvent.initialized(
            config: fakeIDSalesOrgConfigs.copyWith(
              futureDeliveryDay: FutureDeliveryDay(''),
            ),
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ),
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              deliveryDate: DateTimeStringValue(''),
              mobileNumber: MobileNumber(''),
            ),
            config: fakeIDSalesOrgConfigs.copyWith(
              futureDeliveryDay: FutureDeliveryDay(''),
            ),
          )
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'initiateFromHistory test',
        build: () => AdditionalDetailsBloc(),
        act: (bloc) => bloc.add(
          AdditionalDetailsEvent.initiateFromHistory(
            data: data,
            customerCodeInfo: fakeCustomerCodeInfo.copyWith(
              telephoneNumber: PhoneNumber('1234567890'),
            ),
          ),
        ),
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              deliveryDate: DateTimeStringValue(''),
              mobileNumber: MobileNumber('1234567890'),
            ),
          )
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details AdditionalDetails Form OnTextChange',
        build: () => AdditionalDetailsBloc(),
        act: (AdditionalDetailsBloc bloc) {
          bloc
            ..add(
              const AdditionalDetailsEvent.onTextChange(
                label: DeliveryInfoLabel.poReference,
                newValue: 'Sample Reference',
              ),
            )
            ..add(
              const AdditionalDetailsEvent.onTextChange(
                label: DeliveryInfoLabel.contactPerson,
                newValue: 'Person Name',
              ),
            )
            ..add(
              const AdditionalDetailsEvent.onTextChange(
                label: DeliveryInfoLabel.deliveryDate,
                newValue: '2012-12-10',
              ),
            )
            ..add(
              const AdditionalDetailsEvent.onTextChange(
                label: DeliveryInfoLabel.referenceNote,
                newValue: 'Reference Note',
              ),
            )
            ..add(
              const AdditionalDetailsEvent.onTextChange(
                label: DeliveryInfoLabel.deliveryInstruction,
                newValue: 'Special Instruction',
              ),
            )
            ..add(
              const AdditionalDetailsEvent.onTextChange(
                label: DeliveryInfoLabel.paymentTerm,
                newValue: '0001-Test',
              ),
            )
            ..add(
              const AdditionalDetailsEvent.onTextChange(
                label: DeliveryInfoLabel.mobileNumber,
                newValue: '1234567890',
              ),
            );
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              poReference: PoReference('Sample Reference'),
            ),
          ),
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              poReference: PoReference('Sample Reference'),
              contactPerson: ContactPerson('Person Name'),
            ),
          ),
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              poReference: PoReference('Sample Reference'),
              contactPerson: ContactPerson('Person Name'),
              deliveryDate: DateTimeStringValue('2012-12-10'),
            ),
          ),
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              poReference: PoReference('Sample Reference'),
              contactPerson: ContactPerson('Person Name'),
              deliveryDate: DateTimeStringValue('2012-12-10'),
              referenceNote: ReferenceNote('Reference Note'),
            ),
          ),
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              poReference: PoReference('Sample Reference'),
              contactPerson: ContactPerson('Person Name'),
              deliveryDate: DateTimeStringValue('2012-12-10'),
              referenceNote: ReferenceNote('Reference Note'),
              deliveryInstruction: DeliveryInstruction('Special Instruction'),
            ),
          ),
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              poReference: PoReference('Sample Reference'),
              contactPerson: ContactPerson('Person Name'),
              deliveryDate: DateTimeStringValue('2012-12-10'),
              referenceNote: ReferenceNote('Reference Note'),
              deliveryInstruction: DeliveryInstruction('Special Instruction'),
              paymentTerm: PaymentTerm('0001-Test'),
            ),
          ),
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              poReference: PoReference('Sample Reference'),
              contactPerson: ContactPerson('Person Name'),
              deliveryDate: DateTimeStringValue('2012-12-10'),
              referenceNote: ReferenceNote('Reference Note'),
              deliveryInstruction: DeliveryInstruction('Special Instruction'),
              paymentTerm: PaymentTerm('0001-Test'),
              mobileNumber: MobileNumber('1234567890'),
            ),
          )
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Change showWarningBlock to false when form validated',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            poReference: PoReference('CO REF'),
            contactPerson: ContactPerson('PERSON'),
            mobileNumber: MobileNumber(''),
            paymentTerm: PaymentTerm('0001-TEST'),
            referenceNote: ReferenceNote('Reference Note Test'),
            deliveryInstruction: DeliveryInstruction('Instruction Test'),
          ),
          showErrorMessages: true,
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            const AdditionalDetailsEvent.onTextChange(
              label: DeliveryInfoLabel.mobileNumber,
              newValue: '1234567890',
            ),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poReference: PoReference('CO REF'),
              contactPerson: ContactPerson('PERSON'),
              mobileNumber: MobileNumber('1234567890'),
              paymentTerm: PaymentTerm('0001-TEST'),
              referenceNote: ReferenceNote('Reference Note Test'),
              deliveryInstruction: DeliveryInstruction('Instruction Test'),
            ),
            showErrorMessages: true,
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Validate AdditionalDetails Form Success',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            poReference: PoReference('CO REF'),
            contactPerson: ContactPerson('PERSON'),
            mobileNumber: MobileNumber('123456'),
            paymentTerm: PaymentTerm('0001-TEST'),
            referenceNote: ReferenceNote('Reference Note Test'),
            deliveryInstruction: DeliveryInstruction('Instruction Test'),
          ),
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            const AdditionalDetailsEvent.validateForm(),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poReference: PoReference('CO REF'),
              contactPerson: ContactPerson('PERSON'),
              mobileNumber: MobileNumber('123456'),
              paymentTerm: PaymentTerm('0001-TEST'),
              referenceNote: ReferenceNote('Reference Note Test'),
              deliveryInstruction: DeliveryInstruction('Instruction Test'),
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Validate AdditionalDetails Form Failure',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            poReference: PoReference('CO REF'),
            contactPerson: ContactPerson(''),
            mobileNumber: MobileNumber('123456'),
            paymentTerm: PaymentTerm('0001-TEST'),
            referenceNote: ReferenceNote('Reference Note Test'),
            deliveryInstruction: DeliveryInstruction('Instruction Test'),
          ),
          config: fakeTHSalesOrgConfigs.copyWith(enableMobileNumber: true),
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            const AdditionalDetailsEvent.validateForm(),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            isValidated: false,
            showErrorMessages: true,
            config: fakeTHSalesOrgConfigs.copyWith(enableMobileNumber: true),
            focusTo: DeliveryInfoLabel.contactPerson,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poReference: PoReference('CO REF'),
              contactPerson: ContactPerson(''),
              mobileNumber: MobileNumber('123456'),
              paymentTerm: PaymentTerm('0001-TEST'),
              referenceNote: ReferenceNote('Reference Note Test'),
              deliveryInstruction: DeliveryInstruction('Instruction Test'),
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details toggleGreenDelivery test enableGreenDelivery true',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            poReference: PoReference('CO REF'),
            contactPerson: ContactPerson(''),
            mobileNumber: MobileNumber('123456'),
            paymentTerm: PaymentTerm('0001-TEST'),
            greenDeliveryEnabled: false,
          ),
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(const AdditionalDetailsEvent.toggleGreenDelivery());
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poReference: PoReference('CO REF'),
              contactPerson: ContactPerson(''),
              mobileNumber: MobileNumber('123456'),
              paymentTerm: PaymentTerm('0001-TEST'),
              greenDeliveryEnabled: true,
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details toggleGreenDelivery test enableGreenDelivery false',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            poReference: PoReference('CO REF'),
            contactPerson: ContactPerson(''),
            mobileNumber: MobileNumber('123456'),
            paymentTerm: PaymentTerm('0001-TEST'),
            greenDeliveryEnabled: true,
          ),
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(const AdditionalDetailsEvent.toggleGreenDelivery());
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poReference: PoReference('CO REF'),
              contactPerson: ContactPerson(''),
              mobileNumber: MobileNumber('123456'),
              paymentTerm: PaymentTerm('0001-TEST'),
              greenDeliveryEnabled: false,
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Po Document Add',
        build: () => AdditionalDetailsBloc(),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            AdditionalDetailsEvent.addPoDocument(
              poDocuments: [PoDocuments.empty()],
            ),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poDocuments: [PoDocuments.empty()],
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Po Document Remove',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            poDocuments: [PoDocuments.empty()],
          ),
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            AdditionalDetailsEvent.removePoDocument(
              poDocument: PoDocuments.empty(),
            ),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial()
              .copyWith(isPoAttachmentValidated: false),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Po Document Remove All',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            poDocuments: [
              PoDocuments(
                name: 'fake-name1',
                url: 'fake-name1',
              ),
              PoDocuments(
                name: 'fake-name2',
                url: 'fake-name2',
              ),
            ],
          ),
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            const AdditionalDetailsEvent.removeAllPoDocument(),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial(),
        ],
      );
    },
  );
}
