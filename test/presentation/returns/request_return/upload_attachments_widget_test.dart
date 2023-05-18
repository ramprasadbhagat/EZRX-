import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/returns/request_return/request_return_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/returns/request_return/upload_attachments.dart';
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

class PoAttachmentBlocMock
    extends MockBloc<PoAttachmentEvent, PoAttachmentState>
    implements PoAttachmentBloc {}

class RequestReturnBlocMock
    extends MockBloc<RequestReturnEvent, RequestReturnState>
    implements RequestReturnBloc {}

class FilePickerServiceMock extends Mock implements FilePickerService {}

void main() {
  late AppRouter autoRouterMock;
  late PoAttachmentBloc poAttachmentBlocMock;
  late FilePickerService filePickerService;
  late EligibilityBloc eligibilityBlocMock;
  late RequestReturnBloc requestReturnMockBloc;
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
    requestReturnMockBloc = RequestReturnBlocMock();
    poAttachmentBlocMock = PoAttachmentBlocMock();
    when(() => requestReturnMockBloc.state)
        .thenReturn(RequestReturnState.initial());
    when(() => poAttachmentBlocMock.state)
        .thenReturn(PoAttachmentState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  group('Upload documents Widget Tests', () {
    Widget getTestWidget() {
      return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<RequestReturnBloc>(
                create: (context) => requestReturnMockBloc),
            BlocProvider<PoAttachmentBloc>(
                create: (context) => poAttachmentBlocMock),
            BlocProvider<EligibilityBloc>(
                create: (context) => eligibilityBlocMock),
          ],
          child: Scaffold(
            body: UploadAttachments(
                returnItem: ReturnItem.empty().copyWith(
              assignmentNumber: 'fake-number',
              materialNumber: MaterialNumber('fake-number'),
            )),
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
          failureOrSuccessOption: optionOf(
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
  });
}
