import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_offer_bonus_item.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/widget_utils.dart';

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  late AppRouter autoRouterMock;
  late CartBloc cartBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  final fakeMaterialItemBonus = MaterialItemBonus.empty().copyWith(
    qty: 1,
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('fake-number'),
      materialDescription: 'fake-description',
    ),
  );

  setUpAll(() async {
    locator.registerFactory(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    cartBlocMock = CartBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => cartBlocMock.state).thenReturn(
      CartState.initial(),
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
        BlocProvider<CartBloc>(
          create: (context) => cartBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
      ],
      child: Material(
        child: CheckoutOfferBonusItem(
          bonusItem: fakeMaterialItemBonus,
        ),
      ),
    );
  }

  group('CheckoutOfferBonusItem Test ', () {
    testWidgets('_QuantityAndPrice Test', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final quantityAndPriceFinder = find.byKey(WidgetKeys.quantityAndPrice);
      final freeTextFinder = find.descendant(
        of: quantityAndPriceFinder,
        matching: find.text(
          'FREE'.tr(),
        ),
      );
      expect(freeTextFinder, findsOneWidget);
      final qtyTextFinder = find.descendant(
        of: quantityAndPriceFinder,
        matching: find.text(
          '${'Qty:'.tr()} ${fakeMaterialItemBonus.qty.toString()}',
        ),
      );
      expect(qtyTextFinder, findsOneWidget);
    });

    testWidgets('_ProductImageSection Test', (tester) async {
      final states = [
        CartState.initial().copyWith(
          additionInfo: <MaterialNumber, ProductMetaData>{
            MaterialNumber('fake-number'): ProductMetaData.empty(),
          },
        ),
      ];
      whenListen(cartBlocMock, Stream.fromIterable(states));
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final productImageSectionFinder =
          find.byKey(WidgetKeys.productImageSection);
      final freeTextFinder = find.descendant(
        of: productImageSectionFinder,
        matching: find.byType(CustomCard),
      );
      expect(freeTextFinder, findsOneWidget);
      final qtyTextFinder = find.descendant(
        of: productImageSectionFinder,
        matching: find.byType(CustomImage),
      );
      expect(qtyTextFinder, findsOneWidget);
    });

    testWidgets('_ProductDetails Test', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final productDetailsFinder = find.byKey(WidgetKeys.bonusProductDetail);
      final materialNumberFinder = find.descendant(
        of: productDetailsFinder,
        matching: find.text(
          fakeMaterialItemBonus.materialNumber.displayMatNo,
        ),
      );
      expect(materialNumberFinder, findsOneWidget);
      final bonusTagFinder = find.descendant(
        of: productDetailsFinder,
        matching: find.byType(BonusTag),
      );
      expect(bonusTagFinder, findsOneWidget);
      final materialDescriptionFinder = find.descendant(
        of: productDetailsFinder,
        matching: find.text(
          fakeMaterialItemBonus.materialDescription,
        ),
      );
      expect(materialDescriptionFinder, findsOneWidget);
      final freeTextFinder = find.descendant(
        of: productDetailsFinder,
        matching: find.text(
          'FREE'.tr(),
        ),
      );
      expect(freeTextFinder, findsOneWidget);
    });
  });
}
