import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/repository/product_images_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ReturnListRepositoryMock extends Mock implements ReturnListRepository {}

class ProductImagesRepositoryMock extends Mock
    implements ProductImagesRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ReturnListRepository returnListRepositoryMock;
  late ProductImagesRepository productImagesRepositoryMock;

  group('Return List BLOC Testing=>', () {
    setUp(() {
      returnListRepositoryMock = ReturnListRepositoryMock();
      productImagesRepositoryMock = ProductImagesRepositoryMock();
    });

    blocTest<ReturnListByItemBloc, ReturnListByItemState>(
      'For "initialized" Event',
      build: () => ReturnListByItemBloc(
        returnListRepository: returnListRepositoryMock,
        productImagesRepository: productImagesRepositoryMock,
      ),
      act: (bloc) => bloc.add(const ReturnListByItemEvent.initialized()),
      expect: () => [ReturnListByItemState.initial()],
    );

    blocTest<ReturnListByItemBloc, ReturnListByItemState>(
      'For "fetch" Event with failure',
      build: () => ReturnListByItemBloc(
        returnListRepository: returnListRepositoryMock,
        productImagesRepository: productImagesRepositoryMock,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.fetchReturnListByItem(
            appliedFilter: ReturnFilter.empty(),
            customerCode: CustomerCodeInfo.empty(),
            salesOrg: SalesOrg('2001'),
            searchKey: SearchKey(''),
            shipToInfo: ShipToInfo.empty(),
            user: User.empty(),
            offset: 0,
            pageSize: 24,
          ),
        ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')));
      },
      act: (bloc) => bloc.add(
        ReturnListByItemEvent.fetch(
          appliedFilter: ReturnFilter.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrg: SalesOrg('2001'),
          searchKey: SearchKey(''),
          shipInfo: ShipToInfo.empty(),
          user: User.empty(),
        ),
      ),
      expect: () => [
        ReturnListByItemState.initial().copyWith(
          isFetching: true,
        ),
        ReturnListByItemState.initial().copyWith(
          isFetching: false,
          canLoadMore: false,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error'))),
        )
      ],
    );

    blocTest<ReturnListByItemBloc, ReturnListByItemState>(
      'For "loadMore" Event with failure',
      build: () => ReturnListByItemBloc(
        returnListRepository: returnListRepositoryMock,
        productImagesRepository: productImagesRepositoryMock,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.fetchReturnListByItem(
            appliedFilter: ReturnFilter.empty(),
            customerCode: CustomerCodeInfo.empty(),
            salesOrg: SalesOrg('2001'),
            searchKey: SearchKey(''),
            shipToInfo: ShipToInfo.empty(),
            user: User.empty(),
            offset: 0,
            pageSize: 24,
          ),
        ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')));
      },
      act: (bloc) => bloc.add(
        ReturnListByItemEvent.loadMore(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrg: SalesOrg('2001'),
          shipInfo: ShipToInfo.empty(),
          user: User.empty(),
        ),
      ),
      expect: () => [
        ReturnListByItemState.initial().copyWith(
          isFetching: true,
        ),
        ReturnListByItemState.initial().copyWith(
          isFetching: false,
          canLoadMore: false,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error'))),
        )
      ],
    );
  });
}
