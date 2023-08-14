class NotificationQuery {
  String getNotificationQuery() {
    return '''
     query getClevertapNotifications(\$page: Int!, \$perPage: Int!) {
  getClevertapNotifications(request: {perPage: \$perPage, page: \$page}) {
    message
    data {
      id
      userName
      type
      title
      imageUrl
      description
      isRead
      createdAt
      updatedAt
      orderNumber
      returnRequestNumber
      paymentNumber
      saleDocument
      
    }
    pagination {
      totalPage
      totalItem
      totalUnread
      
    }
    
  }
}
    ''';
  }

  String clearNotification() {
    return '''mutation clearAllClevertapNotifications {
  clearAllClevertapNotifications {
    message
   
  }
}''';
  }

  String readNotification() {
    return '''mutation changeClevertapNotificationStatus(\$notificationId: Int!) {
  changeClevertapNotificationStatus(input: {notificationId: \$notificationId}) {
    message

  }
}''';
  }
}
