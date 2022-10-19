import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/material_bundle_list/material_bundle_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_list_local.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/create_order/material_bundle_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/material_frame_wrapper.dart';

class MaterialBundleListBlocMock
    extends MockBloc<MaterialBundleListEvent, MaterialBundleListState>
    implements MaterialBundleListBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

void main() {
  late MaterialBundleListBloc materialBundleListBloc;
  final UserBloc userBlocMock = UserBlocMock();
  final SalesOrgBloc salesOrgBlocMock = SalesOrgBlocMock();
  final CustomerCodeBloc customerCodeBlocMock = CustomerCodeBlocMock();
  final ShipToCodeBloc shipToCodeBLocMock = ShipToCodeBlocMock();
  final AuthBloc authBlocMock = AuthBlocMock();
  var materialBundleItemsMock = <MaterialInfo>[];
  final bundleItemsMock = <Bundle>[];

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    materialBundleListBloc = MaterialBundleListBlocMock();

    materialBundleItemsMock =
        await MaterialBundleListLocalDatasource().getMaterialBundleList();
    for (final item in materialBundleItemsMock) {
      if (item.bundles.isNotEmpty &&
          bundleItemsMock
              .where(
                  (element) => element.bundleCode == item.bundles[0].bundleCode)
              .isEmpty) {
        //item.bundles[0].bundleInformation
        //.sort((a, b) => a.quantity.compareTo(b.quantity));
        bundleItemsMock.add(item.bundles[0]);
      }
    }
    when(() => materialBundleListBloc.state)
        .thenReturn(MaterialBundleListState.initial());

    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => shipToCodeBLocMock.state).thenReturn(ShipToCodeState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(
      SalesOrgState.initial().copyWith(
        salesOrganisation: SalesOrganisation.empty().copyWith(
          salesOrg: SalesOrg('2601'),
        ),
        configs: SalesOrganisationConfigs.empty().copyWith(
          currency: Currency('SGD'),
        ),
      ),
    );
  });

  group('Material Bundle List Screen', () {
    testWidgets(
      'Test that screen has been initialized',
      (tester) async {
        await tester.pumpWidget(
          MaterialFrameWrapper(
            child: BlocProvider<MaterialBundleListBloc>(
              create: (context) => materialBundleListBloc,
              child: const MaterialBundleListPage(),
            ),
          ),
        );
        final materialBundleListPage =
            find.byKey(const Key('materialBundleListPage'));
        expect(materialBundleListPage, findsOneWidget);
      },
    );
    testWidgets('Test while state is fetching', (tester) async {
      when(() => materialBundleListBloc.state).thenReturn(
        MaterialBundleListState.initial().copyWith(
          isFetching: true,
        ),
      );
      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialFrameWrapper(
            child: BlocProvider<MaterialBundleListBloc>(
              create: (context) => materialBundleListBloc,
              child: const MaterialBundleListPage(),
            ),
          ),
        );
      });

      final noBundle =
          find.image(Image.asset('assets/images/ezrxlogo.png').image);
      expect(noBundle, findsOneWidget);
    });
    testWidgets('Test while data has been fetched', (tester) async {
      when(() => materialBundleListBloc.state).thenReturn(
        MaterialBundleListState.initial().copyWith(
          bundleList: bundleItemsMock,
          nextPageIndex: 1,
          canLoadMore: true,
        ),
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialFrameWrapper(
            child: MultiBlocProvider(
              providers: [
                BlocProvider<UserBloc>(
                  create: (context) => userBlocMock,
                ),
                BlocProvider<SalesOrgBloc>(
                  create: (context) => salesOrgBlocMock,
                ),
                BlocProvider<CustomerCodeBloc>(
                  create: (context) => customerCodeBlocMock,
                ),
                BlocProvider<ShipToCodeBloc>(
                  create: (context) => shipToCodeBLocMock,
                ),
                BlocProvider<MaterialBundleListBloc>(
                  create: (context) => materialBundleListBloc,
                ),
              ],
              child: const MaterialBundleListPage(),
            ),
          ),
        );
      });
      await tester.pump();
      final scrollWidget = find.byWidgetPredicate((w) => w is ScrollList);
      expect(scrollWidget, findsOneWidget);
    });

    testWidgets(
        'Test have material bundle list and emit load more state include',
        (tester) async {
      final bundleInfoList = [
        const BundleInfo(
          sequence: 1,
          quantity: 1,
          type: '%',
          rate: -10,
        ),
        const BundleInfo(
          sequence: 4,
          quantity: 10,
          type: '%',
          rate: -15,
        ),
        const BundleInfo(
          sequence: 7,
          quantity: 15,
          type: '%',
          rate: -20,
        ),
        const BundleInfo(
          sequence: 13,
          quantity: 50,
          type: '%',
          rate: -30,
        ),
        const BundleInfo(
          sequence: 10,
          quantity: 20,
          type: '%',
          rate: -25,
        ),
      ];
      final bundleList = [
        Bundle(
          bundleName: '',
          bundleCode: '0010276811',
          bundleInformation: bundleInfoList,
        ),
        Bundle(
          bundleName: '',
          bundleCode: '0010276812',
          bundleInformation: bundleInfoList,
        ),
        Bundle(
          bundleName: '',
          bundleCode: '0010276813',
          bundleInformation: bundleInfoList,
        ),
        Bundle(
          bundleName: '',
          bundleCode: '0010276814',
          bundleInformation: bundleInfoList,
        ),
        Bundle(
          bundleName: '',
          bundleCode: '0010276815',
          bundleInformation: bundleInfoList,
        ),
      ];
      bundleItemsMock.addAll(bundleList);
      when(() => materialBundleListBloc.state).thenReturn(
        MaterialBundleListState.initial().copyWith(
          bundleList: bundleItemsMock,
          nextPageIndex: 1,
          canLoadMore: true,
          isFetching: true,
        ),
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialFrameWrapper(
            child: MultiBlocProvider(
              providers: [
                BlocProvider<UserBloc>(
                  create: (context) => userBlocMock,
                ),
                BlocProvider<SalesOrgBloc>(
                  create: (context) => salesOrgBlocMock,
                ),
                BlocProvider<CustomerCodeBloc>(
                  create: (context) => customerCodeBlocMock,
                ),
                BlocProvider<ShipToCodeBloc>(
                  create: (context) => shipToCodeBLocMock,
                ),
                BlocProvider<MaterialBundleListBloc>(
                  create: (context) => materialBundleListBloc,
                ),
              ],
              child: const MaterialBundleListPage(),
            ),
          ),
        );
      });

      await tester.pump();
      final noBundleList = find.text('No bundle found');
      final scrollWidget = find.byWidgetPredicate((w) => w is ScrollList);

      final gesture = await tester
          .startGesture(const Offset(50, 100)); //Position of the scrollview
      await gesture.moveBy(const Offset(50, -2000)); //How much to scroll by
      await tester.pump(const Duration(seconds: 2));

      expect(scrollWidget, findsOneWidget);
      expect(noBundleList, findsNothing);
    });

    testWidgets('Test have material bundle list and Refresh', (tester) async {
      when(() => materialBundleListBloc.state).thenReturn(
        MaterialBundleListState.initial().copyWith(
          bundleList: bundleItemsMock,
          nextPageIndex: 1,
          canLoadMore: true,
          isFetching: true,
        ),
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialFrameWrapper(
            child: MultiBlocProvider(
              providers: [
                BlocProvider<UserBloc>(
                  create: (context) => userBlocMock,
                ),
                BlocProvider<SalesOrgBloc>(
                  create: (context) => salesOrgBlocMock,
                ),
                BlocProvider<CustomerCodeBloc>(
                  create: (context) => customerCodeBlocMock,
                ),
                BlocProvider<ShipToCodeBloc>(
                  create: (context) => shipToCodeBLocMock,
                ),
                BlocProvider<MaterialBundleListBloc>(
                  create: (context) => materialBundleListBloc,
                ),
              ],
              child: const MaterialBundleListPage(),
            ),
          ),
        );
      });

      await tester.pump();
      final noBundleList = find.text('No bundle found');
      expect(noBundleList, findsNothing);
      final scrollWidget = find.byWidgetPredicate((w) => w is ScrollList);
      expect(scrollWidget, findsOneWidget);
      await tester.fling(scrollWidget, const Offset(0.0, 300.0), 1000.0);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
    });
    testWidgets('Test fetch fail', (tester) async {
      when(() => materialBundleListBloc.state).thenReturn(
        MaterialBundleListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: none(),
        ),
      );

      final expectedStates = [
        MaterialBundleListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ];

      whenListen(materialBundleListBloc, Stream.fromIterable(expectedStates));

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialFrameWrapper(
            child: Scaffold(
              body: BlocProvider<MaterialBundleListBloc>(
                create: (context) => materialBundleListBloc,
                child: const MaterialBundleListPage(),
              ),
            ),
          ),
        );
      });

      final noSavedOrder = find.text('No bundle found');
      expect(noSavedOrder, findsOneWidget);
      await tester.pump();

      final errorMessage = find.byKey(const Key('snackBarMessage'));

      expect(errorMessage, findsOneWidget);
    });

    testWidgets('Test fetch fail Dynamic', (tester) async {
      when(() => materialBundleListBloc.state).thenReturn(
        MaterialBundleListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: none(),
        ),
      );

      final expectedStates = [
        MaterialBundleListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(
            const Right(
              'No Error',
            ),
          ),
        ),
      ];

      whenListen(materialBundleListBloc, Stream.fromIterable(expectedStates));

      await tester.runAsync(() async {
        await tester.pumpWidget(
          BlocProvider<AuthBloc>(
            create: (context) => authBlocMock,
            child: MaterialFrameWrapper(
              child: Scaffold(
                body: BlocProvider<MaterialBundleListBloc>(
                  create: (context) => materialBundleListBloc,
                  child: const MaterialBundleListPage(),
                ),
              ),
            ),
          ),
        );
      });
      verify(() => authBlocMock.add(const AuthEvent.authCheck()));
    });
  });
}
