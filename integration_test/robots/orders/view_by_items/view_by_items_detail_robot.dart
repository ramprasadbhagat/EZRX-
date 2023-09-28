import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/item_details_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/view_by_item_details_header_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/view_by_other_item_details_section.dart';
import 'package:flutter_test/flutter_test.dart';

class ViewByItemsDetailRobot {
  final WidgetTester tester;

  ViewByItemsDetailRobot(this.tester);

  final scrollView = find.byKey(WidgetKeys.viewByItemsOrderDetailPage);
  final headerSection = find.byType(ViewByItemDetailsHeaderSection);
  final statusTrackerSection = find.byType(StatusTrackerSection);
  final addressSection = find.byType(AddressInfoSection);
  final itemDetailSection = find.byType(ItemDetailsSection);
  final otherItemDetailSection = find.byType(OtherItemDetailsSection);

  Future<void> dragToEnsureHeaderVisible() async {
    await tester.dragUntilVisible(
      headerSection,
      scrollView,
      const Offset(0.0, -200),
    );
    expect(
      find.byKey(WidgetKeys.viewByItemsOrderDetailOrderCode),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.viewByItemsOrderDetailOrderDate),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.viewByItemsOrderDetailInvoiceNumber),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.viewByItemsOrderDetailPoReference),
      findsOneWidget,
    );
  }

  Future<void> dragToEnsureStatusTrackerVisible() async {
    await tester.dragUntilVisible(
      statusTrackerSection,
      scrollView,
      const Offset(0.0, -200),
    );
    expect(statusTrackerSection, findsOneWidget);
  }

  Future<void> dragToEnsureAddressVisible() async {
    await tester.dragUntilVisible(
      addressSection,
      scrollView,
      const Offset(0.0, -200),
    );
    expect(
      find.byKey(WidgetKeys.addressInfoSectionActionLabel),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.addressInfoSectionCustomerCodeLabel),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.addressInfoSectionDeliveryToLabel),
      findsOneWidget,
    );
  }

  Future<void> dragToEnsureItemsVisible() async {
    await tester.dragUntilVisible(
      itemDetailSection,
      scrollView,
      const Offset(0.0, -200),
    );
    await tester.dragUntilVisible(
      otherItemDetailSection,
      scrollView,
      const Offset(0.0, -200),
    );
    expect(
      find.byKey(WidgetKeys.commonTileItemTitle),
      findsAtLeastNWidgets(1),
    );

    expect(
      find.byKey(WidgetKeys.commonTileItemLabel),
      findsAtLeastNWidgets(1),
    );

    expect(
      find.byType(ProductImage),
      findsAtLeastNWidgets(1),
    );

    expect(
      find.byKey(WidgetKeys.orderItemStatusKey),
      findsAtLeastNWidgets(1),
    );

    expect(
      find.byKey(WidgetKeys.commonTileItemQty),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyBonusLabelVisible() {
    expect(
      find.byKey(WidgetKeys.commonTileItemStatusLabel),
      findsAtLeastNWidgets(1),
    );
  }
}
