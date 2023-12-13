import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/home/banners/top_advert_box_banner/top_advert_box_banner.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class MockHTTPService extends Mock implements HttpService {}

class MockBannerBloc extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockCustomerCodeBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

void main() {
  late BannerBloc mockBannerBloc;
  late MockHTTPService mockHTTPService;
  late AppRouter autoRouterMock;
  late CustomerCodeBloc mockCustomerCodeBloc;
  late EligibilityBloc mockEligibilityBloc;
  const mockUrl = 'mock-image-urls';

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockEligibilityBloc = MockEligibilityBloc();
    mockBannerBloc = MockBannerBloc();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockEligibilityBloc);
    locator.registerFactory(() => mockBannerBloc);
    locator.registerLazySingleton(() => mockCustomerCodeBloc);
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    autoRouterMock = locator<AppRouter>();
    mockHTTPService = MockHTTPService();
    mockCustomerCodeBloc = MockCustomerCodeBloc();
    locator.registerLazySingleton<HttpService>(
      () => mockHTTPService,
    );

    final imageData =
        await rootBundle.load('assets/images/data/banner_image_data');
    final imageUint8List = imageData.buffer
        .asUint8List(imageData.offsetInBytes, imageData.lengthInBytes);

    final options = RequestOptions(
      responseType: ResponseType.json,
      path: '',
    );
    when(
      () => mockHTTPService.request(
        method: 'GET',
        url: mockUrl,
        responseType: ResponseType.bytes,
      ),
    ).thenAnswer(
      (invocation) => Future.value(
        Response(
          statusCode: 200,
          data: imageUint8List,
          requestOptions: options,
        ),
      ),
    );
  });
  final fakeCustomerCodeInfo =
      CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '00001234');

  group('Carousel Banner', () {
    setUp(() {
      when(() => mockBannerBloc.state).thenReturn(BannerState.initial());
      when(() => mockEligibilityBloc.state)
          .thenReturn(EligibilityState.initial());
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial());
    });

    RouteDataScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<BannerBloc>(create: (context) => mockBannerBloc),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => mockCustomerCodeBloc,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => mockEligibilityBloc,
          ),
        ],
        child: const Scaffold(body: TopAdvertBoxBanner()),
      );
    }

    testWidgets('Banner test - when customer code changed - Success',
        (tester) async {
      final expectedCustomerCodeInfo = [
        CustomerCodeState.initial()
            .copyWith(customerCodeInfo: fakeCustomerCodeInfo)
      ];
      whenListen(
        mockCustomerCodeBloc,
        Stream.fromIterable(expectedCustomerCodeInfo),
      );

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      verify(
        () => mockBannerBloc.add(
          BannerEvent.fetch(
            salesOrganisation: mockEligibilityBloc.state.salesOrganisation,
            bannerType: 'top_advert_box',
            country: mockEligibilityBloc.state.salesOrg.country,
            isPreSalesOrg: false,
            role: mockEligibilityBloc.state.user.role.type.getEZReachRoleType,
            targetCustomerType: '',
            branchCode: '',
          ),
        ),
      ).called(1);
    });
  });
}
