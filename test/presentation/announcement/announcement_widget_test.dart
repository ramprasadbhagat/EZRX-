import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/announcement/bloc/announcement_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_local.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/material_frame_wrapper.dart';

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

void main() {
  late AnnouncementBloc announcementBlocMock;
  late Announcement announcementMock;

  setUpAll(() async {
    GetIt.instance.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    announcementMock = await AnnouncementLocalDataSource().getAnnouncements();
  });

  group('Announcement Widget', () {
    setUp(() {
      announcementBlocMock = AnnouncementBlocMock();
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
    });
    testWidgets("Test that haven't loaded announcement", (tester) async {
      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
            child: const AnnouncementWidget(),
          ),
        ),
      );

      final loadingIndicator =
          find.byKey(const Key('announcementLoadingIndicator'));
      final reloadIcon = find.byKey(const Key('announcementReloadIcon'));
      final announcementDescription =
          find.byKey(const Key('announcementDescription'));
      final closeIcon = find.byKey(const Key('announcementCloseIcon'));

      expect(loadingIndicator, findsNothing);
      expect(reloadIcon, findsNothing);
      expect(announcementDescription, findsNothing);
      expect(closeIcon, findsNothing);
    });

    testWidgets('Test that loaded announcement', (tester) async {
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial().copyWith(
          announcement: announcementMock,
        ),
      );
      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
            child: const AnnouncementWidget(),
          ),
        ),
      );

      final loadingIndicator =
          find.byKey(const Key('announcementLoadingIndicator'));
      final reloadIcon = find.byKey(const Key('announcementReloadIcon'));
      final announcementDescription =
          find.byKey(const Key('announcementDescription'));
      final closeIcon = find.byKey(const Key('announcementCloseIcon'));

      expect(loadingIndicator, findsNothing);
      expect(reloadIcon, findsOneWidget);
      expect(announcementDescription, findsOneWidget);
      expect(closeIcon, findsOneWidget);
    });

    testWidgets('Test that loaded announcement error', (tester) async {
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());

      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
            child: const AnnouncementWidget(),
          ),
        ),
      );

      final loadingIndicator =
          find.byKey(const Key('announcementLoadingIndicator'));
      final reloadIcon = find.byKey(const Key('announcementReloadIcon'));
      final announcementDescription =
          find.byKey(const Key('announcementDescription'));
      final closeIcon = find.byKey(const Key('announcementCloseIcon'));

      expect(loadingIndicator, findsNothing);
      expect(reloadIcon, findsNothing);
      expect(announcementDescription, findsNothing);
      expect(closeIcon, findsNothing);
    });

    testWidgets('Test that loaded announcement then click reload',
        (tester) async {
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial().copyWith(
          announcement: announcementMock,
        ),
      );

      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
            child: const AnnouncementWidget(),
          ),
        ),
      );

      final loadingIndicator =
          find.byKey(const Key('announcementLoadingIndicator'));
      final reloadIcon = find.byKey(const Key('announcementReloadIcon'));
      final announcementDescription =
          find.byKey(const Key('announcementDescription'));
      final closeIcon = find.byKey(const Key('announcementCloseIcon'));

      expect(loadingIndicator, findsNothing);
      expect(reloadIcon, findsOneWidget);
      expect(announcementDescription, findsOneWidget);
      expect(closeIcon, findsOneWidget);

      await tester.tap(reloadIcon);

      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial().copyWith(
          isLoading: true,
          announcement: announcementMock,
        ),
      );

      await tester.pumpWidget(
        MaterialFrameWrapper(
          key: UniqueKey(),
          child: BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
            child: const AnnouncementWidget(),
          ),
        ),
      );

      expect(loadingIndicator, findsOneWidget);
      expect(reloadIcon, findsNothing);
      expect(announcementDescription, findsOneWidget);
      expect(closeIcon, findsOneWidget);
    });

    testWidgets('Test that when user click close icon', (tester) async {
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial().copyWith(
          announcement: announcementMock,
        ),
      );

      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
            child: const AnnouncementWidget(),
          ),
        ),
      );

      final loadingIndicator =
          find.byKey(const Key('announcementLoadingIndicator'));
      final reloadIcon = find.byKey(const Key('announcementReloadIcon'));
      final announcementDescription =
          find.byKey(const Key('announcementDescription'));
      final closeIcon = find.byKey(const Key('announcementCloseIcon'));

      expect(loadingIndicator, findsNothing);
      expect(reloadIcon, findsOneWidget);
      expect(announcementDescription, findsOneWidget);
      expect(closeIcon, findsOneWidget);

      await tester.tap(closeIcon);

      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial().copyWith(
          isClosed: true,
          announcement: Announcement.empty(),
        ),
      );

      await tester.pumpWidget(
        MaterialFrameWrapper(
          key: UniqueKey(),
          child: BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
            child: const AnnouncementWidget(),
          ),
        ),
      );

      expect(loadingIndicator, findsNothing);
      expect(reloadIcon, findsNothing);
      expect(announcementDescription, findsNothing);
      expect(closeIcon, findsNothing);
    });

    testWidgets('Test that loaded announcement but empty description',
        (tester) async {
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial().copyWith(
          isLoading: false,
          announcement: Announcement.empty(),
        ),
      );

      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: Scaffold(
            body: BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock,
              child: const AnnouncementWidget(),
            ),
          ),
        ),
      );

      final loadingIndicator =
          find.byKey(const Key('announcementLoadingIndicator'));
      final reloadIcon = find.byKey(const Key('announcementReloadIcon'));
      final announcementDescription =
          find.byKey(const Key('announcementDescription'));
      final closeIcon = find.byKey(const Key('announcementCloseIcon'));

      expect(loadingIndicator, findsNothing);
      expect(reloadIcon, findsNothing);
      expect(announcementDescription, findsNothing);
      expect(closeIcon, findsNothing);
    });

    testWidgets(
        'Test that loaded announcement and havent change UI while announcement not change',
        (tester) async {
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial().copyWith(
          isLoading: true,
          announcement: announcementMock,
        ),
      );
      final expectedStates = [
        AnnouncementState.initial().copyWith(
          announcement: announcementMock,
          isLoading: true,
        ),
        AnnouncementState.initial().copyWith(
          announcement: announcementMock,
          isLoading: true,
        ),
      ];

      whenListen(announcementBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: Scaffold(
            body: BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock,
              child: const AnnouncementWidget(),
            ),
          ),
        ),
      );

      final loadingIndicator =
          find.byKey(const Key('announcementLoadingIndicator'));
      final reloadIcon = find.byKey(const Key('announcementReloadIcon'));
      final announcementDescription =
          find.byKey(const Key('announcementDescription'));
      final closeIcon = find.byKey(const Key('announcementCloseIcon'));

      expect(loadingIndicator, findsOneWidget);
      expect(reloadIcon, findsNothing);
      expect(announcementDescription, findsOneWidget);
      expect(closeIcon, findsOneWidget);
    });
  });
}
