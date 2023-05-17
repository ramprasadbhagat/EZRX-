import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/submit_return/submit_return_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/entities/submit_return_response.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/submit_return_request_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSubmitRequestReturnRepository extends Mock
    implements SubmitRequestReturnRepository {}

void main() {
  late MockSubmitRequestReturnRepository mockSubmitRequestReturnRepository;

  late final String refNumber;
  late final String specialInstructions;
  late final String message;
  late final String reqId;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    mockSubmitRequestReturnRepository = MockSubmitRequestReturnRepository();

    refNumber = 'fake-number';
    specialInstructions = 'fake-instructions';
    message = 'fake-message';
    reqId = 'fake-reqId';
  });

  group(
    'Submit Return Bloc',
    () {
      blocTest(
        'Submit re4turn failure',
        build: () => SubmitReturnBloc(
            submitRequestRepository: mockSubmitRequestReturnRepository),
        setUp: () {
          when(() => mockSubmitRequestReturnRepository.submitRequestReturn(
              customerCodeInfo: CustomerCodeInfo.empty(),
              returnReferenceNumber: refNumber,
              specialInstructions: specialInstructions,
              user: User.empty(),
              returnItemsList: [ReturnItem.empty()],
              salesOrg: SalesOrganisation.empty())).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('mock-error'),
            ),
          );
        },
        act: (SubmitReturnBloc bloc) => bloc.add(
            SubmitReturnEvent.submitReturnRequest(
                user: User.empty(),
                returnItemsList: [ReturnItem.empty()],
                returnReferenceNumber: refNumber,
                specialInstructions: specialInstructions,
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrg: SalesOrganisation.empty())),
        expect: () => [
          SubmitReturnState.initial()
              .copyWith(failureOrSuccessOption: none(), isSubmitting: true),
          SubmitReturnState.initial().copyWith(
            isSubmitting: false,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('mock-error'))),
          )
        ],
      );

      blocTest(
        'Submit return request success',
        build: () => SubmitReturnBloc(
            submitRequestRepository: mockSubmitRequestReturnRepository),
        setUp: () {
          when(() => mockSubmitRequestReturnRepository.submitRequestReturn(
              user: User.empty(),
              returnItemsList: [ReturnItem.empty()],
              returnReferenceNumber: refNumber,
              specialInstructions: specialInstructions,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrg: SalesOrganisation.empty())).thenAnswer(
            (invocation) async => Right(SubmitReturnResponse.empty().copyWith(
              message: message,
              requestID: reqId,
            )),
          );
        },
        act: (SubmitReturnBloc bloc) => bloc.add(
            SubmitReturnEvent.submitReturnRequest(
                user: User.empty(),
                returnItemsList: [ReturnItem.empty()],
                returnReferenceNumber: refNumber,
                specialInstructions: specialInstructions,
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrg: SalesOrganisation.empty())),
        expect: () => [
          SubmitReturnState.initial()
              .copyWith(failureOrSuccessOption: none(), isSubmitting: true),
          SubmitReturnState.initial().copyWith(
            isSubmitting: false,
            messages: message,
            requestID: reqId,
            failureOrSuccessOption: none(),
          ),
        ],
      );
    },
  );
}
