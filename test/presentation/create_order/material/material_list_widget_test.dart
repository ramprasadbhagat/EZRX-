import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/core/search/search_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/material/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/material/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/material/entities/material_info.dart';
import 'package:ezrxmobile/domain/material/entities/price.dart';
import 'package:ezrxmobile/domain/material/entities/principal_data.dart';
import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/create_order/material_list.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class SearchMockBloc extends MockBloc<SearchEvent, SearchState>
    implements SearchBloc {}

class CustomerCodeMockBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeMockBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MaterialMockBloc extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class MockFavouriteBloc extends MockBloc<FavouriteEvent, FavouriteState>
    implements FavouriteBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MaterialListBloc materialListBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late SearchBloc searchBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBlocMock;
  late UserBloc userBlocMock;
  late AppRouter autoRouterMock;
  late MockFavouriteBloc mockFavouriteBloc;
  late MaterialPriceBloc materialPriceBlocMock;

  final fakeMaterialNumber = MaterialNumber('000000000023168451');

  setUpAll(() async {
    setupLocator();
  });

  group('Material List Test', () {
    setUp(() {
      materialListBlocMock = MaterialMockBloc();
      salesOrgBlocMock = SalesOrgMockBloc();
      searchBlocMock = SearchMockBloc();
      customerCodeBlocMock = CustomerCodeMockBloc();
      shipToCodeBlocMock = ShipToCodeMockBloc();
      userBlocMock = UserMockBloc();
      mockFavouriteBloc = MockFavouriteBloc();
      materialPriceBlocMock = MaterialPriceBlocMock();
      autoRouterMock = locator<AppRouter>();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => searchBlocMock.state).thenReturn(SearchState.initial());
      when(() => mockFavouriteBloc.state).thenReturn(FavouriteState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
    });

    Widget getScopedWidget(Widget child) {
      return EasyLocalization(
        supportedLocales: const [
          Locale('en', 'SG'),
        ],
        path: 'assets/langs/langs.csv',
        startLocale: const Locale('en', 'SG'),
        fallbackLocale: const Locale('en', 'SG'),
        saveLocale: true,
        useOnlyLangCode: false,
        assetLoader: CsvAssetLoader(),
        child: WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<UserBloc>(create: ((context) => userBlocMock)),
            BlocProvider<SalesOrgBloc>(create: ((context) => salesOrgBlocMock)),
            BlocProvider<CustomerCodeBloc>(
                create: ((context) => customerCodeBlocMock)),
            BlocProvider<ShipToCodeBloc>(
                create: ((context) => shipToCodeBlocMock)),
            BlocProvider<SearchBloc>(create: ((context) => searchBlocMock)),
            BlocProvider<MaterialListBloc>(
                create: ((context) => materialListBlocMock)),
            BlocProvider<FavouriteBloc>(
                create: ((context) => mockFavouriteBloc)),
            BlocProvider<MaterialPriceBloc>(
                create: ((context) => materialPriceBlocMock)),
          ],
          child: child,
        ),
      );
    }

    testWidgets('Matrials List Page Initialized', (tester) async {
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      await tester.pumpWidget(getScopedWidget(const MaterialListPage()));
      final materialsListPage = find.byKey(const Key('materialListPage'));
      final searchButton = find.byKey(const Key('CartButton'));
      expect(materialsListPage, findsOneWidget);
      expect(searchButton, findsOneWidget);
      await tester.tap(searchButton);
      await tester.pump();
    });

    testWidgets('Material List Failed To Load', (tester) async {
      final expectedState = [
        MaterialListState.initial().copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-error'))),
        )
      ];
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      whenListen(materialListBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getScopedWidget(const MaterialListPage()));
    });

    testWidgets('Material List Body Content Empty', (tester) async {
      final expectedState = [
        MaterialListState.initial().copyWith(
          isFetching: true,
        ),
        MaterialListState.initial().copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
          materialList: <MaterialInfo>[],
        )
      ];
      // optionOf(const Right(<MaterialInfo>[])),
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      await tester.pumpWidget(getScopedWidget(const MaterialListPage()));
      whenListen(materialListBlocMock, Stream.fromIterable(expectedState));
      final loaderImage = find.byKey(const Key('loaderImage'));
      expect(loaderImage, findsOneWidget);
    });

    testWidgets('Material List Body Content IsNotEmpty', (tester) async {
      final expectedState = [
        MaterialListState.initial().copyWith(isFetching: true),
        MaterialListState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: false,
          nextPageIndex: 2,
          materialList: <MaterialInfo>[
            MaterialInfo(
              materialNumber: fakeMaterialNumber,
              materialDescription: "Reag Cup 15ml 1'S",
              governmentMaterialCode: '',
              therapeuticClass: 'All other non-therapeutic products',
              itemBrand: 'Item not listed in I',
              principalData: const PrincipalData(
                principalName: '台灣羅氏醫療診斷設備(股)公司',
                principalCode: '0000102004',
              ),
              taxClassification: 'Product : Full Tax',
              itemRegistrationNumber: 'NA',
              unitOfMeasurement: 'EA',
              materialGroup2: MaterialGroup.two(''),
              materialGroup4: MaterialGroup.four('OTH'),
              isSampleMaterial: false,
              hidePrice: false,
              hasValidTenderContract: false,
              hasMandatoryTenderContract: false,
              taxes: ['5'],
            )
          ],
        )
      ];
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      whenListen(materialListBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getScopedWidget(const MaterialListPage()));
      await tester.pump();
      final materialList = find.byKey(const Key('scrollList'));
      expect(materialList, findsOneWidget);
      await tester.drag(materialList, const Offset(0.0, -300));
      await tester.pump();
      final listcontent = find.byKey(Key(
          'materialOption${materialListBlocMock.state.materialList.first.materialNumber.getOrCrash()}'));
      expect(listcontent, findsOneWidget);
    });

    testWidgets('Scroll List isEmpty', (tester) async {
      final expectedState = [
        MaterialListState.initial().copyWith(isFetching: true),
        MaterialListState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: false,
          materialList: <MaterialInfo>[],
        )
      ];
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      whenListen(materialListBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getScopedWidget(const MaterialListPage()));
      await tester.pump();
      final materialList = find.byKey(const Key('scrollList'));
      expect(materialList, findsOneWidget);
      final noRecordFound = find.text('No material found');
      expect(noRecordFound, findsOneWidget);
    });

    testWidgets('Start to fetch price', (tester) async {
      final fakeMaterial = MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('fake-number'),
      );
      final fakeCustomerCodeInfo =
          CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: 'fake-code');
      final fakeSalesOrg = SalesOrganisation.empty().copyWith(
        salesOrg: SalesOrg('fake-name'),
      );
      final expectedState = [
        MaterialListState.initial().copyWith(
          nextPageIndex: 2,
          materialList: [fakeMaterial],
        )
      ];
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial(),
      );
      whenListen(
        materialListBlocMock,
        Stream.fromIterable(expectedState),
      );
      when(() => customerCodeBlocMock.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          customeCodeInfo: fakeCustomerCodeInfo,
        ),
      );
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          salesOrganisation: fakeSalesOrg,
        ),
      );
      await tester.pumpWidget(
        getScopedWidget(
          const MaterialListPage(),
        ),
      );
      await tester.pump();

      expect(customerCodeBlocMock.state.customeCodeInfo, fakeCustomerCodeInfo);
      expect(salesOrgBlocMock.state.salesOrganisation, fakeSalesOrg);

      verify(() => materialPriceBlocMock.add(MaterialPriceEvent.fetch(
          customerCode: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrg,
          materialNumbers: [MaterialNumber('fake-number')]))).called(1);
    });

    testWidgets('Material List show price properly', (tester) async {
      final expectedState = [
        MaterialListState.initial().copyWith(isFetching: true),
        MaterialListState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: false,
          nextPageIndex: 2,
          materialList: <MaterialInfo>[
            MaterialInfo.empty().copyWith(materialNumber: fakeMaterialNumber)
          ],
        )
      ];
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      whenListen(materialListBlocMock, Stream.fromIterable(expectedState));
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          isFetching: false,
          materialPrice: {
            fakeMaterialNumber: Price.empty().copyWith(
              finalPrice: MaterialPrice(10),
            )
          },
        ),
      );
      await tester.pumpWidget(getScopedWidget(const MaterialListPage()));
      await tester.pump();
      final materialList = find.byKey(const Key('scrollList'));
      expect(materialList, findsOneWidget);
      await tester.drag(materialList, const Offset(0.0, -300));
      await tester.pump();
      final listContent = find.byKey(Key(
          'materialOption${materialListBlocMock.state.materialList.first.materialNumber.getOrCrash()}'));
      expect(listContent, findsOneWidget);
      await tester.pump();
      final price = find.text('${'Unit Price: '.tr()}\$10');
      expect(price, findsOneWidget);
    });

    testWidgets('Material List show loading price', (tester) async {
      final expectedState = [
        MaterialListState.initial().copyWith(isFetching: true),
        MaterialListState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: false,
          nextPageIndex: 2,
          materialList: <MaterialInfo>[
            MaterialInfo.empty().copyWith(materialNumber: fakeMaterialNumber)
          ],
        )
      ];
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      whenListen(materialListBlocMock, Stream.fromIterable(expectedState));
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          isFetching: true,
        ),
      );
      await tester.pumpWidget(getScopedWidget(const MaterialListPage()));
      await tester.pump();
      final materialList = find.byKey(const Key('scrollList'));
      expect(materialList, findsOneWidget);
      await tester.drag(materialList, const Offset(0.0, -300));
      await tester.pump();
      final listContent = find.byKey(Key(
          'materialOption${materialListBlocMock.state.materialList.first.materialNumber.getOrCrash()}'));
      expect(listContent, findsOneWidget);
      await tester.pump();
      final loadingIndicator = find.byKey(const Key('price-loading'));
      expect(loadingIndicator, findsOneWidget);

      await tester.fling(listContent, const Offset(0, 300), 600);
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
      verify(() =>
              materialPriceBlocMock.add(const MaterialPriceEvent.initialized()))
          .called(1);
    });
  });
}
