import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';

class SavedOrderRepositoryMock extends Mock implements OrderRepository {}

class CartRepositoryMock extends Mock implements CartRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late SalesOrganisationConfigs config;
  late CustomerCodeInfo customerCodeInfo;
  // late AdditionalDetailsState state;
  late DeliveryInfoData data;
  late OrderRepository repository;
  late SavedOrder orderDetail;
  group(
    'Additional Details Bloc Test',
    () {
      setUpAll(() async {
        orderDetail = await OrderLocalDataSource().getSavedOrderDetail();
      });
      setUp(
        () {
          config = SalesOrganisationConfigs.empty().copyWith(
            enableMobileNumber: true,
            poNumberRequired: true,
            enablePaymentTerms: true,
            enableFutureDeliveryDay: true,
            futureDeliveryDay: FutureDeliveryDay('4'),
          );
          customerCodeInfo = CustomerCodeInfo.empty();
          repository = SavedOrderRepositoryMock();
          // state = AdditionalDetailsState.initial();
          data = DeliveryInfoData.empty();
        },
      );
      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Load Bloc with futureDeliveryDay',
        build: () => AdditionalDetailsBloc(
          savedOrderRepository: repository,
        ),
        act: (bloc) => bloc.add(
          AdditionalDetailsEvent.initialized(
            config: config,
            customerCodeInfo: customerCodeInfo,
          ),
        ),
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              deliveryDate: DeliveryDate(
                DateFormat('yyyy-MM-dd').format(
                  DateTime.now().add(
                    const Duration(
                      days: 1,
                    ),
                  ),
                ),
              ),
              mobileNumber: MobileNumber('NA'),
            ),
            isValidated: false,
            showErrorMessages: false,
          )
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Load Bloc without futureDeliveryDay',
        build: () => AdditionalDetailsBloc(
          savedOrderRepository: repository,
        ),
        act: (bloc) => bloc.add(
          AdditionalDetailsEvent.initialized(
            config: config.copyWith(
              futureDeliveryDay: FutureDeliveryDay(''),
            ),
            customerCodeInfo: customerCodeInfo,
          ),
        ),
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              deliveryDate: DeliveryDate(
                DateFormat('yyyy-MM-dd').format(
                  DateTime.now().add(
                    Duration(
                      days: int.parse('1'),
                    ),
                  ),
                ),
              ),
              mobileNumber: MobileNumber('NA'),
            ),
            isValidated: false,
            showErrorMessages: false,
          )
        ],
      );

      // blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
      //   'Additional Details AdditionalDetails Form OnTextChange',
      //   build: () => AdditionalDetailsBloc(
      //     savedOrderRepository: repository,
      //   ),
      //   seed: () => AdditionalDetailsState.initial(),
      //   act: (AdditionalDetailsBloc bloc) {
      //     bloc
      //       ..add(const AdditionalDetailsEvent.onTextChange(
      //         label: DeliveryInfoLabel.poReference,
      //         newValue: 'Sample Reference',
      //       ))
      //       ..add(const AdditionalDetailsEvent.onTextChange(
      //         label: DeliveryInfoLabel.contactNumber,
      //         newValue: '1234567890',
      //       ))
      //       // ..add(const AdditionalDetailsEvent.onTextChange(
      //       //   label: DeliveryInfoLabel.collectiveNumber,
      //       //   newValue: '1234-2345',
      //       // ))
      //       ..add(const AdditionalDetailsEvent.onTextChange(
      //         label: DeliveryInfoLabel.contactPerson,
      //         newValue: 'Person Name',
      //       ))
      //       ..add(const AdditionalDetailsEvent.onTextChange(
      //         label: DeliveryInfoLabel.deliveryDate,
      //         newValue: '2012-12-10',
      //       ))
      //       ..add(const AdditionalDetailsEvent.onTextChange(
      //         label: DeliveryInfoLabel.referenceNote,
      //         newValue: 'Reference Note',
      //       ))
      //       ..add(const AdditionalDetailsEvent.onTextChange(
      //         label: DeliveryInfoLabel.deliveryInstruction,
      //         newValue: 'Special Instruction',
      //       ))
      //       ..add(const AdditionalDetailsEvent.onTextChange(
      //         label: DeliveryInfoLabel.paymentTerm,
      //         newValue: '0001-Test',
      //       ));
      //   },
      //   expect: () => [
      //     state.copyWith(
      //       deliveryInfoData: data.copyWith(
      //         poReference: PoReference('Sample Reference'),
      //       ),
      //       isValidated: false,
      //       showErrorMessages: false,
      //     ),
      //     state.copyWith(
      //       deliveryInfoData: data.copyWith(
      //         poReference: PoReference('Sample Reference'),
      //         mobileNumber: MobileNumber('1234567890'),
      //       ),
      //       isValidated: false,
      //       showErrorMessages: false,
      //     ),
      //     state.copyWith(
      //       deliveryInfoData: data.copyWith(
      //         poReference: PoReference('Sample Reference'),
      //         mobileNumber: MobileNumber('1234567890'),
      //         // collectiveNumber: CollectiveNumber('1234-2345'),
      //       ),
      //       isValidated: false,
      //       showErrorMessages: false,
      //     ),
      //     state.copyWith(
      //       deliveryInfoData: data.copyWith(
      //         poReference: PoReference('Sample Reference'),
      //         mobileNumber: MobileNumber('1234567890'),
      //         // collectiveNumber: CollectiveNumber('1234-2345'),
      //         contactPerson: ContactPerson('Person Name'),
      //       ),
      //       isValidated: false,
      //       showErrorMessages: false,
      //     ),
      //     state.copyWith(
      //       deliveryInfoData: data.copyWith(
      //         poReference: PoReference('Sample Reference'),
      //         mobileNumber: MobileNumber('1234567890'),
      //         // collectiveNumber: CollectiveNumber('1234-2345'),
      //         contactPerson: ContactPerson('Person Name'),
      //         deliveryDate: DeliveryDate('2012-12-10'),
      //       ),
      //       isValidated: false,
      //       showErrorMessages: false,
      //     ),
      //     state.copyWith(
      //       deliveryInfoData: data.copyWith(
      //         poReference: PoReference('Sample Reference'),
      //         mobileNumber: MobileNumber('1234567890'),
      //         // collectiveNumber: CollectiveNumber('1234-2345'),
      //         contactPerson: ContactPerson('Person Name'),
      //         deliveryDate: DeliveryDate('2012-12-10'),
      //         referenceNote: ReferenceNote('Reference Note'),
      //       ),
      //       isValidated: false,
      //       showErrorMessages: false,
      //     ),
      //     state.copyWith(
      //       deliveryInfoData: data.copyWith(
      //         poReference: PoReference('Sample Reference'),
      //         mobileNumber: MobileNumber('1234567890'),
      //         // collectiveNumber: CollectiveNumber('1234-2345'),
      //         contactPerson: ContactPerson('Person Name'),
      //         deliveryDate: DeliveryDate('2012-12-10'),
      //         referenceNote: ReferenceNote('Reference Note'),
      //         deliveryInstruction: DeliveryInstruction('Special Instruction'),
      //       ),
      //       isValidated: false,
      //       showErrorMessages: false,
      //     ),
      //     state.copyWith(
      //       deliveryInfoData: data.copyWith(
      //         poReference: PoReference('Sample Reference'),
      //         mobileNumber: MobileNumber('1234567890'),
      //         // collectiveNumber: CollectiveNumber('1234-2345'),
      //         contactPerson: ContactPerson('Person Name'),
      //         deliveryDate: DeliveryDate('2012-12-10'),
      //         referenceNote: ReferenceNote('Reference Note'),
      //         deliveryInstruction: DeliveryInstruction('Special Instruction'),
      //         paymentTerm: PaymentTerm('0001-Test'),
      //       ),
      //       isValidated: false,
      //       showErrorMessages: false,
      //     ),
      //   ],
      // );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Validate AdditionalDetails Form Success',
        build: () => AdditionalDetailsBloc(
          savedOrderRepository: repository,
        ),
        seed: () => AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
          poReference: PoReference('CO REF'),
          contactPerson: ContactPerson('PERSON'),
          mobileNumber: MobileNumber('123456'),
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
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poReference: PoReference('CO REF'),
              contactPerson: ContactPerson('PERSON'),
              mobileNumber: MobileNumber('123456'),
              paymentTerm: PaymentTerm('0001-TEST'),
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Validate AdditionalDetails Form Failure',
        build: () => AdditionalDetailsBloc(
          savedOrderRepository: repository,
        ),
        seed: () => AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
          poReference: PoReference('CO REF'),
          contactPerson: ContactPerson(''),
          mobileNumber: MobileNumber('123456'),
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
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poReference: PoReference('CO REF'),
              contactPerson: ContactPerson(''),
              mobileNumber: MobileNumber('123456'),
              paymentTerm: PaymentTerm('0001-TEST'),
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details toggleGreenDelivery test enableGreenDelivery true',
        build: () => AdditionalDetailsBloc(
          savedOrderRepository: repository,
        ),
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
        build: () => AdditionalDetailsBloc(
          savedOrderRepository: repository,
        ),
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
        build: () => AdditionalDetailsBloc(
          savedOrderRepository: repository,
        ),
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
        build: () => AdditionalDetailsBloc(
          savedOrderRepository: repository,
        ),
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
          AdditionalDetailsState.initial(),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Po Document Remove All',
        build: () => AdditionalDetailsBloc(
          savedOrderRepository: repository,
        ),
        seed: () => AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
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

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Init from saved order when SavedOrderDetail API success',
        build: () => AdditionalDetailsBloc(
          savedOrderRepository: repository,
        ),
        setUp: () {
          when(() => repository.getSavedOrderDetail(orderId: orderDetail.id))
              .thenAnswer(
            (invocation) async => Right(orderDetail),
          );
        },
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            AdditionalDetailsEvent.initFromSavedOrder(
              config: config,
              customerCodeInfo: customerCodeInfo,
              orderId: orderDetail.id,
            ),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            isLoading: true,
            orderId: orderDetail.id,
          ),
          AdditionalDetailsState.initial().copyWith(
            isLoading: false,
            orderId: orderDetail.id,
            deliveryInfoData: DeliveryInfoData.fromSavedOrder(
              orderDetail: orderDetail,
              customerCodeInfo: customerCodeInfo,
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Init from saved order when SavedOrderDetail API Failure',
        build: () => AdditionalDetailsBloc(
          savedOrderRepository: repository,
        ),
        setUp: () {
          when(() => repository.getSavedOrderDetail(orderId: orderDetail.id))
              .thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            AdditionalDetailsEvent.initFromSavedOrder(
              config: config,
              customerCodeInfo: customerCodeInfo,
              orderId: orderDetail.id,
            ),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            isLoading: true,
            orderId: orderDetail.id,
          ),
          AdditionalDetailsState.initial().copyWith(
            isLoading: false,
            orderId: orderDetail.id,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              mobileNumber: MobileNumber(
                customerCodeInfo.telephoneNumber.displayTelephoneNumber,
              ),
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Clear saved order id',
        build: () => AdditionalDetailsBloc(
          savedOrderRepository: repository,
        ),
        seed: () =>
            AdditionalDetailsState.initial().copyWith(orderId: 'fake-id'),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            const AdditionalDetailsEvent.clearSavedOrderId(),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial(),
        ],
      );
    },
  );
}
