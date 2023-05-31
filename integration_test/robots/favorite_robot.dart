import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class FavoriteRobot {
  final WidgetTester tester;

  FavoriteRobot(this.tester);

  void verify() {
    final favorite = find.byKey(const Key('favouritesPage'));
    expect(favorite, findsOneWidget);
  }

  void findFavoriteItem() {
    final item = find.byKey(const Key('FavouriteItem0'));
    expect(item, findsOneWidget);
  }

  void verifyMaterialNumber(String number) {
    final materialNumber = find.text(number);
    expect(materialNumber, findsAtLeastNWidgets(1));
  }

  void verifyUnitPrice(String price) {
    final unitPrice = find.text('Unit Price:$price');
    expect(unitPrice, findsAtLeastNWidgets(1));
  }

  void findFavoriteIcon(String materialNumber) {
    final favoriteIcon =
        find.byKey(Key('deleteFavouriteFavPage$materialNumber'));
    expect(favoriteIcon, findsOneWidget);
  }

  Future<void> tapFavoriteIcon(String materialNumber) async {
    final favoriteIcon =
        find.byKey(Key('deleteFavouriteFavPage$materialNumber'));
    await tester.tap(favoriteIcon);
    await tester.pumpAndSettle();
  }

  Future<void> refreshFavoriteList() async {
    await tester.dragFrom(const Offset(100, 200), const Offset(100, 450));
    await tester.pumpAndSettle();
  }
}
