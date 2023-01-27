import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/additional_details_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  late SalesOrganisationConfigs config;
  late AdditionalDetailsState state;
  late AdditionalDetailsData data;
  group(
    'Additional Details Bloc Test',
    () {
      setUp(
        () {
          config = SalesOrganisationConfigs.empty().copyWith(
            enableMobileNumber: true,
            ponRequired: true,
            enablePaymentTerms: true,
            enableFutureDeliveryDay: true,
            futureDeliveryDay: FutureDeliveryDay('4'),
          );
          state = AdditionalDetailsState.initial();
          data = AdditionalDetailsData.empty();
        },
      );
      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Load Bloc with futureDeliveryDay',
        build: () => AdditionalDetailsBloc(),
        act: (bloc) =>
            bloc.add(AdditionalDetailsEvent.initialized(config: config)),
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            additionalDetailsData: data.copyWith(
              deliveryDate: DeliveryDate(
                DateFormat('yyyy-MM-dd').format(
                  DateTime.now().add(
                    const Duration(
                      days: 1,
                    ),
                  ),
                ),
              ),
            ),
            isValidated: false,
            showErrorMessages: false,
          )
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Load Bloc without futureDeliveryDay',
        build: () => AdditionalDetailsBloc(),
        act: (bloc) => bloc.add(AdditionalDetailsEvent.initialized(
            config: config.copyWith(futureDeliveryDay: FutureDeliveryDay('')))),
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            additionalDetailsData: data.copyWith(
              deliveryDate: DeliveryDate(
                DateFormat('yyyy-MM-dd').format(
                  DateTime.now().add(
                    Duration(
                      days: int.parse('1'),
                    ),
                  ),
                ),
              ),
            ),
            isValidated: false,
            showErrorMessages: false,
          )
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details AdditionalDetails Form OnTextChange',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial(),
        act: (AdditionalDetailsBloc bloc) {
          bloc
            ..add(const AdditionalDetailsEvent.onTextChange(
              label: AdditionalDetailsLabel.customerPoReference,
              newValue: 'Sample Reference',
            ))
            ..add(const AdditionalDetailsEvent.onTextChange(
              label: AdditionalDetailsLabel.contactNumber,
              newValue: '1234567890',
            ))
            ..add(const AdditionalDetailsEvent.onTextChange(
              label: AdditionalDetailsLabel.collectiveNumber,
              newValue: '1234-2345',
            ))
            ..add(const AdditionalDetailsEvent.onTextChange(
              label: AdditionalDetailsLabel.contactPerson,
              newValue: 'Person Name',
            ))
            ..add(const AdditionalDetailsEvent.onTextChange(
              label: AdditionalDetailsLabel.deliveryDate,
              newValue: '2012-12-10',
            ))
            ..add(const AdditionalDetailsEvent.onTextChange(
              label: AdditionalDetailsLabel.referenceNote,
              newValue: 'Reference Note',
            ))
            ..add(const AdditionalDetailsEvent.onTextChange(
              label: AdditionalDetailsLabel.specialInstruction,
              newValue: 'Special Instruction',
            ))
            ..add(const AdditionalDetailsEvent.onTextChange(
              label: AdditionalDetailsLabel.paymentTerm,
              newValue: '0001-Test',
            ));
        },
        expect: () => [
          state.copyWith(
            additionalDetailsData: data.copyWith(
              customerPoReference: CustomerPoReference('Sample Reference'),
            ),
            isValidated: false,
            showErrorMessages: false,
          ),
          state.copyWith(
            additionalDetailsData: data.copyWith(
              customerPoReference: CustomerPoReference('Sample Reference'),
              contactNumber: ContactNumber('1234567890'),
            ),
            isValidated: false,
            showErrorMessages: false,
          ),
          state.copyWith(
            additionalDetailsData: data.copyWith(
              customerPoReference: CustomerPoReference('Sample Reference'),
              contactNumber: ContactNumber('1234567890'),
              collectiveNumber: CollectiveNumber('1234-2345'),
            ),
            isValidated: false,
            showErrorMessages: false,
          ),
          state.copyWith(
            additionalDetailsData: data.copyWith(
              customerPoReference: CustomerPoReference('Sample Reference'),
              contactNumber: ContactNumber('1234567890'),
              collectiveNumber: CollectiveNumber('1234-2345'),
              contactPerson: ContactPerson('Person Name'),
            ),
            isValidated: false,
            showErrorMessages: false,
          ),
          state.copyWith(
            additionalDetailsData: data.copyWith(
              customerPoReference: CustomerPoReference('Sample Reference'),
              contactNumber: ContactNumber('1234567890'),
              collectiveNumber: CollectiveNumber('1234-2345'),
              contactPerson: ContactPerson('Person Name'),
              deliveryDate: DeliveryDate('2012-12-10'),
            ),
            isValidated: false,
            showErrorMessages: false,
          ),
          state.copyWith(
            additionalDetailsData: data.copyWith(
              customerPoReference: CustomerPoReference('Sample Reference'),
              contactNumber: ContactNumber('1234567890'),
              collectiveNumber: CollectiveNumber('1234-2345'),
              contactPerson: ContactPerson('Person Name'),
              deliveryDate: DeliveryDate('2012-12-10'),
              referenceNote: ReferenceNote('Reference Note'),
            ),
            isValidated: false,
            showErrorMessages: false,
          ),
          state.copyWith(
            additionalDetailsData: data.copyWith(
              customerPoReference: CustomerPoReference('Sample Reference'),
              contactNumber: ContactNumber('1234567890'),
              collectiveNumber: CollectiveNumber('1234-2345'),
              contactPerson: ContactPerson('Person Name'),
              deliveryDate: DeliveryDate('2012-12-10'),
              referenceNote: ReferenceNote('Reference Note'),
              specialInstruction: SpecialInstruction('Special Instruction'),
            ),
            isValidated: false,
            showErrorMessages: false,
          ),
          state.copyWith(
            additionalDetailsData: data.copyWith(
              customerPoReference: CustomerPoReference('Sample Reference'),
              contactNumber: ContactNumber('1234567890'),
              collectiveNumber: CollectiveNumber('1234-2345'),
              contactPerson: ContactPerson('Person Name'),
              deliveryDate: DeliveryDate('2012-12-10'),
              referenceNote: ReferenceNote('Reference Note'),
              specialInstruction: SpecialInstruction('Special Instruction'),
              paymentTerm: PaymentTerm('0001-Test'),
            ),
            isValidated: false,
            showErrorMessages: false,
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Validate AdditionalDetails Form Success',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
            additionalDetailsData: AdditionalDetailsData.empty().copyWith(
          customerPoReference: CustomerPoReference('CO REF'),
          contactPerson: ContactPerson('PERSON'),
          contactNumber: ContactNumber('123456'),
          paymentTerm: PaymentTerm('0001-TEST'),
        )),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(AdditionalDetailsEvent.validateForm(
            config: config,
          ));
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
            showErrorMessages: false,
            additionalDetailsData: AdditionalDetailsData.empty().copyWith(
              customerPoReference: CustomerPoReference('CO REF'),
              contactPerson: ContactPerson('PERSON'),
              contactNumber: ContactNumber('123456'),
              paymentTerm: PaymentTerm('0001-TEST'),
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Validate AdditionalDetails Form Failure',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
            additionalDetailsData: AdditionalDetailsData.empty().copyWith(
          customerPoReference: CustomerPoReference('CO REF'),
          contactPerson: ContactPerson(''),
          contactNumber: ContactNumber('123456'),
          paymentTerm: PaymentTerm('0001-TEST'),
        )),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(AdditionalDetailsEvent.validateForm(
            config: config,
          ));
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            isValidated: false,
            showErrorMessages: true,
            additionalDetailsData: AdditionalDetailsData.empty().copyWith(
              customerPoReference: CustomerPoReference('CO REF'),
              contactPerson: ContactPerson(''),
              contactNumber: ContactNumber('123456'),
              paymentTerm: PaymentTerm('0001-TEST'),
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details toggleGreenDelivery test enableGreenDelivery true',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          additionalDetailsData: AdditionalDetailsData.empty().copyWith(
            customerPoReference: CustomerPoReference('CO REF'),
            contactPerson: ContactPerson(''),
            contactNumber: ContactNumber('123456'),
            paymentTerm: PaymentTerm('0001-TEST'),
            greenDeliveryEnabled: false,
          ),
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(const AdditionalDetailsEvent.toggleGreenDelivery(true));
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            additionalDetailsData: AdditionalDetailsData.empty().copyWith(
              customerPoReference: CustomerPoReference('CO REF'),
              contactPerson: ContactPerson(''),
              contactNumber: ContactNumber('123456'),
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
          additionalDetailsData: AdditionalDetailsData.empty().copyWith(
            customerPoReference: CustomerPoReference('CO REF'),
            contactPerson: ContactPerson(''),
            contactNumber: ContactNumber('123456'),
            paymentTerm: PaymentTerm('0001-TEST'),
            greenDeliveryEnabled: true,
          ),
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(const AdditionalDetailsEvent.toggleGreenDelivery(false));
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            additionalDetailsData: AdditionalDetailsData.empty().copyWith(
              customerPoReference: CustomerPoReference('CO REF'),
              contactPerson: ContactPerson(''),
              contactNumber: ContactNumber('123456'),
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
            additionalDetailsData: AdditionalDetailsData.empty().copyWith(
              poDocuments: [PoDocuments.empty()],
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Po Document Remove',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          additionalDetailsData: AdditionalDetailsData.empty().copyWith(
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
          AdditionalDetailsState.initial(),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Po Document Remove All',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          additionalDetailsData: AdditionalDetailsData.empty().copyWith(
            poDocuments: [
              PoDocuments(name: 'fake-name1', url: 'fake-name1'),
              PoDocuments(name: 'fake-name2', url: 'fake-name2'),
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
