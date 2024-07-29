import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/product_details_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_item_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_order_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class ViewByOrderDetailsRepositoryMock extends Mock
    implements ViewByOrderDetailsRepository {}

class ProductDetailsRepositoryMock extends Mock
    implements ProductDetailRepository {}

class ViewByItemRepositoryMock extends Mock implements ViewByItemRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ViewByOrderDetailsRepository viewByOrderDetailsRepositoryMock;
  late ProductDetailRepository productDetailRepositoryMock;
  late OrderNumber fakeOrderNumber;
  final fakeTenderContract = TenderContract.empty().copyWith(
    isNearToExpire: true,
  );
  late OrderHistoryDetails orderHistoryDetailsMock;
  late OrderHistoryDetails orderHistoryDetailsWithTypeBundleMock;
  late Map<MaterialQueryInfo, PriceAggregate> fakeMaterials;
  late Map<MaterialQueryInfo, bool> fakeIsLoadingTenderContract;
  late MaterialQueryInfo fakeQueryInfo;
  late ViewByItemRepository viewByItemRepositoryMock;
  final viewByOrderDetailsState = ViewByOrderDetailsState.initial();
  const fakeError = ApiFailure.other('fake-error');
  final fakeMaterialInfo = MaterialInfo.empty();
  final fakeMaterialNumber = MaterialNumber('fake-data');
  late final List<InvoiceDetail> invoiceDetails;

  group(
    'ViewByOrderDetailsBloc Test',
    () {
      setUpAll(() async {
        viewByOrderDetailsRepositoryMock = ViewByOrderDetailsRepositoryMock();
        productDetailRepositoryMock = ProductDetailsRepositoryMock();
        viewByItemRepositoryMock = ViewByItemRepositoryMock();
        orderHistoryDetailsMock =
            await ViewByOrderDetailsLocalDataSource().getOrderHistoryDetails();
        invoiceDetails =
            await ViewByItemLocalDataSource().getInvoiceDetailsForOrder();
        orderHistoryDetailsMock = orderHistoryDetailsMock.copyWith(
          orderHistoryDetailsOrderItem: [
            orderHistoryDetailsMock.orderHistoryDetailsOrderItem.first,
            orderHistoryDetailsMock.orderHistoryDetailsOrderItem[1].copyWith(
              isTenderContractMaterial: true,
            ),
            orderHistoryDetailsMock.orderHistoryDetailsOrderItem.last,
          ]
              .map(
                (e) => e.copyWith(
                  type: OrderItemType('Comm'),
                  productType: MaterialInfoType.material(),
                ),
              )
              .toList(),
        );

        orderHistoryDetailsWithTypeBundleMock =
            orderHistoryDetailsMock.copyWith(
          orderHistoryDetailsOrderItem: [
            orderHistoryDetailsMock.orderHistoryDetailsOrderItem.first,
            orderHistoryDetailsMock.orderHistoryDetailsOrderItem[1].copyWith(
              isTenderContractMaterial: true,
            ),
            orderHistoryDetailsMock.orderHistoryDetailsOrderItem.last,
          ]
              .map(
                (e) => e.copyWith(
                  type: OrderItemType('Comm'),
                  productType: MaterialInfoType.bundle(),
                  parentId: 'fake-data $e',
                ),
              )
              .toList(),
        );

        fakeMaterials = {
          for (final item in orderHistoryDetailsMock.items)
            item.orderItem.queryInfo: item.toPriceAggregate,
        };
        fakeIsLoadingTenderContract = {
          for (final item in orderHistoryDetailsMock.items)
            if (item.orderItem.isTenderContractMaterial)
              item.orderItem.queryInfo: true,
        };
        fakeQueryInfo = fakeMaterials.keys.first;
        fakeOrderNumber = orderHistoryDetailsMock.orderNumber;
      });

      blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
        'For Initialized Event',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ViewByOrderDetailsEvent.initialized(
            user: fakeClient,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            configs: fakeMYSalesOrgConfigs,
          ),
        ),
        expect: () => [
          viewByOrderDetailsState.copyWith(
            user: fakeClient,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            configs: fakeMYSalesOrgConfigs,
          ),
        ],
      );

      blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
        'For Fetch Event Success',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => viewByOrderDetailsState.copyWith(
          user: fakeClient,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        ),
        setUp: () {
          when(
            () => viewByOrderDetailsRepositoryMock.getViewByOrderDetails(
              user: fakeClient,
              orderNumber: fakeOrderNumber,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: fakeShipToInfo,
            ),
          ).thenAnswer((invocation) async => Right(orderHistoryDetailsMock));
          when(
            () => (viewByItemRepositoryMock.getInvoiceDetailsForOrder(
              orderNumber: fakeOrderNumber,
              customerCodeInfo: fakeCustomerCodeInfo,
              language: fakeClient.preferredLanguage,
            )),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          ViewByOrderDetailsEvent.fetch(
            orderNumber: fakeOrderNumber,
          ),
        ),
        expect: () => [
          viewByOrderDetailsState.copyWith(
            user: fakeClient,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            isLoading: true,
          ),
          viewByOrderDetailsState.copyWith(
            user: fakeClient,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            orderHistoryDetails: orderHistoryDetailsMock,
            failureOrSuccessOption: optionOf(Right(orderHistoryDetailsMock)),
            materials: fakeMaterials,
            isLoadingTenderContract: fakeIsLoadingTenderContract,
          ),
          viewByOrderDetailsState.copyWith(
            user: fakeClient,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            orderHistoryDetails: orderHistoryDetailsMock,
            materials: fakeMaterials,
            isLoadingTenderContract: fakeIsLoadingTenderContract,
            isFetchingInvoices: true,
          ),
          viewByOrderDetailsState.copyWith(
            user: fakeClient,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            orderHistoryDetails: orderHistoryDetailsMock,
            failureOrSuccessOption: optionOf(
              const Left(fakeError),
            ),
            materials: fakeMaterials,
            isLoadingTenderContract: fakeIsLoadingTenderContract,
          ),
        ],
      );

      blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
        'For Fetch Event Failure',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => viewByOrderDetailsState.copyWith(
          user: fakeClient,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        ),
        setUp: () {
          when(
            () => viewByOrderDetailsRepositoryMock.getViewByOrderDetails(
              user: fakeClient,
              orderNumber: fakeOrderNumber,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: fakeShipToInfo,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
          when(
            () => (viewByItemRepositoryMock.getInvoiceDetailsForOrder(
              orderNumber: fakeOrderNumber,
              customerCodeInfo: fakeCustomerCodeInfo,
              language: fakeClient.preferredLanguage,
            )),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          ViewByOrderDetailsEvent.fetch(
            orderNumber: fakeOrderNumber,
          ),
        ),
        expect: () => [
          viewByOrderDetailsState.copyWith(
            isLoading: true,
            user: fakeClient,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeShipToInfo,
          ),
          viewByOrderDetailsState.copyWith(
            isLoading: false,
            user: fakeClient,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-Error'),
              ),
            ),
          ),
          ViewByOrderDetailsState.initial().copyWith(
            user: fakeClient,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            isFetchingInvoices: true,
          ),
          ViewByOrderDetailsState.initial().copyWith(
            user: fakeClient,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            failureOrSuccessOption: optionOf(
              const Left(fakeError),
            ),
          ),
        ],
      );

      blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
        'For Set Order Details',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => viewByOrderDetailsState.copyWith(
          user: fakeClient,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
        ),
        act: (bloc) => bloc.add(
          ViewByOrderDetailsEvent.setOrderDetails(
            orderHistoryDetails: orderHistoryDetailsMock,
          ),
        ),
        expect: () => [
          viewByOrderDetailsState.copyWith(
            user: fakeClient,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            orderHistoryDetails: orderHistoryDetailsMock,
            materials: fakeMaterials,
            isLoadingTenderContract: fakeIsLoadingTenderContract,
          ),
        ],
      );

      blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
        'For Update Material Tender Contract Event',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ViewByOrderDetailsEvent.updateMaterialTenderContract(
            queryInfo: fakeQueryInfo,
            selectedTenderContract: fakeTenderContract,
          ),
        ),
        seed: () => viewByOrderDetailsState.copyWith(
          user: fakeClient,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          orderHistoryDetails: orderHistoryDetailsMock,
          materials: fakeMaterials,
          isLoadingTenderContract: fakeIsLoadingTenderContract,
        ),
        expect: () {
          final materialsWithUpdatedTenderContract = fakeMaterials.map(
            (queryInfo, material) {
              if (queryInfo == fakeQueryInfo) {
                return MapEntry(
                  queryInfo,
                  material.copyWith(
                    tenderContract: fakeTenderContract,
                  ),
                );
              }

              return MapEntry(queryInfo, material);
            },
          );

          final loadingTenderContractStatus = fakeIsLoadingTenderContract.map(
            (queryInfo, isLoading) {
              if (queryInfo == fakeQueryInfo) return MapEntry(queryInfo, false);

              return MapEntry(queryInfo, isLoading);
            },
          );

          return [
            viewByOrderDetailsState.copyWith(
              user: fakeClient,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeMYSalesOrganisation,
              orderHistoryDetails: orderHistoryDetailsMock,
              materials: materialsWithUpdatedTenderContract,
              isLoadingTenderContract: loadingTenderContractStatus,
            ),
          ];
        },
      );

      blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
        'For Expand Attachments',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const ViewByOrderDetailsEvent.expandAttachments(),
        ),
        expect: () => [
          viewByOrderDetailsState.copyWith(
            isExpanded: true,
          ),
        ],
      );

      test('Test poDocumentCount', () {
        final bloc = ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        );
        bloc.emit(
          viewByOrderDetailsState.copyWith(
            orderHistoryDetails: orderHistoryDetailsMock,
          ),
        );
        expect(
          bloc.state.poDocumentCount,
          orderHistoryDetailsMock.orderHistoryDetailsPoDocuments.length,
        );
      });
      test('Test displayedPoDocumentCount', () {
        final bloc = ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        );
        bloc.emit(
          viewByOrderDetailsState.copyWith(
            isExpanded: true,
            orderHistoryDetails: orderHistoryDetailsMock,
          ),
        );
        expect(
          bloc.state.displayedPoDocumentCount,
          bloc.state.poDocumentCount,
        );
        bloc.emit(
          viewByOrderDetailsState.copyWith(
            isExpanded: false,
          ),
        );
        expect(
          bloc.state.displayedPoDocumentCount,
          1,
        );
      });
      test('Test additionalItemCount', () {
        final bloc = ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        );
        bloc.emit(
          viewByOrderDetailsState.copyWith(
            orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
              orderHistoryDetailsPoDocuments: <PoDocuments>[
                PoDocuments.empty(),
                PoDocuments.empty(),
              ],
            ),
          ),
        );
        expect(
          bloc.state.additionalItemCount,
          1,
        );
        bloc.emit(
          viewByOrderDetailsState.copyWith(
            orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
              orderHistoryDetailsPoDocuments: <PoDocuments>[],
            ),
          ),
        );
        expect(
          bloc.state.additionalItemCount,
          0,
        );
      });
      test('Test totalItemCount', () {
        final bloc = ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        );
        bloc.emit(
          viewByOrderDetailsState.copyWith(
            isExpanded: true,
            orderHistoryDetails: orderHistoryDetailsMock,
          ),
        );
        expect(
          bloc.state.totalItemCount,
          bloc.state.displayedPoDocumentCount + bloc.state.additionalItemCount,
        );
      });

      test('Test isOrderHistoryDetailsEmpty', () {
        final bloc = ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        );
        bloc.emit(
          viewByOrderDetailsState.copyWith(
            orderHistoryDetails: orderHistoryDetailsMock,
          ),
        );
        expect(
          bloc.state.isOrderHistoryDetailsEmpty,
          false,
        );
      });

      test(
          'test displayBuyAgainButton is false when isCovidOrderTypeForPH is true and isCustomer is false',
          () {
        final bloc = ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        );
        bloc.emit(
          viewByOrderDetailsState.copyWith(
            configs:
                fakeSalesOrganisationConfigs.copyWith(salesOrg: fakePHSalesOrg),
            orderHistoryDetails:
                orderHistoryDetailsMock.copyWith(type: DocumentType('zpvf')),
            user: fakeZPAdminUser,
          ),
        );

        expect(
          bloc.state.displayBuyAgainButton,
          isFalse,
        );
      });

      test(
          'test displayBuyAgainButton is true when isCovidOrderTypeForPH is false and isCustomer is false',
          () {
        final bloc = ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        );
        bloc.emit(
          viewByOrderDetailsState.copyWith(
            configs:
                fakeSalesOrganisationConfigs.copyWith(salesOrg: fakePHSalesOrg),
            orderHistoryDetails:
                orderHistoryDetailsMock.copyWith(type: DocumentType('zpor')),
            user: fakeZPAdminUser,
          ),
        );

        expect(
          bloc.state.displayBuyAgainButton,
          isTrue,
        );
      });

      test(
          'test displayBuyAgainButton is true when isCovidOrderTypeForPH is true and isCustomer is true',
          () {
        final bloc = ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        );
        bloc.emit(
          viewByOrderDetailsState.copyWith(
            configs:
                fakeSalesOrganisationConfigs.copyWith(salesOrg: fakePHSalesOrg),
            orderHistoryDetails:
                orderHistoryDetailsMock.copyWith(type: DocumentType('zpvf')),
            user: fakeClientAdmin,
          ),
        );

        expect(
          bloc.state.displayBuyAgainButton,
          isTrue,
        );
      });

      test(
          'test displayBuyAgainButton is false when isCovidOrderTypeForSG is true and isCustomer is false',
          () {
        final bloc = ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        );
        bloc.emit(
          viewByOrderDetailsState.copyWith(
            configs:
                fakeSalesOrganisationConfigs.copyWith(salesOrg: fakeSGSalesOrg),
            orderHistoryDetails:
                orderHistoryDetailsMock.copyWith(type: DocumentType('zpfc')),
            user: fakeZPAdminUser,
          ),
        );

        expect(
          bloc.state.displayBuyAgainButton,
          isFalse,
        );
      });

      test(
          'test displayBuyAgainButton is true when isCovidOrderTypeForSG is false and isCustomer is false',
          () {
        final bloc = ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        );
        bloc.emit(
          viewByOrderDetailsState.copyWith(
            configs:
                fakeSalesOrganisationConfigs.copyWith(salesOrg: fakeSGSalesOrg),
            orderHistoryDetails:
                orderHistoryDetailsMock.copyWith(type: DocumentType('zpor')),
            user: fakeZPAdminUser,
          ),
        );

        expect(
          bloc.state.displayBuyAgainButton,
          isTrue,
        );
      });

      test(
          'test displayBuyAgainButton is true when isCovidOrderTypeForSG is true and isCustomer is true',
          () {
        final bloc = ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        );
        bloc.emit(
          viewByOrderDetailsState.copyWith(
            configs:
                fakeSalesOrganisationConfigs.copyWith(salesOrg: fakeSGSalesOrg),
            orderHistoryDetails:
                orderHistoryDetailsMock.copyWith(type: DocumentType('zpfc')),
            user: fakeClientAdmin,
          ),
        );

        expect(
          bloc.state.displayBuyAgainButton,
          isTrue,
        );
      });

      blocTest(
        'For fetchOrdersInvoiceData success',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => viewByOrderDetailsState,
        setUp: () {
          when(
            () => viewByItemRepositoryMock.getInvoiceDetailsForOrder(
              orderNumber: orderHistoryDetailsMock.orderNumber,
              customerCodeInfo: viewByOrderDetailsState.customerCodeInfo,
              language: viewByOrderDetailsState.user.preferredLanguage,
            ),
          ).thenAnswer((invocation) async => Right(invoiceDetails));
        },
        act: (bloc) => bloc.add(
          ViewByOrderDetailsEvent.fetchOrdersInvoiceData(
            orderNumber: orderHistoryDetailsMock.orderNumber,
          ),
        ),
        expect: () => [
          viewByOrderDetailsState.copyWith(
            isFetchingInvoices: true,
          ),
          viewByOrderDetailsState.copyWith(
            invoices: invoiceDetails,
          ),
        ],
      );

      blocTest(
        'Test updateBundle when bundleCodes is empty',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => viewByOrderDetailsState,
        act: (bloc) => bloc.add(const ViewByOrderDetailsEvent.updateBundle()),
        expect: () => [],
      );

      blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
        'Test updateBundle success',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => viewByOrderDetailsState.copyWith(
          orderHistoryDetails: orderHistoryDetailsWithTypeBundleMock,
        ),
        setUp: () {
          when(
            () => (productDetailRepositoryMock.getBundleListDetail(
              customerCodeInfo: viewByOrderDetailsState.customerCodeInfo,
              bundleCodes: orderHistoryDetailsWithTypeBundleMock
                  .orderHistoryDetailsOrderItem.bundleItemDetailsList
                  .map((e) => e.parentId)
                  .toList(),
              salesOrganisation: viewByOrderDetailsState.salesOrganisation,
              shipToInfo: ShipToInfo.empty(),
              language: viewByOrderDetailsState.user.preferredLanguage,
            )),
          ).thenAnswer(
            (invocation) async => {
              fakeMaterialNumber: fakeMaterialInfo,
            },
          );
        },
        act: (bloc) => bloc.add(const ViewByOrderDetailsEvent.updateBundle()),
        expect: () => [
          viewByOrderDetailsState.copyWith(
            isLoadingBundleDetail: true,
            orderHistoryDetails: orderHistoryDetailsWithTypeBundleMock,
          ),
          viewByOrderDetailsState.copyWith(
            orderHistoryDetails: orderHistoryDetailsWithTypeBundleMock.copyWith(
              orderHistoryDetailsOrderItem:
                  orderHistoryDetailsWithTypeBundleMock
                      .orderHistoryDetailsOrderItem
                      .map(
                        (e) => e.copyWith(
                          material: fakeMaterialInfo,
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      );
    },
  );
}
