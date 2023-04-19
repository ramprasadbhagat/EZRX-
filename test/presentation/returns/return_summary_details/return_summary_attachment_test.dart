import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_details/section/attachments_section.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class PoAttachmentBlocMock
    extends MockBloc<PoAttachmentEvent, PoAttachmentState>
    implements PoAttachmentBloc {}

void main() {
  late PoAttachmentBloc poAttachmentBlocMock;
  final locator = GetIt.instance;
  late AppRouter autoRouterMock;

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => MixpanelService());
    autoRouterMock = locator<AppRouter>();
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    poAttachmentBlocMock = PoAttachmentBlocMock();
    when(() => poAttachmentBlocMock.state)
        .thenReturn(PoAttachmentState.initial());
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<PoAttachmentBloc>(
            create: (context) => poAttachmentBlocMock,
          ),
        ],
        child: Scaffold(
          body: ReturnSummaryDetailsAttachmentSection(
            poDocuments: [
              PoDocuments(
                name: 'fake-name-1',
                url: 'fake-url-1',
              ),
            ],
            attachmentsUploadMode: AttachmentsUploadMode.user,
          ),
        ),
      ),
    );
  }

  group('Return Summary ReturnSummaryDetailsAttachmentSection Test', () {
    testWidgets('=> ReturnSummaryDetailsAttachmentSection test',
        (tester) async {
      final expectedState = [
        PoAttachmentState.initial().copyWith(
          fileOperationMode: FileOperationMode.download,
          isFetching: true,
          fileUrl: [
            PoDocuments(
              name: 'fake-name-1',
              url: 'fake-url-1',
            ),
          ],
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
        ),
        PoAttachmentState.initial().copyWith(
          fileOperationMode: FileOperationMode.download,
          isFetching: false,
          fileUrl: [
            PoDocuments(
              name: 'fake-name-1',
              url: 'fake-url-1',
            ),
          ],
          failureOrSuccessOption: none(),
        ),
        PoAttachmentState.initial().copyWith(
          fileOperationMode: FileOperationMode.download,
          isFetching: true,
          fileUrl: [
            PoDocuments(
              name: 'fake-name-1',
              url: 'fake-url-1',
            ),
          ],
          fileData: [
            PoDocumentsBuffer(
              name: 'fake-name-1',
              buffer: Uint8List(0),
            ),
          ],
          failureOrSuccessOption: optionOf(const Right('')),
        ),
      ];

      whenListen(poAttachmentBlocMock, Stream.fromIterable(expectedState));

      await getWidget(tester);
      await tester.pump();

      final attachmentText = find.text('Attachments '.tr());
      expect(attachmentText, findsOneWidget);

      final findDownloadIndicator = find.byType(CircularProgressIndicator);
      expect(findDownloadIndicator, findsOneWidget);
      await tester.pump();
    });

    testWidgets('=> Download file onTap test', (tester) async {
      await getWidget(tester);
      await tester.pump();
      final findDownloadButton = find.text('fake-name-1');
      expect(findDownloadButton, findsOneWidget);
      await tester.ensureVisible(findDownloadButton);
      await tester.pumpAndSettle();
      await tester.tap(findDownloadButton);
      await tester.pump();
    });
  });
}
