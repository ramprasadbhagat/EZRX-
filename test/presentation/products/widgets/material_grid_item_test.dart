import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/product_price_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/covid_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/material_grid_item.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_label.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  late ProductImageBlocMock productImageBlocMock;
  late MaterialPriceBlocMock materialPriceBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late AppRouter autoRouterMock;
  late MaterialInfo materialInfoMock;
  setUpAll(() async {
    locator.registerFactory(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    materialInfoMock =
        (await MaterialListLocalDataSource().getProductList()).products.first;
  });

  group('Test "Material Grid Item"', () {
    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      locator = GetIt.instance;
      productImageBlocMock = ProductImageBlocMock();
      materialPriceBlocMock = MaterialPriceBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      when(() => productImageBlocMock.state)
          .thenReturn(ProductImageState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
    });

    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<ProductImageBloc>(
            create: (context) => productImageBlocMock,
          ),
          BlocProvider<MaterialPriceBloc>(
            create: (context) => materialPriceBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: Material(
          child: MaterialGridItem(
            materialInfo: materialInfoMock,
            onFavouriteTap: () {},
            onTap: () {},
          ),
        ),
      );
    }

    testWidgets(
      '=> Test display',
      (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.byType(ProductImage), findsOneWidget);
          expect(find.byType(OfferLabel), findsOneWidget);
          expect(find.byType(StockLabel), findsOneWidget);
          expect(find.byType(CovidLabel), findsOneWidget);
          expect(find.byType(FavouriteIcon), findsOneWidget);
          expect(
            find.text(materialInfoMock.materialNumber.displayMatNo),
            findsOneWidget,
          );
          expect(
            find.text(materialInfoMock.displayDescription),
            findsOneWidget,
          );
          expect(find.text(materialInfoMock.getManufactured), findsOneWidget);
          expect(find.byType(ProductPriceLabel), findsOneWidget);
        });
      },
    );
  });
}
