import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary/addition_details/additional_attachment.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockPaymentCustomerInformationBloc extends MockBloc<
        PaymentCustomerInformationEvent, PaymentCustomerInformationState>
    implements PaymentCustomerInformationBloc {}

class AdditionalDetailsMock
    extends MockBloc<AdditionalDetailsEvent, AdditionalDetailsState>
    implements AdditionalDetailsBloc {}

class PoAttachmentBlocMock
    extends MockBloc<PoAttachmentEvent, PoAttachmentState>
    implements PoAttachmentBloc {}

class FilePickerServiceMock extends Mock implements FilePickerService {}



void main() {
  late AppRouter autoRouterMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late PoAttachmentBloc poAttachmentBlocMock;
  late FilePickerService filePickerService;
  late EligibilityBloc eligibilityBlocMock;
  late GetIt locator;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator = GetIt.instance;
    filePickerService = FilePickerServiceMock();
    autoRouterMock = AppRouter();
    eligibilityBlocMock = EligibilityBlocMock();
    locator.registerLazySingleton(() => autoRouterMock);
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    locator.registerLazySingleton(() => filePickerService);
    GetIt.instance.registerSingleton<Config>(Config());
    const MethodChannel('dev.fluttercommunity.plus/device_info')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getAndroidDeviceInfo') {
        return <String, dynamic>{
          'version': {
            'sdkInt': 32,
          },
          'displayMetrics': {
            'widthPx': 100.0,
            'heightPx': 100.0,
            'xDpi': 100.0,
            'yDpi': 100.0,
          },
        };
      }
      return null;
    });
  });

  setUp(() {
    additionalDetailsBlocMock = AdditionalDetailsMock();
    poAttachmentBlocMock = PoAttachmentBlocMock();
    when(() => additionalDetailsBlocMock.state)
        .thenReturn(AdditionalDetailsState.initial());
    when(() => poAttachmentBlocMock.state)
        .thenReturn(PoAttachmentState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  group('PoAttachment Upload Widget Tests', () {
    Widget getTestWidget() {
      return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<AdditionalDetailsBloc>(
                create: (context) => additionalDetailsBlocMock),
            BlocProvider<PoAttachmentBloc>(
                create: (context) => poAttachmentBlocMock),
            BlocProvider<EligibilityBloc>(
                create: (context) => eligibilityBlocMock),
          ],
          child: const Scaffold(
            body: AdditionPoAttachmentUpload(),
          ));
    }

    testWidgets('Po Attachment Upload Dialog Test', (tester) async {
      final expectedStates = [
        PoAttachmentState.initial().copyWith(
          fileUrl: [
            PoDocuments(
              name: 'fake-name-1',
              url: 'fake-url-1',
            ),
          ],
          fileOperationMode: FileOperationMode.upload,
        )
      ];
      whenListen(poAttachmentBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(getTestWidget());
      await tester.pump();
      final poAttachmentUploadSuccessfulMessage =
          find.text('fake-name-1 file uploaded successfully'.tr());
      expect(poAttachmentUploadSuccessfulMessage, findsOneWidget);
      final poAttachmentUploadButton = find.byKey(
        const ValueKey('poAttachmentUploadButton'),
      );
      expect(poAttachmentUploadButton, findsOneWidget);
      final poAttachmentUploadIcon = find.byKey(
        const ValueKey('poAttachmentUploadIcon'),
      );
      expect(poAttachmentUploadIcon, findsOneWidget);
      await tester.tap(poAttachmentUploadButton);
      await tester.pump();
      final poAttachmentUploadDialog = find.byKey(
        const ValueKey('poAttachmentUploadDialog'),
      );
      expect(poAttachmentUploadDialog, findsOneWidget);
      final poAttachmentUploadDialogTitle = find.text('Upload Attachment'.tr());
      expect(poAttachmentUploadDialogTitle, findsOneWidget);
      final poAttachmentUploadDialogBody =
          find.text('Choose a photo or a file'.tr());
      expect(poAttachmentUploadDialogBody, findsOneWidget);
    });

    testWidgets(
        'Po Attachment File Upload Test ios upload photo with no permission',
        (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      final expectedStates = [
        PoAttachmentState.initial().copyWith(
          fileOperationMode: FileOperationMode.upload,
          isFetching: true,
        ),
        PoAttachmentState.initial().copyWith(
          fileOperationMode: FileOperationMode.upload,
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.photoPermissionFailed(),
            ),
          ),
        ),
      ];
      whenListen(poAttachmentBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(getTestWidget());
      await tester.pump();
      final poAttachmentUploadButton = find.byKey(
        const ValueKey('poAttachmentUploadButton'),
      );
      expect(poAttachmentUploadButton, findsOneWidget);
      final iosNoPhotoPermission = find
          .text('Please enable Photos permission from the app settings'.tr());
      await tester.pumpAndSettle(const Duration(seconds: 10));
      expect(iosNoPhotoPermission, findsOneWidget);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets(
        'Po Attachment File Upload Test android upload photo with no permission',
        (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      final expectedStates = [
        PoAttachmentState.initial().copyWith(
          fileOperationMode: FileOperationMode.upload,
          isFetching: true,
        ),
        PoAttachmentState.initial().copyWith(
          fileOperationMode: FileOperationMode.upload,
            failureOrSuccessOption:
              optionOf(
            const Left(
              ApiFailure.storagePermissionFailed(),
            ),
          ),
        ),
      ];
      whenListen(poAttachmentBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(getTestWidget());
      await tester.pump();
      final poAttachmentUploadButton = find.byKey(
        const ValueKey('poAttachmentUploadButton'),
      );
      expect(poAttachmentUploadButton, findsOneWidget);
      final androidStoragePermission = find
          .text('Please enable Storage permission from the app settings'.tr());
      expect(androidStoragePermission, findsOneWidget);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets(
        'Po Attachment File Upload Test android upload photo file picker error',
        (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      final expectedStates = [
        PoAttachmentState.initial().copyWith(
          fileOperationMode: FileOperationMode.upload,
          isFetching: true,
        ),
        PoAttachmentState.initial().copyWith(
          fileOperationMode: FileOperationMode.upload,
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.invalidFileFormat(),
            ),
          ),
        ),
      ];
      whenListen(poAttachmentBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(getTestWidget());
      await tester.pump();
      final poAttachmentUploadButton = find.byKey(
        const ValueKey('poAttachmentUploadButton'),
      );
      expect(poAttachmentUploadButton, findsOneWidget);
      final filePickerError = find.text(
          'Unable to upload file as either file format not supported or something wrong with the file'
              .tr());
      expect(filePickerError, findsOneWidget);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('Po Attachment File Upload Test ios upload file upload fail',
        (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      final expectedStates = [
        PoAttachmentState.initial().copyWith(
          fileUrl: [
            PoDocuments(
              name: 'fake-name-1',
              url: 'fake-url-1',
            ),
          ],
          fileOperationMode: FileOperationMode.upload,
          failureOrSuccessOption: none(),
        )
      ];
      whenListen(poAttachmentBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(getTestWidget());
      await tester.pump();
      final poAttachmentUploadButton = find.byKey(
        const ValueKey('poAttachmentUploadButton'),
      );
      expect(poAttachmentUploadButton, findsOneWidget);
      await tester.tap(poAttachmentUploadButton);
      await tester.pump();
      final poAttachmentUploadDialog = find.byKey(
        const ValueKey('poAttachmentUploadDialog'),
      );
      expect(poAttachmentUploadDialog, findsOneWidget);
      final poAttachmentFileUploadButton = find.byKey(
        const ValueKey('poAttachmentFileUploadButton'),
      );
      when(() => filePickerService.pickFiles(
          allowMultiple: true, fileType: FileType.image)).thenAnswer(
        (invocation) async => null,
      );
      await tester.tap(poAttachmentFileUploadButton);
      await tester.pumpAndSettle();
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets(
        'Po Attachment File Upload Test ios upload file upload back while upload',
        (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      await tester.pumpWidget(getTestWidget());
      await tester.pump();
      final poAttachmentUploadButton = find.byKey(
        const ValueKey('poAttachmentUploadButton'),
      );
      expect(poAttachmentUploadButton, findsOneWidget);
      await tester.tap(poAttachmentUploadButton);
      await tester.pump();
      final poAttachmentUploadDialog = find.byKey(
        const ValueKey('poAttachmentUploadDialog'),
      );
      expect(poAttachmentUploadDialog, findsOneWidget);
      final poAttachmentFileUploadButton = find.byKey(
        const ValueKey('poAttachmentFileUploadButton'),
      );
      when(() => filePickerService.pickFiles(
          allowMultiple: true,
          fileType: FileType.custom,
          allowedExtensions: locator<Config>().allowedExtensions,
        ),
      ).thenAnswer(
        (invocation) async => const FilePickerResult([]),
      );
      expect(poAttachmentFileUploadButton, findsOneWidget);
      await tester.tap(poAttachmentFileUploadButton);
      await tester.pumpAndSettle(const Duration(seconds: 10));
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('Po Attachment android ios upload file ', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      await tester.pumpWidget(getTestWidget());
      await tester.pump();
      final poAttachmentUploadButton = find.byKey(
        const ValueKey('poAttachmentUploadButton'),
      );
      expect(poAttachmentUploadButton, findsOneWidget);
      await tester.tap(poAttachmentUploadButton);
      await tester.pump();
      final poAttachmentUploadDialog = find.byKey(
        const ValueKey('poAttachmentUploadDialog'),
      );
      expect(poAttachmentUploadDialog, findsOneWidget);
      final poAttachmentFileUploadButton = find.byKey(
        const ValueKey('poAttachmentFileUploadButton'),
      );
      when(() => filePickerService.pickFiles(
          allowMultiple: true,
          fileType: FileType.custom,
          allowedExtensions: locator<Config>().allowedExtensions)).thenAnswer(
        (invocation) async => FilePickerResult([
          PlatformFile(
            name: 'fake-name',
            size: 2,
            path: 'Fake-path',
          )
        ]),
      );
      expect(poAttachmentFileUploadButton, findsOneWidget);
      await tester.tap(poAttachmentFileUploadButton);
      await tester.pumpAndSettle(const Duration(seconds: 10));
      debugDefaultTargetPlatformOverride = null;
    });

    // testWidgets('Po Attachment file not uploading ', (tester) async {
    //   debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    //   final expectedStatesPoAttachmentState = [
    //     PoAttachmentState.initial().copyWith(
    //       failureOrSuccessOption: optionOf(
    //         const Right(
    //           ApiFailure.other('Fake-Error'),
    //         ),
    //       ),
    //     ),
    //     PoAttachmentState.initial().copyWith(
    //       fileUrl: [
    //         PoDocuments(
    //           name: 'fake-name-1',
    //           url: 'fake-url-1',
    //         ),
    //       ],
    //       fileOperationMode: FileOperationMode.upload,
    //       isFetching: true,
    //     )
    //   ];
    //
    //   final expectedAdditionalDetailsDataState = [
    //     AdditionalDetailsState.initial(),
    //     AdditionalDetailsState.initial().copyWith(
    //         deliveryInfoData: DeliveryInfoData.empty().copyWith(
    //       poDocuments: [PoDocuments.empty()],
    //     )),
    //   ];
    //   whenListen(poAttachmentBlocMock,
    //       Stream.fromIterable(expectedStatesPoAttachmentState));
    //   whenListen(additionalDetailsBlocMock,
    //       Stream.fromIterable(expectedAdditionalDetailsDataState));
    //   await tester.pumpWidget(getTestWidget());
    //   await tester.pump();
    //   final orderSummaryAdditionalPoAttachment = find.byKey(
    //     const ValueKey('orderSummaryAdditionalPoAttachment'),
    //   );
    //   expect(orderSummaryAdditionalPoAttachment, findsOneWidget);
    //   debugDefaultTargetPlatformOverride = null;
    // });
  });
}
