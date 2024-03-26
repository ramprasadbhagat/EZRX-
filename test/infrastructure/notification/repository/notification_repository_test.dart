import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/notification/entities/notification.dart';
import 'package:ezrxmobile/domain/notification/entities/notification_data.dart';
import 'package:ezrxmobile/infrastructure/notification/datasource/notification_local.dart';
import 'package:ezrxmobile/infrastructure/notification/datasource/notification_remote.dart';
import 'package:ezrxmobile/infrastructure/notification/repository/notification_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class NotificationLocalDataSourceMock extends Mock
    implements NotificationLocalDataSource {}

class NotificationRemoteDataSourceMock extends Mock
    implements NotificationRemoteDataSource {}

void main() {
  late Config mockConfig;
  late NotificationRemoteDataSource remoteDataSource;
  late NotificationLocalDataSource localDataSource;
  late NotificationRepository repository;
  final notificationMockList = Notifications.empty();
  setUpAll(() {
    mockConfig = MockConfig();
    localDataSource = NotificationLocalDataSourceMock();
    remoteDataSource = NotificationRemoteDataSourceMock();

    repository = NotificationRepository(
      config: mockConfig,
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  });
  group('NotificationRepository should - ', () {
    test(' get Notification successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => localDataSource.getNotificationList(),
      ).thenAnswer((invocation) async => notificationMockList);

      final result = await repository.getNotification(
        page: 1,
        perPage: 24,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' get Notification fail locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => localDataSource.getNotificationList(),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );

      final result = await repository.getNotification(
        page: 1,
        perPage: 24,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test(' get Notification successfully Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => remoteDataSource.getNotification(
          page: 1,
          perPage: 24,
        ),
      ).thenAnswer((invocation) async => notificationMockList);

      final result = await repository.getNotification(
        page: 1,
        perPage: 24,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' get Notification fail Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => remoteDataSource.getNotification(
          page: 1,
          perPage: 24,
        ),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );

      final result = await repository.getNotification(
        page: 1,
        perPage: 24,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test(' read Notification successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => localDataSource.readNotification(),
      ).thenAnswer((invocation) async => true);

      final result = await repository.readNotification(
        notificationId: 13165,
        previousNotificationDataList: [],
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test(' read Notification successfully remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => remoteDataSource.readNotification(
          notificationId: 13160,
        ),
      ).thenAnswer((invocation) async => true);

      final result = await repository.readNotification(
        notificationId: 13160,
        previousNotificationDataList: [
          NotificationData.empty().copyWith(
            isRead: true,
            id: 13160,
          ),
        ],
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' read Notification when readed is false  ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => remoteDataSource.readNotification(
          notificationId: 13160,
        ),
      ).thenAnswer((invocation) async => false);

      final result = await repository.readNotification(
        notificationId: 13160,
        previousNotificationDataList: [],
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' read Notification id not matching remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => remoteDataSource.readNotification(
          notificationId: 13160,
        ),
      ).thenAnswer((invocation) async => true);

      final result = await repository.readNotification(
        notificationId: 13160,
        previousNotificationDataList: [
          NotificationData.empty().copyWith(
            id: 13245,
          ),
        ],
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' read Notification fail remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => remoteDataSource.readNotification(
          notificationId: 1,
        ),
      ).thenThrow(
        Exception('fake-error'),
      );

      final result = await repository.readNotification(
        notificationId: 1,
        previousNotificationDataList: [],
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test(' delete Notification successfully remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => remoteDataSource.deleteAllNotifications(),
      ).thenAnswer((invocation) async => true);

      final result = await repository.deleteAllNotificationList();
      expect(
        result.isRight(),
        true,
      );
    });
    test(' delete Notification fail Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => remoteDataSource.deleteAllNotifications(),
      ).thenThrow(
        Exception('fake-error'),
      );

      final result = await repository.deleteAllNotificationList();
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
