import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/filter_by_page/filter_by_page.dart';
import 'package:ezrxmobile/presentation/products/product_filter/product_filter_page.dart';
import 'package:ezrxmobile/presentation/products/widgets/enum_material_filter.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class MockMaterialFilterBloc
    extends MockBloc<MaterialFilterEvent, MaterialFilterState>
    implements MaterialFilterBloc {}

class MockMaterialListBloc
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockMixpanelService extends Mock implements MixpanelService {}

final locator = GetIt.instance;

void main() {
  late AppRouter autoRouterMock;
  late MaterialFilterBloc mockMaterialFilterBloc;
  late MaterialListBloc mockMaterialListBloc;
  late EligibilityBloc mockEligibilityBloc;
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerSingleton<MixpanelService>(MockMixpanelService());
    locator.registerLazySingleton(() => AppRouter());
  });
  setUp(() async {
    mockMaterialFilterBloc = MockMaterialFilterBloc();
    mockMaterialListBloc = MockMaterialListBloc();
    mockEligibilityBloc = MockEligibilityBloc();
    autoRouterMock = locator<AppRouter>();
    when(() => mockMaterialFilterBloc.state)
        .thenReturn(MaterialFilterState.initial());
    when(() => mockMaterialListBloc.state)
        .thenReturn(MaterialListState.initial());
    when(() => mockEligibilityBloc.state)
        .thenReturn(EligibilityState.initial());
  });
  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<EligibilityBloc>(
          create: (context) => mockEligibilityBloc,
        ),
        BlocProvider<MaterialFilterBloc>(
          create: (context) => mockMaterialFilterBloc,
        ),
        BlocProvider<MaterialListBloc>(
          create: (context) => mockMaterialListBloc,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => mockEligibilityBloc,
        ),
      ],
      child: const Scaffold(
        body: ProductFilterPage(),
      ),
    );
  }

  group(
    'Product Filter Page',
    () {
      testWidgets(
        'Test App bar display',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.text('Filter & Sort'.tr()), findsOneWidget);
          final backButton =
              find.widgetWithIcon(IconButton, Icons.close_outlined);
          expect(backButton, findsOneWidget);
        },
      );

      testWidgets(
        'Test Product Filter By Type Options',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.text('Show product'.tr()), findsOneWidget);
          final favoriteTileFinder =
              find.byKey(WidgetKeys.showProductCheckbox('Favourites'));
          expect(
            favoriteTileFinder,
            findsOneWidget,
          );
          await tester.tap(favoriteTileFinder);
          verify(
            () => mockMaterialFilterBloc.add(
              const MaterialFilterEvent.updateSelectedMaterialFilter(
                MaterialFilterType.isFavourite,
                true,
              ),
            ),
          ).called(1);
          final itemOffersTileFinder =
              find.byKey(WidgetKeys.showProductCheckbox('Items with offers'));
          expect(
            itemOffersTileFinder,
            findsOneWidget,
          );
          await tester.tap(itemOffersTileFinder);
          verify(
            () => mockMaterialFilterBloc.add(
              const MaterialFilterEvent.updateSelectedMaterialFilter(
                MaterialFilterType.productOffers,
                true,
              ),
            ),
          ).called(1);
          final bundleOffersTileFinder =
              find.byKey(WidgetKeys.showProductCheckbox('Bundle offers'));
          expect(
            bundleOffersTileFinder,
            findsOneWidget,
          );
          await tester.tap(bundleOffersTileFinder);
          verify(
            () => mockMaterialFilterBloc.add(
              const MaterialFilterEvent.updateSelectedMaterialFilter(
                MaterialFilterType.bundleOffers,
                true,
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Test Product Sort Options',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.text('Sort by'.tr()), findsOneWidget);
          expect(
            find.byKey(WidgetKeys.sortByRadio('A-Z')),
            findsOneWidget,
          );
          final zARadioTile = find.byKey(WidgetKeys.sortByRadio('Z-A'));
          expect(
            zARadioTile,
            findsOneWidget,
          );
          await tester.tap(zARadioTile);
          verify(
            () => mockMaterialFilterBloc.add(
              const MaterialFilterEvent.updateSelectedMaterialFilter(
                MaterialFilterType.sortBy,
                Sort.za,
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Product Filter By Category Options is not visible when options list is empty',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.text('Filter by'.tr()), findsNothing);

          expect(
            find.widgetWithText(InkWell, 'Country of origin'.tr()),
            findsNothing,
          );

          expect(
            find.widgetWithText(InkWell, 'Manufacturer'.tr()),
            findsNothing,
          );
        },
      );

      testWidgets(
        'Filter by country of origin option is visible if country list is not empty',
        (tester) async {
          when(() => mockMaterialFilterBloc.state).thenReturn(
            MaterialFilterState.initial().copyWith.materialFilter(
              countryMapOptions: {
                MaterialFilterCountry.empty().copyWith(name: 'fake-name'): true
              },
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.text('Filter by'.tr()), findsOneWidget);
          final countryOfOriginFilter =
              find.widgetWithText(InkWell, 'Country of origin'.tr());
          await tester.dragUntilVisible(
            countryOfOriginFilter,
            find.byType(ListView),
            const Offset(0, -300),
          );
          expect(countryOfOriginFilter, findsOneWidget);
          await tester.pump();
          await tester.tap(countryOfOriginFilter);
          await tester.pumpAndSettle();
          expect(find.byType(FilterByPage), findsOneWidget);
          await tester.tap(find.byKey(WidgetKeys.backButton));
          await tester.pumpAndSettle();
          verify(
            () => mockMaterialFilterBloc.add(
              const MaterialFilterEvent.updateSearchKey(''),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Filter by manufacturer option is visible if manufacturer list is not empty',
        (tester) async {
          final manufactureList = ['BAXTER HEALTHCARE -M', 'AMO IRELAND'];
          when(() => mockMaterialFilterBloc.state).thenReturn(
            MaterialFilterState.initial().copyWith.materialFilter(
              manufactureMapOptions: {for (var e in manufactureList) e: false},
            ),
          );
          final expectedState = [
            MaterialFilterState.initial().copyWith.materialFilter(
              manufactureMapOptions: {for (var e in manufactureList) e: true},
            ),
          ];
          whenListen(
            mockMaterialFilterBloc,
            Stream.fromIterable(expectedState),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.text('Filter by'.tr()), findsOneWidget);
          final manufacturerLabel = find.text('Manufacturer'.tr());
          await tester.tap(manufacturerLabel);
          await tester.pumpAndSettle();
          await tester.tap(find.byKey(WidgetKeys.suggestedManufacturer).first);
          verify(
            () => mockMaterialFilterBloc.add(
              MaterialFilterEvent.updateSelectedMaterialFilter(
                MaterialFilterType.manufactured,
                manufactureList.first,
              ),
            ),
          ).called(1);
          await tester.pumpAndSettle();
          await tester.tap(find.byKey(WidgetKeys.suggestedManufacturer).last);
          verify(
            () => mockMaterialFilterBloc.add(
              MaterialFilterEvent.updateSelectedMaterialFilter(
                MaterialFilterType.manufactured,
                manufactureList.last,
              ),
            ),
          ).called(1);
          expect(
            find.byKey(WidgetKeys.suggestedManufacturer),
            findsNWidgets(2),
          );
          await tester.pumpAndSettle();
          expect(find.byType(ChoiceChip), findsNWidgets(2));
        },
      );

      testWidgets(
        'Manufacturer filter is selected',
        (tester) async {
          const fakeManufacturer = 'fake-manufacturer';
          final fakeState =
              MaterialFilterState.initial().copyWith.materialFilter(
            manufactureMapOptions: {fakeManufacturer: true},
            manufactureListSelected: [fakeManufacturer],
          );
          whenListen(
            mockMaterialFilterBloc,
            Stream.fromIterable([MaterialFilterState.initial(), fakeState]),
          );
          when(() => mockMaterialFilterBloc.state).thenReturn(fakeState);

          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();

          expect(
            find.byKey(WidgetKeys.manufactureListSelectedLength),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Country of origin filter is selected',
        (tester) async {
          final fakeCountry =
              MaterialFilterCountry.empty().copyWith(name: 'fake-name');
          final fakeState =
              MaterialFilterState.initial().copyWith.materialFilter(
            countryMapOptions: {fakeCountry: true},
            countryListSelected: [fakeCountry],
          );
          whenListen(
            mockMaterialFilterBloc,
            Stream.fromIterable([MaterialFilterState.initial(), fakeState]),
          );
          when(() => mockMaterialFilterBloc.state).thenReturn(fakeState);

          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();

          expect(
            find.byKey(WidgetKeys.countryListSelectedLength),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Test Product Filter Reset Button',
        (tester) async {
          when(() => mockMaterialListBloc.state).thenReturn(
            MaterialListState.initial().copyWith(
              selectedMaterialFilter: MaterialFilter.empty().copyWith(
                bundleOffers: true,
              ),
            ),
          );
          when(() => mockMaterialFilterBloc.state).thenReturn(
            MaterialFilterState.initial(),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final resetButtonFinder = find.byKey(WidgetKeys.filterResetButton);
          await tester.tap(resetButtonFinder);
          verify(
            () => mockMaterialFilterBloc.add(
              const MaterialFilterEvent.resetFilter(),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Test Product Filter Apply Button',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final applyButtonFinder = find.byKey(WidgetKeys.filterApplyButton);
          await tester.tap(applyButtonFinder);
        },
      );

      testWidgets(
          'Sub options in Item with offer options is not visible in ID market',
          (tester) async {
        when(() => mockEligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(find.text('Show product'.tr()), findsOneWidget);
        expect(
          find.byKey(WidgetKeys.showProductCheckbox('Favourites')),
          findsOneWidget,
        );
        expect(
          find.byKey(WidgetKeys.showProductCheckbox('Items with offers')),
          findsNothing,
        );
        expect(
          find.byKey(WidgetKeys.showProductCheckbox('Bundle offers')),
          findsNothing,
        );
        expect(
          find.byKey(WidgetKeys.showProductCheckbox('Combo offers')),
          findsNothing,
        );
      });
    },
  );
}
