import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';

void main() {
  group('PaymentSummaryDetailsState Test', () {
    test('=> isLoading should return correct value', () {
      final state = PaymentSummaryDetailsState.initial();
      expect(state.isLoading, false);

      // Modify the state to have isListLoading=true and isDetailFetching=false
      var modifiedState = state.copyWith(
        isListLoading: true,
      );
      expect(modifiedState.isLoading, true);

      // Modify the state to have isListLoading=false and isDetailFetching=true
      modifiedState = state.copyWith(
        isDetailFetching: true,
      );
      expect(modifiedState.isLoading, true);
    });

    test('=> isSavingOrDeleting should return correct value', () {
      final state = PaymentSummaryDetailsState.initial();
      expect(state.isSavingOrDeleting, false);

      // Modify the state to have isSavingAdvice=true and isDeletingPayment=false
      var modifiedState = state.copyWith(
        isSavingAdvice: true,
      );
      expect(modifiedState.isSavingOrDeleting, true);

      // Modify the state to have isSavingAdvice=false and isDeletingPayment=true
      modifiedState = state.copyWith(
        isDeletingPayment: true,
      );
      expect(modifiedState.isSavingOrDeleting, true);
    });

    test('=> adviceExpiryText should return correct value with ID market', () {
      final state = PaymentSummaryDetailsState.initial();

      // Modify the state to have Id market salesOrg
      final modifiedState = state.copyWith(
        salesOrganization: fakeIDSalesOrganisation,
        details: PaymentSummaryDetails.empty().copyWith(
          createdDate: DateTimeStringValue('2023-09-11'),
          status: FilterStatus('Successful'),
        ),
      );

      expect(
        modifiedState.adviceExpiryText.contains('in') &&
            modifiedState.adviceExpiryText.contains('day(s)'),
        true,
      );
    });

    test('=> adviceExpiryText should return correct value with not ID market',
        () {
      final state = PaymentSummaryDetailsState.initial();

      // Modify the state to have Id market salesOrg
      final modifiedState = state.copyWith(
        salesOrganization: fakeSalesOrganisation,
        details: PaymentSummaryDetails.empty().copyWith(
          createdDate: DateTimeStringValue('2023-09-11'),
          status: FilterStatus('Successful'),
        ),
      );

      expect(
        modifiedState.adviceExpiryText,
        'NA',
      );
    });

    test('=> adviceDeletedMessage should return correct value with ID market',
        () {
      final state = PaymentSummaryDetailsState.initial();

      // Modify the state to have Id market salesOrg
      final modifiedState = state.copyWith(
        salesOrganization: fakeIDSalesOrganisation,
        details: PaymentSummaryDetails.empty().copyWith(
          createdDate: DateTimeStringValue('2023-09-11'),
          zzAdvice: StringValue('1234567890'),
        ),
      );

      expect(
        modifiedState.adviceDeletedMessage,
        'PR #1234567890 has been deleted',
      );
    });

    test(
        '=> adviceDeletedMessage should return correct value with not ID market',
        () {
      final state = PaymentSummaryDetailsState.initial();

      // Modify the state to have Id market salesOrg
      final modifiedState = state.copyWith(
        salesOrganization: fakeSalesOrganisation,
        details: PaymentSummaryDetails.empty().copyWith(
          createdDate: DateTimeStringValue('2023-09-11'),
          zzAdvice: StringValue('1234567890'),
        ),
      );

      expect(
        modifiedState.adviceDeletedMessage,
        'PA #1234567890 has been deleted',
      );
    });
  });
}
