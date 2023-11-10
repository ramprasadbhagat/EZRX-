import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/faq/faq_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_info.dart';
import 'package:ezrxmobile/domain/faq/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_local.dart';
import 'package:ezrxmobile/infrastructure/faq/repository/faq_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFAQInfoRepository extends Mock implements FAQInfoRepository {}

void main() {
  late FAQInfoRepository repository;
  late FAQInfo faqInfo;
  late Config config;
  final faqState = FaqState.initial();
  final salesOrg = SalesOrg('fake-salesOrg');
  const pageSize = 24;
  setUpAll(() async {
    config = Config()..appFlavor = Flavor.mock;
    WidgetsFlutterBinding.ensureInitialized();
    repository = MockFAQInfoRepository();

    faqInfo = await FAQInfoLocalDataSource().getFAQInfo();
  });
  group('FAQ Bloc', () {
    blocTest(
      'Get Faq success',
      build: () => FaqBloc(
        faqInfoRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getFAQList(
            salesOrg: salesOrg,
            pageSize: pageSize,
            after: '',
          ),
        ).thenAnswer(
          (invocation) async => Right(
            faqInfo,
          ),
        );
      },
      act: (FaqBloc bloc) => bloc.add(
        FaqEvent.getFaq(
          salesOrg: salesOrg,
        ),
      ),
      expect: () => [
        faqState.copyWith(
          isFetching: true,
          faqInfo: FAQInfo.empty(),
        ),
        faqState.copyWith(
          isFetching: false,
          faqInfo: faqInfo,
          canLoadMore: false,
          selectedCategory: FAQCategory('All'),
          apiFailureOrSuccessOption: optionOf(Right(faqInfo)),
        ),
      ],
      verify: (FaqBloc bloc) => expect(
        bloc.state.faqInfo,
        faqInfo,
      ),
    );
    blocTest(
      'Get Faq fail',
      build: () => FaqBloc(
        faqInfoRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getFAQList(
            salesOrg: salesOrg,
            pageSize: pageSize,
            after: '',
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (FaqBloc bloc) => bloc.add(
        FaqEvent.getFaq(
          salesOrg: salesOrg,
        ),
      ),
      expect: () => [
        faqState.copyWith(
          isFetching: true,
          faqInfo: FAQInfo.empty(),
          apiFailureOrSuccessOption: none(),
        ),
        faqState.copyWith(
          faqInfo: FAQInfo.empty(),
          isFetching: false,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );
    blocTest<FaqBloc, FaqState>(
      'faq loadMore',
      build: () => FaqBloc(
        faqInfoRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getFAQList(
            salesOrg: salesOrg,
            pageSize: pageSize,
            after: '',
          ),
        ).thenAnswer(
          (invocation) async => Right(
            faqInfo,
          ),
        );
      },
      act: (bloc) => bloc.add(
        FaqEvent.loadMoreAFaq(
          salesOrg: salesOrg,
        ),
      ),
      expect: () => [
        faqState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        faqState.copyWith(
          apiFailureOrSuccessOption: optionOf(
            Right(
              faqInfo,
            ),
          ),
          isFetching: false,
          canLoadMore: false,
          faqInfo: faqInfo,
        ),
      ],
    );
    blocTest<FaqBloc, FaqState>(
      'faq loadMore fail',
      build: () => FaqBloc(
        faqInfoRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getFAQList(
            salesOrg: salesOrg,
            pageSize: pageSize,
            after: '',
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(
        FaqEvent.loadMoreAFaq(
          salesOrg: salesOrg,
        ),
      ),
      expect: () => [
        faqState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        faqState.copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
          isFetching: false,
        ),
      ],
    );

    blocTest(
      'Get filter Faq success',
      build: () => FaqBloc(
        faqInfoRepository: repository,
        config: config,
      ),
      act: (FaqBloc bloc) => bloc.add(
        FaqEvent.filterByFaqCategory(
          selectedCategory: FAQCategory('All'),
        ),
      ),
      expect: () => [
        faqState.copyWith(
          selectedCategory: FAQCategory('All'),
        ),
      ],
    );
    blocTest(
      'Get Search Faq success',
      build: () => FaqBloc(
        faqInfoRepository: repository,
        config: config,
      ),
      act: (FaqBloc bloc) => bloc.add(
        const FaqEvent.updatedSearchFaq(
          searchKey: 'mock_search',
        ),
      ),
      expect: () => [
        faqState.copyWith(
          searchKey: SearchKey('mock_search'),
        ),
      ],
    );
  });
}
