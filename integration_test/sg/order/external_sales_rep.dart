import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/app.dart';
import 'package:ezrxmobile/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../../core/integration_test_helper.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('end-to-end test', () {
    testWidgets('External Sales Rep SG regression Test',
        (WidgetTester tester) async {
      Future<void> orderSummaryTest() async {
        final orderSummaryPage = find.byKey(const Key('orderSummaryKey'));
        expect(orderSummaryPage, findsOneWidget);

        var stepperIndex = -1;
        final customerDetailsStepper =
            find.byKey(const Key('_CustomerDetailsStepperKey'));
        expect(customerDetailsStepper, findsOneWidget);

        expect(find.text('Customer Name'), findsOneWidget);
        expect(find.text('Customer Email'), findsOneWidget);
        expect(find.text('Customer ship to ID'), findsOneWidget);
        expect(find.text('Customer sold to ID'), findsOneWidget);
        expect(find.text('Customer Classification'), findsOneWidget);
        expect(find.text('Customer Local Group'), findsOneWidget);
        expect(find.text('Payment Term Description'), findsOneWidget);

        final continueStep = find.byKey(const Key('continueButtonKey'));
        expect(continueStep, findsWidgets);
        await tester.tap(continueStep.at(++stepperIndex));
        await tester.pump(const Duration(seconds: 2));

        final soldToAddressStepper =
            find.byKey(const Key('soldToAddressStepperKey'));
        expect(soldToAddressStepper, findsOneWidget);

        expect(find.text('Sold to ID'.tr()), findsOneWidget);
        expect(find.text('Sold to Customer Name'.tr()), findsOneWidget);
        expect(find.text('Address'.tr()), findsWidgets);
        expect(find.text('Postal Code'.tr()), findsWidgets);
        expect(find.text('Country'.tr()), findsWidgets);
        expect(find.text('Phone'.tr()), findsWidgets);

        await tester.tap(continueStep.at(++stepperIndex));
        await tester.pump(const Duration(seconds: 2));

        final stepBack = find.byKey(const Key('stepBack'));
        expect(stepBack, findsWidgets);
        await tester.tap(stepBack.at(stepperIndex + 1));
        await tester.pump(const Duration(seconds: 2));

        expect(soldToAddressStepper, findsOneWidget);
        expect(continueStep, findsWidgets);
        await tester.tap(continueStep.at(stepperIndex));
        await tester.pump(const Duration(seconds: 2));

        final shipToAddressInfoStepper =
            find.byKey(const Key('shipToAddressInfoStepperKey'));
        expect(shipToAddressInfoStepper, findsOneWidget);

        expect(find.text('Ship to ID'.tr()), findsOneWidget);
        expect(find.text('Address'.tr()), findsWidgets);
        expect(find.text('Postal Code'.tr()), findsWidgets);
        expect(find.text('Country'.tr()), findsWidgets);
        expect(find.text('Phone'.tr()), findsWidgets);
        expect(find.text('License'.tr()), findsOneWidget);

        final shipToAddressInfoLicense =
            find.byKey(const Key('shipToAddressInfo_license'));
        expect(shipToAddressInfoLicense, findsOneWidget);
        await tester.tap(shipToAddressInfoLicense);
        await tester.pump(const Duration(seconds: 2));

        expect(find.byKey(const Key('licenseDetails')), findsOneWidget);

        final licenseDetails = find.text('License Description'.tr());
        if (licenseDetails.evaluate().isNotEmpty) {
          expect(licenseDetails, findsWidgets);
          await tester.dragUntilVisible(
              licenseDetails.last, licenseDetails.first, const Offset(0, -800));
          await tester.pump(const Duration(seconds: 5));
        }
        await tester.tapAt(const Offset(100, 100));
        await tester.pump(const Duration(seconds: 5));

        await tester.tap(continueStep.at(++stepperIndex));
        await tester.pump(const Duration(seconds: 2));

        // //disable Bill To Information
        // final billToCustomer = find.byKey(const Key('billToCustomer'));
        // expect(billToCustomer, findsNothing);

        final additionalDetailsStepper =
            find.byKey(const Key('additionalDetailsFormKey'));
        expect(additionalDetailsStepper, findsOneWidget);

        // //disable po reference
        // final customerPOReferenceKey =
        //     find.byKey(const Key('customerPOReferenceKey'));
        // expect(customerPOReferenceKey, findsNothing);

        //enable special Instruction
        final specialInstructionKey =
            find.byKey(const Key('specialInstructionKey'));
        expect(specialInstructionKey, findsOneWidget);
        await tester.enterText(specialInstructionKey, 'special instruction');
        await tester.pump(const Duration(seconds: 2));

        // //disable reference Note
        // final referenceNoteKey = find.byKey(const Key('referenceNoteKey'));
        // expect(referenceNoteKey, findsNothing);

        // //disable collective Number
        // expect(find.byKey(const Key('collectiveNumberKey')), findsNothing);

        // //disable contact person or enable mobile number
        // final contactPersonKey = find.byKey(const Key('contactPersonKey'));
        // expect(contactPersonKey, findsNothing);
        // //disable contact person or enable mobile number
        // final contactNumberKey = find.byKey(const Key('contactNumberKey'));
        // expect(contactNumberKey, findsNothing);

        // //disable requsted delivery date
        // final requestedDeliveryDate =
        //     find.byKey(const Key('requestedDeliveryDate'));
        // expect(requestedDeliveryDate, findsNothing);

        // //disable payment term
        // final paymentTermTextKey = find.byKey(const Key('_paymentTermTextKey'));
        // expect(paymentTermTextKey, findsNothing);

        // //disable green delivery check
        // final greenDeliveryText = find.text('Green Delivery'.tr());
        // expect(greenDeliveryText, findsNothing);

        // //disable PO Attachment
        // expect(find.byKey(const Key('poAttachmentUploadButton')), findsNothing);

        await tester.tap(continueStep.at(3));
        await tester.pump(const Duration(seconds: 2));

        final cartDetailsKey = find.byKey(const Key('_cartDetailsKey'));
        expect(cartDetailsKey, findsOneWidget);

        //find minimum order amount allowed
        expect(find.byKey(const Key('minimumOrderAmount')), findsOneWidget);
        expect(find.textContaining('100'), findsWidgets);

        await tester.dragFrom(const Offset(100, 600), const Offset(100, -800));
        await tester.pump(const Duration(seconds: 5));
        await tester.dragFrom(const Offset(100, 600), const Offset(100, -800));
        await tester.pump(const Duration(seconds: 5));
      }

      await initialSetup(flavor: Flavor.uat);

      runAppWithCrashlyticsAndLocalization();
      final intergrationTestHelper =
          IntergrationTestHelper(tester: tester);
      await tester.pump();
      await tester.pump(const Duration(seconds: 5));

      final announcementCloseIcon =
          find.byKey(const Key('announcementCloseIcon'));

      if (announcementCloseIcon.evaluate().isNotEmpty) {
        expect(announcementCloseIcon, findsOneWidget);
        await tester.pump(const Duration(milliseconds: 100));
        await tester.tap(announcementCloseIcon);
        await tester.pump(const Duration(seconds: 2));
      }

      //============================================================
      //  Login Test
      //
      //============================================================
      await intergrationTestHelper.loginTest(
          username: 'ezrxtest05', password: 'St@ysafe03');

      //check login on behalf (should not appear)
      final accountTabbar = find.byKey(const Key('accountTabbar'));
      expect(accountTabbar, findsOneWidget);
      await tester.tap(accountTabbar);
      await tester.pump(const Duration(seconds: 3));

      final loginOnBehalfTile = find.byKey(const Key('loginOnBehalfTile'));
      expect(loginOnBehalfTile, findsOneWidget);
      await tester.tap(loginOnBehalfTile);
      await tester.pump(const Duration(seconds: 3));

      expect(find.byKey(const Key('loginOnBehalfPage')), findsOneWidget);

      final proxyLoginUsernameField =
          find.byKey(const Key('proxyLoginUsernameField'));
      expect(proxyLoginUsernameField, findsOneWidget);
      await tester.enterText(proxyLoginUsernameField, 'zpsgezrx');
      await tester.pump(const Duration(seconds: 3));

      final proxyLoginSubmitButton =
          find.byKey(const Key('proxyLoginSubmitButton'));
      expect(proxyLoginSubmitButton, findsOneWidget);
      await tester.tap(proxyLoginSubmitButton);

      await tester.pumpAndSettle(const Duration(seconds: 12));

      expect(find.byKey(const Key('profileTile')), findsOneWidget);
      expect(find.textContaining('External Sales Rep'), findsOneWidget);

      final homeTab = find.byKey(const Key('homeTab'));
      expect(homeTab, findsOneWidget);
      await tester.tap(homeTab);
      await tester.pump(const Duration(seconds: 3));

      //select sales org
      await intergrationTestHelper.selectSalesOrgTest(salesOrg: '2601');

      //select customer code
      await intergrationTestHelper.selectCustomerCode(
        customerCode: '0030032074');

      //Edi customer check
      expect(find.byKey(const Key('ediCustomerOrderDisable')), findsOneWidget);

      //select ship to code
      final shipToCodeSelect = find.byKey(const Key('shipToCodeSelect'));
      expect(shipToCodeSelect, findsWidgets);
      final shipToCodeSelectOne =
          find.descendant(of: shipToCodeSelect, matching: shipToCodeSelect);
      expect(shipToCodeSelectOne, findsOneWidget);
      await tester.tap(shipToCodeSelectOne);
      await tester.pump(const Duration(seconds: 2));
      final shipToSearchPage = find.byKey(const Key('shipToSearchPage'));
      expect(shipToSearchPage, findsOneWidget);
      final shipToCodeSearchField =
          find.byKey(const Key('shipToCodeSearchField'));
      expect(shipToCodeSearchField, findsOneWidget);
      await tester.enterText(shipToCodeSearchField, '0070042484');
      await tester.pump(const Duration(seconds: 1));
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump(const Duration(seconds: 8));
      final shipToOption = find.byKey(const Key('shipToOption0070042484'));
      expect(shipToOption, findsOneWidget);
      await tester.tap(shipToOption);
      await tester.pump(const Duration(seconds: 2));

      //create order
      final createOrder = find.text('Create Order');
      expect(createOrder, findsOneWidget);
      await tester.tap(createOrder);
      await tester.pump(const Duration(seconds: 15));

      //check order type disable for SG
      final orderTypeSelector = find.byKey(const Key('orderTypeSelector'));
      expect(orderTypeSelector, findsNothing);

      await tester.pump(const Duration(seconds: 2));
      final bundles = find.byKey(const Key('bundles'));
      expect(bundles, findsOneWidget);
      await tester.tap(bundles);
      await tester.pump(const Duration(seconds: 10));

      //todo : 5. Not able to search bundles as search Textfield is not present in bundles tab.

      //select bundles and add to cart
      final materialBundleOption =
          find.byKey(const Key('materialBundleOption0009031972'));
      expect(materialBundleOption, findsOneWidget);
      await tester.tap(materialBundleOption);
      await tester.pump(const Duration(seconds: 15));

      expect(find.byKey(const Key('BundleItemDetailPage')), findsOneWidget);
      expect(find.byKey(const Key('materialOption000000000023008187')),
          findsOneWidget);
      expect(find.byKey(const Key('materialOption000000000023008184')),
          findsOneWidget);

      //add quantity
      final addQunatityFirstItem =
          find.byKey(const Key('bundleAdd000000000023008187'));
      expect(addQunatityFirstItem, findsOneWidget);
      await tester.tap(addQunatityFirstItem);
      await tester.pump(const Duration(seconds: 2));

      //change quantity
      final changeQunatitySecondItem =
          find.byKey(const Key('bundleText000000000023008184'));
      expect(changeQunatitySecondItem, findsOneWidget);
      await tester.enterText(changeQunatitySecondItem, '5');
      await tester.pump(const Duration(seconds: 2));

      //deduct changeQunatitySecondItem
      await tester.tap(find.byKey(const Key('bundleDelete000000000023008184')));
      await tester.pump(const Duration(seconds: 3));

      //add bundles to cart
      final addBundlesToCart = find.byKey(const Key('addBundlesToCart'));
      expect(addBundlesToCart, findsOneWidget);
      await tester.tap(addBundlesToCart);
      await tester.pump(const Duration(seconds: 15));

      final backButton = find.byTooltip('Back');
      await tester.tap(backButton);
      await tester.pump(const Duration(seconds: 2));
      await tester.tap(find.byIcon(Icons.close));
      await tester.pump(const Duration(seconds: 2));

      //adding normal material to cart after adding bundles
      final materials = find.byKey(const Key('material'));
      expect(materials, findsOneWidget);
      await tester.tap(materials);
      await tester.pump(const Duration(seconds: 2));
      expect(find.byKey(const Key('materialListPage')), findsOneWidget);

      final materialSearchField = find.byKey(const Key('materialSearchField'));
      expect(materialSearchField, findsOneWidget);
      await tester.enterText(materialSearchField, '23007310');
      await tester.pump(const Duration(seconds: 1));
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump(const Duration(seconds: 10));

      //enable list price & currency check
      final listPriceText =
          find.byKey(const Key('listPrice000000000023007310'));
      expect(listPriceText, findsOneWidget);
      final listPriceNotAvailable = find.text('NA');
      if (listPriceNotAvailable.evaluate().isNotEmpty) {
        //enable Materials without Price
        expect(listPriceNotAvailable, findsWidgets);
      } else {
        //currency check
        expect(find.textContaining('SGD'), findsWidgets);
      }

      // //disable default material description
      // expect(
      //     find.byKey(const Key('defaultMaterialDescription000000000023007310')),
      //     findsNothing);

      // //disable registration number
      // final itemRegistrationNumber =
      //     find.byKey(const Key('registrationNumber000000000023007310'));
      // expect(itemRegistrationNumber, findsNothing);

      // //disable generic Material
      // final genericMaterial =
      //     find.byKey(const Key('genericMaterial000000000023007310'));
      // expect(genericMaterial, findsNothing);

      // //disable Tax Classification
      // expect(find.byKey(const Key('taxClassification000000000023007310')),
      //     findsNothing);

      // //disable gst
      // final priceBeforeText =
      //     find.byKey(const Key('priceBefore000000000023007310'));
      // expect(priceBeforeText, findsNothing);

      // //Disable Government Material Code (enable only for TW)
      // expect(find.byKey(const Key('governmentMaterialCode000000000023007310')),
      //     findsNothing);

      final materialOption =
          find.byKey(const Key('materialOption000000000023007310'));
      expect(materialOption, findsOneWidget);
      await tester.tap(materialOption);
      await tester.pump(const Duration(seconds: 3));

      expect(find.byKey(const Key('materialDetailsPage')), findsOneWidget);
      expect(find.byKey(const Key('bonusesMaterial')), findsOneWidget);
      expect(find.byKey(const Key('tieredPricing')), findsOneWidget);

      await tester.enterText(find.byKey(const Key('item')), '4');
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(find.byKey(const Key('cartItemDelete')));
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(find.byKey(const Key('cartItemAdd')));
      await tester.pump(const Duration(seconds: 3));

      final addMaterialToCart = find.byKey(const Key('addMaterialToCart'));
      expect(addMaterialToCart, findsOneWidget);
      await tester.tap(addMaterialToCart);

      //Enable Materials without Price (even if we don't get material price)
      await tester.pump(const Duration(seconds: 1));
      expect(find.textContaining('Product Not Available'.tr()), findsNothing);
      await tester.pump(const Duration(seconds: 5));
      await tester.pump(const Duration(seconds: 5));

      //cart page
      final cartButton = find.byKey(const Key('cartButton'));
      expect(cartButton, findsOneWidget);
      await tester.tap(cartButton);
      await tester.pump(const Duration(seconds: 10));

      expect(find.byKey(const Key('cartpage')), findsOneWidget);
      final materialCartItem =
          find.byKey(const Key('materialCartItem000000000023007310'));
      expect(materialCartItem, findsOneWidget);

      //enable expiry date check
      final expiryDateTextMaterial =
          find.byKey(const Key('expiryDate000000000023007310'));
      expect(expiryDateTextMaterial, findsOneWidget);

      //enable Stock check
      final stockMaterialYes =
          find.byKey(const Key('stock000000000023007310Yes'));
      final stockMaterialNo =
          find.byKey(const Key('stock000000000023007310No'));
      final stockMaterialNA = find.byKey(const Key('stock000000000023007310'));
      if (stockMaterialYes.evaluate().isNotEmpty) {
        expect(stockMaterialYes, findsOneWidget);
      } else if (stockMaterialNo.evaluate().isNotEmpty) {
        expect(stockMaterialNo, findsOneWidget);
      } else if (stockMaterialNA.evaluate().isNotEmpty) {
        expect(stockMaterialNA, findsOneWidget);
      }

      // //disable GST
      // expect(find.textContaining('Price before GST'), findsNothing);

      //Enable VAT At Total Level Only
      //GST percentage for SG
      expect(find.byKey(const Key('taxcodeInPercentageKey')), findsOneWidget);
      expect(find.textContaining('8%'), findsOneWidget);
      //Tax classfication enable
      //GST amount
      expect(find.byKey(const Key('totalTaxKey')), findsOneWidget);

      //disable batch number
      // final batchNumberTextMaterial =
      //     find.byKey(const Key('batchNumber000000000023007310'));
      // expect(batchNumberTextMaterial, findsNothing);

      //add remarks & edit
      final addRemarksMaterial = find.byKey(const Key('addRemarks'));
      expect(addRemarksMaterial, findsOneWidget);
      await tester.tap(addRemarksMaterial);
      await tester.pump(const Duration(seconds: 2));

      expect(find.byKey(const Key('addRemarksDialog')), findsOneWidget);

      final cancelRemark = find.byKey(const Key('cancel'));
      expect(cancelRemark, findsOneWidget);
      await tester.tap(cancelRemark);
      await tester.pump(const Duration(seconds: 2));

      await tester.tap(addRemarksMaterial);
      await tester.pump(const Duration(seconds: 2));

      final addRemark = find.byKey(const Key('add'));
      expect(addRemark, findsOneWidget);
      await tester.tap(addRemark);
      await tester.pump(const Duration(seconds: 2));

      expect(find.text('Remark cannot be empty.'.tr()), findsOneWidget);

      final remarkTextField = find.byKey(const Key('remarkTextField'));
      expect(remarkTextField, findsOneWidget);
      await tester.enterText(remarkTextField, 'Good');
      await tester.pump(const Duration(seconds: 2));

      await tester.tap(addRemark);
      await tester.pump(const Duration(seconds: 2));

      final cartMaterialRemarks = find.byKey(const Key('remarksGood'));
      expect(cartMaterialRemarks, findsOneWidget);

      final editDeleteDialogRemark = find.byKey(const Key('editDeleteDialog'));
      expect(editDeleteDialogRemark, findsOneWidget);
      await tester.tap(editDeleteDialogRemark);
      await tester.pump(const Duration(seconds: 2));

      final editRemark = find.byKey(const Key('editRemark'));
      expect(editRemark, findsOneWidget);
      await tester.tap(editRemark);
      await tester.pump(const Duration(seconds: 2));

      expect(find.byKey(const Key('addRemarksDialog')), findsOneWidget);

      await tester.enterText(remarkTextField, 'Nice');
      await tester.pump(const Duration(seconds: 2));

      final updateRemark = find.byKey(const Key('update'));
      expect(updateRemark, findsOneWidget);
      await tester.tap(updateRemark);
      await tester.pump(const Duration(seconds: 4));

      final cartMaterialRemarksUpdate = find.byKey(const Key('remarksNice'));
      expect(cartMaterialRemarksUpdate, findsOneWidget);
      await tester.pump(const Duration(seconds: 5));

      await tester.tap(find.textContaining('23007310'));
      await tester.pump(const Duration(seconds: 5));

      expect(find.byKey(const Key('updateCartBottomSheet')), findsOneWidget);

      await tester.enterText(find.byKey(const Key('item')), '19');
      await tester.pump(const Duration(seconds: 3));

      await tester.tap(find.byKey(const Key('updateCart')));
      await tester.pump(const Duration(seconds: 8));

      await tester.tap(find.byKey(const Key('cartAdd000000000023007310')));
      await tester.pump(const Duration(seconds: 5));

      await tester.tap(editDeleteDialogRemark);
      await tester.pump(const Duration(seconds: 2));

      final deleteRemark = find.byKey(const Key('deleteRemark'));
      expect(deleteRemark, findsOneWidget);
      await tester.tap(deleteRemark);
      await tester.pump(const Duration(seconds: 5));

      //bonus override
      final addBonusButton = find.byKey(const Key('addBonusButton'));
      expect(addBonusButton, findsOneWidget);
      await tester.tap(addBonusButton);
      await tester.pump(const Duration(seconds: 2));

      expect(find.byKey(const Key('addBonus')), findsOneWidget);

      final addBonusTextField = find.byKey(const Key('addBonusTextField'));
      expect(addBonusTextField, findsOneWidget);
      await tester.enterText(addBonusTextField, 'tab');
      await tester.pump(const Duration(seconds: 1));
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump(const Duration(seconds: 20));

      expect(find.byKey(const Key('addBonusTextFieldtab')), findsOneWidget);
      expect(find.byKey(const Key('bonusItemList')), findsWidgets);

      final addItemBonus = find.byKey(const Key('addItem'));
      expect(addItemBonus, findsWidgets);
      await tester.tap(addItemBonus.first);
      await tester.pump(const Duration(seconds: 2));

      expect(find.byKey(const Key('updateBonus')), findsOneWidget);

      await tester.enterText(find.byKey(const Key('bonusItem')), '5');
      await tester.pump(const Duration(seconds: 2));
      await tester.tap(find.byKey(const Key('bonusDelete')));
      await tester.pump(const Duration(seconds: 2));
      await tester.tap(find.byKey(const Key('bounsAdd')));
      await tester.pump(const Duration(seconds: 2));

      await tester.tap(find.byKey(const Key('addButton')));
      await tester.pump(const Duration(milliseconds: 300));

      final addBonusSnackBar =
          find.textContaining('Bonus item added to the cart'.tr());
      expect(addBonusSnackBar, findsOneWidget);

      await tester.tap(backButton);
      await tester.pump(const Duration(seconds: 5));

      //price override
      final priceOverride =
          find.byKey(const Key('priceOverride000000000023007310'));
      expect(priceOverride, findsOneWidget);
      await tester.tap(priceOverride);
      await tester.pump(const Duration(seconds: 2));

      if (find.byKey(const Key('priceSheet')).evaluate().isNotEmpty) {
        await tester.enterText(
            find.byKey(const Key('priceOverrideTextFormField')), '80');
        await tester.pump(const Duration(seconds: 2));
        await tester.tap(find.byKey(const Key('priceOverrideSubmitButton')));
        await tester.pump(const Duration(seconds: 8));
      } else {
        await tester.tapAt(const Offset(100, 100));
      }
      await tester.drag(materialCartItem, const Offset(0, -800));
      await tester.pump(const Duration(seconds: 10));

      //update bundle material
      await tester.tap(find.byKey(const Key('cartAdd000000000023008187')));
      await tester.pump(const Duration(seconds: 10));
      await tester.tap(find.byKey(const Key('cartDelete000000000023008184')));
      await tester.pump(const Duration(seconds: 10));
      await tester.enterText(
          find.byKey(const Key('cartItem000000000023008187')), '5');
      await tester.pump(const Duration(seconds: 10));

      final orderSummaryButton = find.byKey(const Key('orderSummaryButton'));
      expect(orderSummaryButton, findsOneWidget);
      await tester.tap(orderSummaryButton);
      await tester.pump(const Duration(seconds: 2));

      //order summary page
      //edi customer tries to submit order
      expect(find.byKey(const Key('ediCustomerOrderDisable')), findsOneWidget);
      await tester.pump(const Duration(seconds: 2));

      await orderSummaryTest();
      final submitOrder = find.byKey(const Key('submitButtonKey'));
      expect(submitOrder, findsOneWidget);
      await tester.tap(submitOrder);
      await tester.pump(const Duration(seconds: 5));

      await tester.tap(backButton);
      await tester.pump(const Duration(seconds: 2));
      await tester.tap(backButton);
      await tester.pump(const Duration(seconds: 2));
      await tester.tap(backButton);
      await tester.pump(const Duration(seconds: 2));

      //changing customer code (non-edi customer)
      await intergrationTestHelper.selectCustomerCode(
        customerCode: '0030032307');

      //select default shipping address
      await tester.tap(shipToCodeSelectOne);
      await tester.pump(const Duration(seconds: 2));
      expect(shipToSearchPage, findsOneWidget);
      final shipToOptionDefault = find.text('Default'.tr());
      expect(shipToOptionDefault, findsOneWidget);
      await tester.tap(shipToOptionDefault);
      await tester.pump(const Duration(seconds: 5));

      //create order for non-edi customer
      expect(createOrder, findsOneWidget);
      await tester.tap(createOrder);
      await tester.pump(const Duration(seconds: 2));

      expect(orderTypeSelector, findsNothing);
      expect(find.byKey(const Key('materialListPage')), findsOneWidget);

      expect(materialSearchField, findsOneWidget);
      await tester.enterText(materialSearchField, '23008184');
      await tester.pump(const Duration(seconds: 1));
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump(const Duration(seconds: 10));

      expect(find.byKey(const Key('materialOption000000000023008184')),
          findsOneWidget);

      //add favourite material
      final addFavMaterial = find.byIcon(
        Icons.favorite_border_outlined,
      );
      final deleteFavMaterial = find.byIcon(
        Icons.favorite,
      );
      if (addFavMaterial.evaluate().isNotEmpty) {
        await tester.tap(addFavMaterial);
        await tester.pump(const Duration(seconds: 5));
      } else {
        await tester.tap(deleteFavMaterial);
        await tester.pump(const Duration(seconds: 10));
        await tester.tap(addFavMaterial);
        await tester.pump(const Duration(seconds: 10));
      }

      await tester
          .tap(find.byKey(const Key('materialOption000000000023008184')));
      await tester.pump(const Duration(seconds: 3));

      expect(addMaterialToCart, findsOneWidget);
      await tester.tap(addMaterialToCart);
      await tester.pump(const Duration(seconds: 5));

      //cart page
      expect(cartButton, findsOneWidget);
      await tester.tap(cartButton);
      await tester.pump(const Duration(seconds: 10));

      final materialCartItemNew =
          find.byKey(const Key('materialCartItem000000000023008184'));

      await tester.enterText(
          find.byKey(const Key('cartItem000000000023008184')), '2');
      await tester.pump(const Duration(seconds: 5));

      expect(orderSummaryButton, findsOneWidget);
      await tester.tap(orderSummaryButton);
      await tester.pump(const Duration(seconds: 2));

      expect(find.byKey(const Key('orderSummaryKey')), findsOneWidget);

      //save order
      final orderSummarySaveTemplate =
          find.byKey(const Key('orderSummarySaveTemplate'));
      expect(orderSummarySaveTemplate, findsOneWidget);
      await tester.tap(orderSummarySaveTemplate);
      await tester.pump(const Duration(seconds: 2));

      expect(find.byKey(const Key('saveTemplateDialog')), findsOneWidget);

      final closeSaveTemplate = find.byKey(const Key('closeButton'));
      expect(closeSaveTemplate, findsOneWidget);
      await tester.tap(closeSaveTemplate);
      await tester.pump(const Duration(seconds: 2));

      expect(find.byKey(const Key('saveTemplateDialog')), findsNothing);

      await tester.tap(orderSummarySaveTemplate);
      await tester.pump(const Duration(seconds: 2));

      final saveTemplate = find.byKey(const Key('saveButton'));
      expect(saveTemplate, findsOneWidget);
      await tester.tap(saveTemplate);
      await tester.pump(const Duration(seconds: 2));

      expect(find.textContaining('Template name cannot'), findsOneWidget);

      await tester.enterText(
          find.byKey(const Key('saveTemplateInputField')), 'demo template');
      await tester.pump(const Duration(seconds: 2));
      await tester.tap(saveTemplate);
      await tester.pump(const Duration(seconds: 3));

      await tester.tap(backButton);
      await tester.pump(const Duration(seconds: 2));

      final deleteFromCart = find.byKey(const Key('deleteFromCart'));
      expect(deleteFromCart, findsOneWidget);
      await tester.tap(deleteFromCart);
      await tester.pump(const Duration(seconds: 5));

      expect(find.text('Cart is Empty'.tr()), findsOneWidget);

      await tester.tap(backButton);
      await tester.pump(const Duration(seconds: 2));
      await tester.tap(backButton);
      await tester.pump(const Duration(seconds: 2));

      expect(find.byKey(const Key('homeTab')), findsOneWidget);
      expect(find.byKey(const Key('homeSalesOrgSelector')), findsOneWidget);
      expect(find.byKey(const Key('homeCustomerCodeSelector')), findsOneWidget);
      expect(find.byKey(const Key('homeShipCodeSelector')), findsOneWidget);

      final orderTemplateCard = find.text('Order Template');
      expect(orderTemplateCard, findsOneWidget);
      await tester.tap(orderTemplateCard);
      await tester.pump(const Duration(seconds: 2));

      expect(find.byKey(const Key('OrderTemplateListPage')), findsOneWidget);
      expect(find.text('No order template found'), findsNothing);

      final selectOrderTemplate = find.byType(ListTile);
      expect(selectOrderTemplate, findsWidgets);
      await tester.tap(selectOrderTemplate.first);
      await tester.pump(const Duration(seconds: 15));

      expect(find.byKey(const Key('OrderTemplateDetailPage')), findsOneWidget);

      final saveTemplateAddToCart = find.byKey(const Key('onAddToCartPressed'));
      expect(saveTemplateAddToCart, findsOneWidget);
      await tester.tap(saveTemplateAddToCart);
      await tester.pump(const Duration(seconds: 10));

      expect(find.byKey(const Key('cartpage')), findsOneWidget);
      expect(materialCartItemNew, findsOneWidget);

      expect(orderSummaryButton, findsOneWidget);
      await tester.tap(orderSummaryButton);
      await tester.pump(const Duration(seconds: 2));

      await orderSummaryTest();

      //save order from order summary page
      final saveOrderButton = find.byKey(const Key('Save'));
      expect(saveOrderButton, findsWidgets);
      await tester.tap(saveOrderButton.last);
      await tester.pump(const Duration(seconds: 8));

      await tester.tap(backButton);
      await tester.pump(const Duration(seconds: 2));

      expect(cartButton, findsWidgets);
      await tester.tap(cartButton.first);
      await tester.pump(const Duration(seconds: 5));

      await tester.drag(materialCartItemNew, const Offset(-300, 0.0));
      await tester.pump(const Duration(seconds: 5));
      final removeWidget = find.byIcon(Icons.delete_outline);
      await tester.tap(removeWidget);
      await tester.pump(const Duration(seconds: 2));

      expect(find.text('Cart is Empty'.tr()), findsOneWidget);

      await tester.tap(backButton);
      await tester.pump(const Duration(seconds: 2));

      final savedOrders = find.text('Saved Orders');
      expect(savedOrders, findsOneWidget);
      await tester.tap(savedOrders);
      await tester.pump(const Duration(seconds: 4));

      final savedOrderItem = find.byType(ListTile).first;
      expect(savedOrderItem, findsOneWidget);
      await tester.tap(savedOrderItem);
      await tester.pump(const Duration(seconds: 15));

      expect(find.byKey(const Key('savedOrderDetailPage')), findsOneWidget);

      final saveOrderAddToCart = find.byKey(const Key('onAddToCartPressed'));
      expect(saveOrderAddToCart, findsOneWidget);
      await tester.tap(saveOrderAddToCart);
      await tester.pump(const Duration(seconds: 8));

      expect(find.byKey(const Key('cartpage')), findsOneWidget);
      expect(materialCartItemNew, findsOneWidget);

      await tester.drag(
          find.byKey(const Key('materialCartItem000000000023008184')),
          const Offset(-300, 0.0));
      await tester.pump(const Duration(seconds: 5));
      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pump(const Duration(seconds: 2));

      await tester.tap(backButton);
      await tester.pump(const Duration(seconds: 2));

      expect(createOrder, findsOneWidget);
      await tester.tap(createOrder);
      await tester.pump(const Duration(seconds: 5));

      expect(orderTypeSelector, findsNothing);

      final clearSearch = find.byKey(const Key('clearSearch'));
      expect(clearSearch, findsOneWidget);
      await tester.tap(clearSearch);
      await tester.pump(const Duration(seconds: 8));

      expect(materialSearchField, findsOneWidget);
      await tester.enterText(materialSearchField, '23008184');
      await tester.pump(const Duration(seconds: 1));
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump(const Duration(seconds: 10));

      expect(find.byKey(const Key('materialOption000000000023008184')),
          findsOneWidget);

      await tester
          .tap(find.byKey(const Key('materialOption000000000023008184')));
      await tester.pump(const Duration(seconds: 3));

      await tester.enterText(find.byKey(const Key('item')), '12');
      await tester.pump(const Duration(seconds: 1));

      expect(addMaterialToCart, findsOneWidget);
      await tester.tap(addMaterialToCart);
      await tester.pump(const Duration(seconds: 5));

      expect(cartButton, findsOneWidget);
      await tester.tap(cartButton);
      await tester.pump(const Duration(seconds: 10));

      //price override
      final priceOverrideNew =
          find.byKey(const Key('priceOverride000000000023008184'));
      expect(priceOverrideNew, findsOneWidget);
      await tester.tap(priceOverrideNew);
      await tester.pump(const Duration(seconds: 2));

      if (find.byKey(const Key('priceSheet')).evaluate().isNotEmpty) {
        await tester.enterText(
            find.byKey(const Key('priceOverrideTextFormField')), '70');
        await tester.pump(const Duration(seconds: 2));
        await tester.tap(find.byKey(const Key('priceOverrideSubmitButton')));
        await tester.pump(const Duration(seconds: 8));
      }

      //bonus override
      final addBonusButtonNew = find.byKey(const Key('addBonusButton'));
      if (addBonusButtonNew.evaluate().isNotEmpty) {
        expect(addBonusButtonNew, findsOneWidget);
        await tester.tap(addBonusButtonNew);
        await tester.pump(const Duration(seconds: 2));

        expect(find.byKey(const Key('addBonus')), findsOneWidget);

        final addBonusTextField = find.byKey(const Key('addBonusTextField'));
        expect(addBonusTextField, findsOneWidget);
        await tester.enterText(addBonusTextField, 'tab');
        await tester.pump(const Duration(seconds: 1));
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump(const Duration(seconds: 20));

        expect(find.byKey(const Key('addBonusTextFieldtab')), findsOneWidget);
        expect(find.byKey(const Key('bonusItemList')), findsWidgets);

        final addItemBonus = find.byKey(const Key('addItem'));
        expect(addItemBonus, findsWidgets);
        await tester.tap(addItemBonus.first);
        await tester.pump(const Duration(seconds: 2));

        expect(find.byKey(const Key('updateBonus')), findsOneWidget);

        await tester.enterText(find.byKey(const Key('bonusItem')), '5');
        await tester.pump(const Duration(seconds: 2));
        await tester.tap(find.byKey(const Key('bonusDelete')));
        await tester.pump(const Duration(seconds: 2));
        await tester.tap(find.byKey(const Key('bounsAdd')));
        await tester.pump(const Duration(seconds: 2));

        await tester.tap(find.byKey(const Key('addButton')));
        await tester.pump(const Duration(milliseconds: 300));

        final addBonusSnackBar =
            find.textContaining('Bonus item added to the cart'.tr());
        expect(addBonusSnackBar, findsOneWidget);
      }

      await tester.tap(backButton);
      await tester.pump(const Duration(seconds: 8));

      //discount override enable check (should not be special order type)
      final discountOverride = find.byKey(const Key('discountOverrideToggle'));
      expect(discountOverride, findsOneWidget);
      //enable
      await tester.tap(discountOverride);
      await tester.pump(const Duration(seconds: 5));

      final discountOverridsDialog =
          find.byKey(const Key('discountOverridsDialog'));
      expect(discountOverridsDialog, findsOneWidget);

      final submitDiscountPercentage = find.byKey(const Key('Submit'));
      expect(submitDiscountPercentage, findsOneWidget);
      await tester.tap(submitDiscountPercentage);
      await tester.pump(const Duration(seconds: 5));

      expect(
          find.byKey(const Key('discountOverridePercentage')), findsOneWidget);

      expect(discountOverride, findsOneWidget);
      await tester.tap(discountOverride);
      await tester.pump(const Duration(seconds: 8));

      expect(discountOverride, findsOneWidget);
      await tester.tap(discountOverride);
      await tester.pump(const Duration(seconds: 5));

      final discountOvverrideField =
          find.byKey(const Key('discountOvverrideField'));
      expect(discountOvverrideField, findsOneWidget);
      await tester.enterText(discountOvverrideField, '20');
      await tester.pump(const Duration(seconds: 2));

      expect(submitDiscountPercentage, findsOneWidget);
      await tester.tap(submitDiscountPercentage);
      await tester.pump(const Duration(seconds: 5));

      expect(
          find.byKey(const Key('discountOverridePercentage')), findsOneWidget);

      expect(orderSummaryButton, findsOneWidget);
      await tester.tap(orderSummaryButton);
      await tester.pump(const Duration(seconds: 2));

      await orderSummaryTest();

      final submitOrderNew = find.byKey(const Key('submitButtonKey'));

      expect(submitOrderNew, findsWidgets);
      await tester.tap(submitOrderNew.last);
      await tester.pump(const Duration(seconds: 5));

      final orderSuccessKey = find.byKey(const Key('orderSuccessKey'));
      expect(orderSuccessKey, findsOneWidget);

      //go to order history
      final goToOrderHistory = find.byKey(const Key('goToOrderHistory'));
      expect(goToOrderHistory, findsOneWidget);
      await tester.tap(goToOrderHistory);
      await tester.pump(const Duration(seconds: 20));

      final orderHistoryItem =
          find.byKey(const Key('materialId000000000023008184'));

      //disable Disable Delivery Time
      //expect(find.textContaining('Delivery Date/Time'.tr()), findsNothing);

      // //disable Processing Status as false
      // expect(find.byKey(const Key('disableProcessingStatus')), findsWidgets);

      if (orderHistoryItem.evaluate().isNotEmpty) {
        if (orderHistoryItem.evaluate().length == 1) {
          await tester.tap(orderHistoryItem);
        } else {
          await tester.tap(orderHistoryItem.first);
        }
      }

      //disable Payment Terms Display for Customer
      //expect(find.byKey(const Key('paymentTerm')), findsWidgets);
      await tester.pump(const Duration(seconds: 10));

      final reOrderButton = find.byKey(const Key('reOrderButton'));

      await tester.scrollUntilVisible(reOrderButton, 100);
      await tester.pump(const Duration(seconds: 5));

      //enable Batch Number & Expiry Date
      expect(find.byKey(const Key('batchNumberExpiryDate')), findsWidgets);

      // //disable Tax Display
      // expect(find.byKey(const Key('enableTaxDisplay')), findsNothing);

      //enable Discount in Order Details (bonus)
      expect(find.byKey(const Key('discountRateForBonusCard')), findsWidgets);

      //enable Order History Price
      expect(find.byKey(const Key('zpPriceBonus000000000023008184')), findsWidgets);

      expect(reOrderButton, findsOneWidget);
      await tester.tap(reOrderButton);
      await tester.pump(const Duration(seconds: 15));

      final deleteFromCartNew = find.byKey(const Key('deleteFromCart'));
      expect(deleteFromCartNew, findsOneWidget);
      await tester.tap(deleteFromCartNew);
      await tester.pump(const Duration(seconds: 3));

      await tester.tap(backButton);
      await tester.pump(const Duration(seconds: 2));

      //filter order history
      final filterOrderHistory = find.byKey(const Key('filterOrderHistory'));
      expect(filterOrderHistory, findsOneWidget);
      await tester.tap(filterOrderHistory);
      await tester.pump(const Duration(seconds: 3));

      expect(find.byKey(const Key('filterApplyButton')), findsOneWidget);

      final filterMaterialSearchField =
          find.byKey(const Key('filterMaterialSearchField'));
      expect(filterMaterialSearchField, findsOneWidget);
      await tester.enterText(filterMaterialSearchField, '23008184');
      await tester.pump(const Duration(seconds: 3));

      final filterApplyButton = find.byKey(const Key('filterApplyButton'));
      expect(filterApplyButton, findsOneWidget);
      await tester.tap(filterApplyButton);
      await tester.pump(const Duration(seconds: 20));

      expect(orderHistoryItem, findsWidgets);

      //clear filter
      expect(filterOrderHistory, findsOneWidget);
      await tester.tap(filterOrderHistory);
      await tester.pump(const Duration(seconds: 3));

      expect(find.byKey(const Key('filterApplyButton')), findsOneWidget);

      final filterClearButton = find.byKey(const Key('filterClearButton'));
      expect(filterClearButton, findsOneWidget);
      await tester.tap(filterClearButton);
      await tester.pump(const Duration(seconds: 20));

      expect(orderHistoryItem, findsWidgets);

      final statusFilterButton = find.byKey(const Key('statusFilterButton'));
      expect(statusFilterButton, findsOneWidget);
      await tester.tap(statusFilterButton);
      await tester.pump(const Duration(seconds: 2));

      final checkboxListTilePending =
          find.byKey(const Key('checkboxListTilePending'));
      expect(checkboxListTilePending, findsOneWidget);
      await tester.tap(checkboxListTilePending);
      await tester.pump(const Duration(seconds: 2));

      final closeButton = find.byKey(const Key('closeButton'));
      expect(closeButton, findsOneWidget);
      await tester.tap(closeButton);
      await tester.pump(const Duration(seconds: 2));

      final historyTitle = find.byKey(const Key('historyTitle0'));
      if(historyTitle.evaluate().isNotEmpty){
        expect(historyTitle, findsOneWidget);
        await tester.tap(historyTitle);
        await tester.pump(const Duration(seconds: 10));

        await tester.scrollUntilVisible(reOrderButton, 100);
        await tester.pump(const Duration(seconds: 5));

        expect(find.textContaining('Pending'), findsOneWidget);

        await tester.tap(find.byKey(const Key('backToOrderHistoryDetailsPage')));
        await tester.pump(const Duration(seconds: 2));
      }

      expect(statusFilterButton, findsOneWidget);
      await tester.tap(statusFilterButton);
      await tester.pump(const Duration(seconds: 2));

      final filterclearAllButton =
          find.byKey(const Key('filterclearAllButton'));
      expect(filterclearAllButton, findsOneWidget);
      await tester.tap(filterclearAllButton);
      await tester.pump(const Duration(seconds: 2));

      final orderDateFilter = find.byKey(const Key('orderDateFilter'));
      expect(orderDateFilter, findsOneWidget);
      await tester.tap(orderDateFilter);
      await tester.pump(const Duration(seconds: 15));

      final favoritesTab = find.byKey(const Key('favoritesTab'));
      expect(favoritesTab, findsOneWidget);
      await tester.tap(favoritesTab);
      await tester.pump(const Duration(seconds: 8));

      //refresh favourite tab
      await tester.dragFrom(const Offset(100, 200), const Offset(100, 450));
      await tester.pump(const Duration(seconds: 8));

      final deleteFavouriteFav =
          find.byKey(const Key('deleteFavouriteFavPage000000000023008184'));
      expect(deleteFavouriteFav, findsOneWidget);
      await tester.tap(deleteFavouriteFav);
      await tester.pump(const Duration(seconds: 8));

      expect(deleteFavouriteFav, findsNothing);

      await tester.tap(find.byKey(const Key('homeTab')));
      await tester.pump(const Duration(seconds: 5));

      //delete saved order

      expect(savedOrders, findsOneWidget);
      await tester.tap(savedOrders);
      await tester.pump(const Duration(seconds: 4));

      final deleteSavedOrder = find.byKey(const Key('deleteFromList'));
      expect(deleteSavedOrder, findsWidgets);
      if (deleteSavedOrder.evaluate().length == 1) {
        await tester.tap(deleteSavedOrder);
      } else {
        await tester.tap(deleteSavedOrder.first);
      }
      await tester.pump(const Duration(seconds: 3));

      expect(find.byKey(const Key('confirmDialog')), findsOneWidget);

      await tester.tap(find.byKey(const Key('Yes')));
      await tester.pump(const Duration(seconds: 5));

      await tester.tap(backButton);
      await tester.pump(const Duration(seconds: 2));

      //delete order Template
      expect(orderTemplateCard, findsOneWidget);
      await tester.tap(orderTemplateCard);
      await tester.pump(const Duration(seconds: 2));

      expect(find.byKey(const Key('OrderTemplateListPage')), findsOneWidget);
      expect(find.text('No order template found'), findsNothing);

      final deleteOrderTemplate = find.byKey(const Key('deleteFromList'));
      expect(deleteOrderTemplate, findsWidgets);
      if (deleteOrderTemplate.evaluate().length == 1) {
        await tester.tap(deleteOrderTemplate);
      } else {
        await tester.tap(deleteOrderTemplate.first);
      }
      await tester.pump(const Duration(seconds: 3));

      expect(find.byKey(const Key('confirmDialog')), findsOneWidget);

      await tester.tap(find.byKey(const Key('Yes')));
      await tester.pump(const Duration(seconds: 5));

      await tester.tap(backButton);
      await tester.pump(const Duration(seconds: 2));

      //account tab check
      await intergrationTestHelper.accountTabCheck();

      //logout
      await intergrationTestHelper.logoutTest();
    });
  });
}
