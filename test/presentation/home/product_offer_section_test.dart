import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/home/product_offer_section.dart/product_offer_section.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

void main() {
  late GetIt locator;
  late EligibilityBloc eligibilityBlocMock;
  late MaterialListBloc materialListBlocMock;

  late AppRouter autoRouterMock;

  setUpAll(() async {
    locator = GetIt.instance;
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => eligibilityBlocMock);
    locator.registerLazySingleton(() => materialListBlocMock);
    autoRouterMock = locator<AppRouter>();
    eligibilityBlocMock = EligibilityBlocMock();
    materialListBlocMock = MaterialListBlocMock();
  });

  group('ProductsOnOffer Screen', () {
    setUp(() {
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
    });
    RouteDataScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<MaterialListBloc>(
            create: (context) => materialListBlocMock,
          ),
        ],
        child: const Scaffold(body: ProductsOnOffer()),
      );
    }

    testWidgets('ProductsOnOffer test - click ProductOnOffer', (tester) async {
      final materialListBloc = locator<MaterialListBloc>();
      final materialExpectState = [
        MaterialListState.initial().copyWith(
          materialCount: 2,
          materialList: <MaterialInfo>[
            MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('bundle-material-1'),
            ),
            MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('bundle-material-2'),
            ),
          ],
          canLoadMore: true,
          isFetching: false,
        ),
      ];
      whenListen(
        materialListBlocMock,
        Stream.fromIterable(materialExpectState),
      );
      await tester.pumpWidget(getWUT());

      verify(
        () => materialListBloc.add(
          MaterialListEvent.fetch(
            salesOrganisation: SalesOrganisation.empty(),
            configs: eligibilityBlocMock.state.salesOrgConfigs,
            customerCodeInfo: CustomerCodeInfo.empty(),
            shipToInfo: ShipToInfo.empty(),
            selectedMaterialFilter: MaterialFilter.empty().copyWith(
              bundleOffers: false,
              isProductOffer: true,
            ),
          ),
        ),
      ).called(1);
    });
    testWidgets('ProductsOnOffer test - when Salesorg  changed - Success',
        (tester) async {
      final materialListBloc = locator<MaterialListBloc>();
      final expectedState = [
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty()
              .copyWith(salesOrg: SalesOrg('2100')),
        ),
        EligibilityState.initial(),
      ];
      whenListen(
        eligibilityBlocMock,
        Stream.fromIterable(expectedState),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump(const Duration(seconds: 2));
      verify(
        () => materialListBloc.add(
          MaterialListEvent.fetch(
            salesOrganisation: SalesOrganisation.empty(),
            configs: eligibilityBlocMock.state.salesOrgConfigs,
            customerCodeInfo: CustomerCodeInfo.empty(),
            shipToInfo: ShipToInfo.empty(),
            selectedMaterialFilter: MaterialFilter.empty(),
          ),
        ),
      ).called(1);
    });
  });
}
