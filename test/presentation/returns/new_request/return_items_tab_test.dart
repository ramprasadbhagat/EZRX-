import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class ReturnItemsBlocMock extends MockBloc<ReturnItemsEvent, ReturnItemsState>
    implements ReturnItemsBloc {}

class NewRequestBlocMock extends MockBloc<NewRequestEvent, NewRequestState>
    implements NewRequestBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

final locator = GetIt.instance;
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AppRouter autoRouterMock;
  late ReturnItemsBloc returnItemsBlocMock;
  late NewRequestBloc newRequestBlocMock;
  late ProductImageBloc productImageBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late ReturnMaterialList fakeReturnMaterialList;

  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    returnItemsBlocMock = ReturnItemsBlocMock();
    newRequestBlocMock = NewRequestBlocMock();
    productImageBlocMock = ProductImageBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    fakeReturnMaterialList =
        await ReturnRequestLocalDataSource().searchReturnMaterials();
    when(() => returnItemsBlocMock.state).thenReturn(
      ReturnItemsState.initial(),
    );
    when(() => newRequestBlocMock.state).thenReturn(
      NewRequestState.initial(),
    );
    when(() => productImageBlocMock.state).thenReturn(
      ProductImageState.initial(),
    );
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial(),
    );
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<ReturnItemsBloc>(
          create: (context) => returnItemsBlocMock,
        ),
        BlocProvider<NewRequestBloc>(
          create: (context) => newRequestBlocMock,
        ),
        BlocProvider<ProductImageBloc>(
          create: (context) => productImageBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
      ],
      child: const Material(
        child: ReturnItemsTab(),
      ),
    );
  }

  group('Return Items Tab Test', () {
    testWidgets(
      '=> display outside return policy tag',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSalesOrgConfigAllowReturnsOutsidePolicy,
          ),
        );
        when(() => returnItemsBlocMock.state).thenReturn(
          ReturnItemsState.initial().copyWith(
            items: fakeReturnMaterialList.items,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cardFinder = find.byType(CustomCard);
        expect(cardFinder, findsNWidgets(2));
        expect(
          find.descendant(
            of: cardFinder.first,
            matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: cardFinder.last,
            matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
          ),
          findsNothing,
        );
      },
    );
    testWidgets(
      '=> display outside return policy tag when toggle is off in the sales org config',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeEmptySalesConfigs,
          ),
        );
        when(() => returnItemsBlocMock.state).thenReturn(
          ReturnItemsState.initial().copyWith(
            items: fakeReturnMaterialList.items,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cardFinder = find.byType(CustomCard);
        expect(cardFinder, findsNWidgets(2));
        expect(
          find.descendant(
            of: cardFinder.first,
            matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
          ),
          findsNothing,
        );
        expect(
          find.descendant(
            of: cardFinder.last,
            matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
          ),
          findsNothing,
        );
      },
    );
  });
}
