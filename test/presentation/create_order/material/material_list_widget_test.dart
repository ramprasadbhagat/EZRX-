import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/core/search/search_bloc.dart';
import 'package:ezrxmobile/application/material/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/material/entities/material_info.dart';
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

class AutoRouterMock extends Mock implements AppRouter {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MaterialListBloc materialListBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late SearchBloc searchBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBlocMock;
  late UserBloc userBlocMock;
  late AppRouter autoRouterMock;

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
      autoRouterMock = locator<AppRouter>();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => searchBlocMock.state).thenReturn(SearchState.initial());
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
      final loaderImage = find.byKey(const Key('LaoderImage'));
      expect(loaderImage, findsOneWidget);
    });

    testWidgets('Material List Body Content IsNotEmpty', (tester) async {
      final expectedState = [
        MaterialListState.initial().copyWith(isFetching: true),
        MaterialListState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: false,
          materialList: <MaterialInfo>[
            MaterialInfo(
              materialCode: MaterialCode('000000000023168451'),
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
              materialGroup2: '',
              materialGroup4: 'OTH',
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
          'materialOption${materialListBlocMock.state.materialList.first.materialCode.getOrCrash()}'));
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
  });
}
