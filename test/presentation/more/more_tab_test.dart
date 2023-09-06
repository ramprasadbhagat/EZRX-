import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/recent_order/recent_order_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/more/more_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/widget_utils.dart';

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class RecentOrderBlocMock extends MockBloc<RecentOrderEvent, RecentOrderState>
    implements RecentOrderBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class BannerBlocMock extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AnnouncementInfoBlocMock
    extends MockBloc<AnnouncementInfoEvent, AnnouncementInfoState>
    implements AnnouncementInfoBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late CustomerCodeBloc customerCodeBlocMock;
  late CartBloc cartBlocMock;
  late AuthBloc authBlocMock;
  late MaterialListBlocMock materialListBlocMock;
  late UserBloc userBlocMock;
  late RecentOrderBlocMock recentOrderBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late BannerBloc bannerBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AnnouncementInfoBloc announcementInfoBlocMock;
  late AnnouncementBlocMock announcementBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerFactory<BannerBloc>(() => bannerBlocMock);
    locator.registerFactory<MaterialListBloc>(() => materialListBlocMock);
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    salesOrgBlocMock = SalesOrgBlocMock();
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    customerCodeBlocMock = CustomerCodeBlocMock();
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    cartBlocMock = CartBlocMock();
    when(() => cartBlocMock.state).thenReturn(CartState.initial());
    authBlocMock = AuthBlocMock();
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    materialListBlocMock = MaterialListBlocMock();
    when(() => materialListBlocMock.state)
        .thenReturn(MaterialListState.initial());
    userBlocMock = UserBlocMock();
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    recentOrderBlocMock = RecentOrderBlocMock();
    when(() => recentOrderBlocMock.state)
        .thenReturn(RecentOrderState.initial());
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    bannerBlocMock = BannerBlocMock();
    when(() => bannerBlocMock.state).thenReturn(BannerState.initial());
    announcementBlocMock = AnnouncementBlocMock();
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    announcementInfoBlocMock = AnnouncementInfoBlocMock();
    when(() => announcementInfoBlocMock.state)
        .thenReturn(AnnouncementInfoState.initial());
  });

  Future getWidget(tester) async {
    return await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [
          Locale('en'),
        ],
        path: 'assets/langs/langs.csv',
        startLocale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        useOnlyLangCode: true,
        assetLoader: CsvAssetLoader(),
        child: WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<UserBloc>(
              create: (context) => userBlocMock,
            ),
            BlocProvider<AuthBloc>(
              create: (context) => authBlocMock,
            ),
            BlocProvider<RecentOrderBloc>(
              create: (context) => recentOrderBlocMock,
            ),
            BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock,
            ),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock,
            ),
            BlocProvider<BannerBloc>(
              create: (context) => bannerBlocMock,
            ),
            BlocProvider<SalesOrgBloc>(
              create: (context) => salesOrgBlocMock,
            ),
            BlocProvider<MaterialListBloc>(
              create: (context) => materialListBlocMock,
            ),
            BlocProvider<CartBloc>(create: (context) => cartBlocMock),
            BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock,
            ),
            BlocProvider<AnnouncementInfoBloc>(
              create: (context) => announcementInfoBlocMock,
            ),
          ],
          child: const MoreTab(),
        ),
      ),
    );
  }

  group('More Tab Test', () {
    testWidgets(
      ' -> Hide paymentsTile when Enable Payment Configuration is off',
      (WidgetTester tester) async {
        VisibilityDetectorController.instance.updateInterval = Duration.zero;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              //Philippine market: ZPC PH
              salesOrg: SalesOrg('2500'),
            ),
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              //Enable Payment Configuration is off
              disablePayment: true,
            ),
          ),
        );
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: User.empty().copyWith(
              role: Role.empty().copyWith(
                type: RoleType('client_user'),
              ),
              fullName: const FullName(firstName: 'test', lastName: 'test'),
            ),
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final paymentsTile = find.byKey(WidgetKeys.paymentsTile);
        expect(paymentsTile, findsNothing);
      },
    );

    testWidgets(
      ' -> Show paymentsTile when Enable Payment Configuration is on',
      (WidgetTester tester) async {
        VisibilityDetectorController.instance.updateInterval = Duration.zero;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              //Philippine market: ZPC PH
              salesOrg: SalesOrg('2500'),
            ),
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              //Enable Payment Configuration is on
              disablePayment: false,
            ),
          ),
        );
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: User.empty().copyWith(
              role: Role.empty().copyWith(
                type: RoleType('client_user'),
              ),
              fullName: const FullName(firstName: 'test', lastName: 'test'),
            ),
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final paymentsTile = find.byKey(WidgetKeys.paymentsTile);
        expect(paymentsTile, findsOneWidget);
      },
    );
  });
}
