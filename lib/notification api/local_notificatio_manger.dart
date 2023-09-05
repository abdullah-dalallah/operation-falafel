import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';

import '../main.dart';
import '../screens/notification_details.dart';


class LocalNotificationManger {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();


  final _androidChannel = const AndroidNotificationChannel(
    "high_importance_channel",
    "High Importance Notifications",
    description: 'This channel is used for important notification',
    importance: Importance.max,
  );
 Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings("@drawable/ic_launcher");
    DarwinInitializationSettings initializationSettingsIos = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification: (id, title, body,payload){}
    );
    InitializationSettings settings = InitializationSettings(android: initializationSettingsAndroid,iOS: initializationSettingsIos);
     await notificationsPlugin.initialize(settings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse
     );
    final platform = notificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }


 Future<void>simpleNotificationShow(RemoteMessage message )async{
   AndroidNotificationDetails androidNotificationDetails =  AndroidNotificationDetails(_androidChannel.id,
       _androidChannel.name,
       priority: Priority.max,
       importance: Importance.max,
       icon:'@drawable/ic_launcher',
       channelShowBadge: true,
       largeIcon: DrawableResourceAndroidBitmap('@drawable/ic_launcher')
   );
   NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);

   await notificationsPlugin.show(message.notification.hashCode,message.notification!.title, message.notification!.body, notificationDetails,payload:jsonEncode(message.toMap()) );
 }


  Future<void>multipleNotificationShow(RemoteMessage message )async{
    AndroidNotificationDetails androidNotificationDetails =  AndroidNotificationDetails(_androidChannel.id,
        _androidChannel.name,
        priority: Priority.max,
        importance: Importance.max,
        groupKey: 'commonMessage'
    );
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);

     notificationsPlugin.show(message.notification.hashCode,message.notification!.title, message.notification!.body, notificationDetails,payload:jsonEncode(message.toMap()) );

     Future.delayed(const Duration(microseconds: 1000),(){
       notificationsPlugin.show(1,message.notification!.title, message.notification!.body, notificationDetails,payload:jsonEncode(message.toMap()) );
     });
    Future.delayed(const Duration(microseconds: 1500),(){
      notificationsPlugin.show(2,message.notification!.title, message.notification!.body, notificationDetails,payload:jsonEncode(message.toMap()) );
    });

    List<String> lines = ['user1','user2','user3'];

    InboxStyleInformation inboxStyleInformation = InboxStyleInformation(lines, contentTitle: '${lines.length} messages', summaryText: '${message.notification!.title}');

    AndroidNotificationDetails androidNotificationSpesific = AndroidNotificationDetails(
      'groupChannelId',
      'groupChannelTitle',
      styleInformation: inboxStyleInformation,
      groupKey:  'commonMessage',
        setAsGroupSummary: true
    );

    NotificationDetails platformChannelSpe = NotificationDetails(android: androidNotificationSpesific);
    await notificationsPlugin.show(3, "Attention", '${lines.length} messages', platformChannelSpe);

  }



  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
  Future<void>bigPictureNotificationShow(RemoteMessage message )async{
    final String largeIconPath = await _downloadAndSaveFile(
        '${message.notification!.android!.imageUrl}', 'largeIcon');
    final String bigPicturePath = await _downloadAndSaveFile(
        '${message.notification!.android!.imageUrl}', 'bigPicture');
   BigPictureStyleInformation bigPictureStyleInformation =
      BigPictureStyleInformation(
          FilePathAndroidBitmap(bigPicturePath),
          largeIcon: FilePathAndroidBitmap(largeIconPath),
          contentTitle: 'overridden <b>big</b> content title',
          htmlFormatContentTitle: true,
          summaryText: 'summary <i>text</i>',
          htmlFormatSummaryText: true
          // DrawableResourceAndroidBitmap("${message.notification!.android!.imageUrl}"),
          // contentTitle: '${message.notification!.title}',


      );

    AndroidNotificationDetails androidNotificationDetails =  AndroidNotificationDetails(_androidChannel.id,
        _androidChannel.name,
        priority: Priority.max,
        importance: Importance.max,
        styleInformation: bigPictureStyleInformation
    );
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);

    await notificationsPlugin.show(message.notification.hashCode,message.notification!.title, message.notification!.body, notificationDetails,payload:jsonEncode(message.toMap()) );
  }



  // void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
  //   final String? payload = notificationResponse.payload;
  //   if (notificationResponse.payload != null) {
  //     print('notification payload: $payload');
  //     await  navigatorKey.currentState?.pushNamed(
  //         NotificationDetailsPage.route,
  //         arguments: payload
  //     );
  //   }
  //
  // }

  void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
// this should print now
    print(notificationResponse.payload);
// let's add some switch statements here
    switch (notificationResponse.notificationResponseType) {
// triggers when the notification is tapped
      case NotificationResponseType.selectedNotification:
        if (notificationResponse.payload != null) {
          try {
            Map notificationPayload =
                jsonDecode("${notificationResponse!.payload}") ;
            // print(notificationResponse.payload);
            // print('notification payload: ${notificationResponse.payload}');
            await  navigatorKey.currentState?.pushNamed(
                NotificationDetailsPage.route,
                arguments:  RemoteMessage.fromMap(notificationPayload as Map<String,dynamic>)
            );
                // prints the decoded JSON
          } catch (error) {
            print('Notification payload error $error');
          }
        }
        break;
      default:
    }
  }

}