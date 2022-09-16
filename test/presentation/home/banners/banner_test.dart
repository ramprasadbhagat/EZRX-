import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_local.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_remote.dart';
import 'package:ezrxmobile/infrastructure/banner/repository/banner_repository.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/presentation/home/banners/banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/multi_bloc_provider_frame_wrapper.dart';

class MockHTTPService extends Mock implements HttpService {}

class MockBannerBloc extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

class MockBannerRepository extends Mock implements BannerRepository {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class MockUserRepo extends Mock implements UserRepository {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late GetIt locator;
  late MockBannerBloc mockBannerBloc;
  late MockHTTPService mockHTTPService;
  late BannerRepository mockBannerRepository;
  late SalesOrgBloc mockSalesOrgBloc;

  final mockSalesOrg = SalesOrg('mock-salesOrg');
  final salesOrg2601 = SalesOrg('2601');
  final mockSalesOrganisation = SalesOrganisation(
      salesOrg: mockSalesOrg, customerInfos: <CustomerInfo>[]);
  final salesOrganisation2601 = SalesOrganisation(
      salesOrg: salesOrg2601, customerInfos: <CustomerInfo>[]);

  late final Uint8List imageUint8List;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockSalesOrgBloc = MockSalesOrgBloc();
    locator = GetIt.instance;
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => CountlyService());
    locator.registerLazySingleton(() => DataSourceExceptionHandler());
    locator.registerLazySingleton(() => BannerQueryMutation());
    locator.registerLazySingleton(() => BannerLocalDataSource());
    locator.registerLazySingleton(() => mockSalesOrgBloc);

    final imageData =
        await rootBundle.load('assets/images/data/banner_image_data');
    imageUint8List = imageData.buffer
        .asUint8List(imageData.offsetInBytes, imageData.lengthInBytes);
  });

  group('Home Banner', () {
    setUp(() {
      mockHTTPService = MockHTTPService();
      when(() => mockHTTPService.request(
            method: 'POST',
            url: '/api/downloadAttachment',
          )).thenAnswer((invocation) {
        var options = RequestOptions(
          responseType: ResponseType.json,
          path: '',
        );
        return Future.value(
          Response(
            statusCode: 200,
            data: imageUint8List,
            requestOptions: options,
          ),
        );
      });
      locator.registerLazySingleton<HttpService>(
        () => mockHTTPService,
      );
      locator.registerLazySingleton(
        () => BannerRemoteDataSource(
          httpService: locator<HttpService>(),
          bannerQueryMutation: locator<BannerQueryMutation>(),
          dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
          config: locator<Config>(),
        ),
      );
      locator.registerLazySingleton(
        () => BannerRepository(
          config: locator<Config>(),
          localDataSource: locator<BannerLocalDataSource>(),
          remoteDataSource: locator<BannerRemoteDataSource>(),
        ),
      );
      locator.registerLazySingleton(
        () => BannerBloc(
          bannerRepository: locator<BannerRepository>(),
          salesOrgBloc: locator<SalesOrgBloc>(),
        ),
      );
    });

    testWidgets('Banner test 1', (tester) async {
      await tester.pumpWidget(
        MultiBlocProviderFrameWrapper(
          providers: [
            BlocProvider<BannerBloc>(
              create: (_) => locator<BannerBloc>(),
            ),
          ],
          child: HomeBanner(),
        ),
      );
      await tester.pump();
      // Create the Finders.
      final pageViewForHomeBanner = find.byKey(const Key('homeBanner'));
      expect(pageViewForHomeBanner, findsOneWidget);
    });
  });
}
