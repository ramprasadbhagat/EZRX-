import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_request_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ReturnRequestRepositoryMock extends Mock
    implements ReturnRequestRepository {}

void main() {
  late ReturnRequestRepository newRequestRepository;
  late ReturnMaterial fakeReturnMaterial;
  late MaterialNumber fakeMaterialNumber;
  late String fakeItemNumber;
  late String fakeAssignmentNumber;
  late String fakeBatch;
  late SalesOrg fakeSalesOrg;

  setUpAll(() {
    newRequestRepository = ReturnRequestRepositoryMock();
    fakeSalesOrg = SalesOrg('fakeSalesOrg');
    fakeMaterialNumber = MaterialNumber('fakeMaterialNumber');
    fakeItemNumber = 'fakeItemNumber';
    fakeAssignmentNumber = 'fakeAssignmentNumber';
    fakeBatch = 'fakeBatch';
    fakeReturnMaterial = ReturnMaterial.empty().copyWith(
      materialNumber: fakeMaterialNumber,
      itemNumber: fakeItemNumber,
      assignmentNumber: fakeAssignmentNumber,
      batch: fakeBatch,
    );
  });

  group(
    'New Request Bloc Invoices ',
    () {
      blocTest(
        ' => Initialize',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        act: (NewRequestBloc bloc) => bloc.add(
          NewRequestEvent.initialized(
            salesOrg: fakeSalesOrg,
          ),
        ),
        expect: () => [
          NewRequestState.initial().copyWith(
            salesOrg: fakeSalesOrg,
          )
        ],
      );

      blocTest(
        ' => toggleReturnItem deselect a return material item',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        seed: () => NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          salesOrg: fakeSalesOrg,
        ),
        act: (NewRequestBloc bloc) => bloc.add(
          NewRequestEvent.toggleReturnItem(
            item: fakeReturnMaterial,
            selected: false,
          ),
        ),
        expect: () => [
          NewRequestState.initial().copyWith(
            salesOrg: fakeSalesOrg,
          )
        ],
      );

      blocTest(
        ' => toggleReturnItem select a return material item',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        seed: () => NewRequestState.initial().copyWith(
          salesOrg: fakeSalesOrg,
        ),
        act: (NewRequestBloc bloc) => bloc.add(
          NewRequestEvent.toggleReturnItem(
            item: fakeReturnMaterial,
            selected: true,
          ),
        ),
        expect: () => [
          NewRequestState.initial().copyWith(
            salesOrg: fakeSalesOrg,
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                invoiceNumber: fakeAssignmentNumber,
                salesOrg: fakeSalesOrg,
                returnItemDetailsList: [
                  ReturnItemDetails.empty().copyWith(
                    //Make sure return item details have 4 importance information:
                    //materialNumber, itemNumber, assignmentNumber, batch
                    materialNumber: fakeMaterialNumber,
                    itemNumber: fakeItemNumber,
                    assignmentNumber: fakeAssignmentNumber,
                    batch: fakeBatch,
                  )
                ],
              )
            ],
          )
        ],
      );
    },
  );

  group(
    'New Request Bloc Fill return',
    () {
      blocTest(
        ' => toggle state of include bonus button',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        seed: () => NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              invoiceNumber: fakeAssignmentNumber,
              salesOrg: fakeSalesOrg,
              returnItemDetailsList: [
                ReturnItemDetails.empty().copyWith(
                  //Make sure return item detals have 4 importance infomation:
                  //materialNumber, itemNumber, assignmentNumber, batch
                  materialNumber: fakeMaterialNumber,
                  itemNumber: fakeItemNumber,
                  assignmentNumber: fakeAssignmentNumber,
                  batch: fakeBatch,
                )
              ],
            )
          ],
        ),
        act: (NewRequestBloc bloc) => [
          bloc.add(
            NewRequestEvent.toggleBonusItem(
              item: fakeReturnMaterial,
              included: false,
            ),
          ),
          bloc.add(
            NewRequestEvent.toggleBonusItem(
              item: fakeReturnMaterial,
              included: true,
            ),
          ),
        ],
        expect: () => [
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                invoiceNumber: fakeAssignmentNumber,
                salesOrg: fakeSalesOrg,
                returnItemDetailsList: [],
              ),
            ],
          ),
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                invoiceNumber: fakeAssignmentNumber,
                salesOrg: fakeSalesOrg,
                returnItemDetailsList: [
                  ReturnItemDetails.empty().copyWith(
                    //Make sure return item detals have 4 importance infomation:
                    //materialNumber, itemNumber, assignmentNumber, batch
                    materialNumber: fakeMaterialNumber,
                    itemNumber: fakeItemNumber,
                    assignmentNumber: fakeAssignmentNumber,
                    batch: fakeBatch,
                  ),
                ],
              )
            ],
          ),
        ],
      );
    },
  );
}
