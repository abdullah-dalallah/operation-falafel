import 'dart:convert';


import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:operation_falafel/screens/notification_details.dart';

import '../main.dart';
import 'local_notificatio_manger.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  print("Id :${message.messageId}");
  print("Title :${message.notification?.title}");
  print("Body :${message.notification?.body}");
  print("Payload :${message.data}");
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  // final _androidChannel = const AndroidNotificationChannel(
  //       "high_importance_channel",
  //        "High Importance Notifications",
  //        description: 'This channel is used for important notification',
  //       importance: Importance.max,
  //   );
  // final _localNotifications =FlutterLocalNotificationsPlugin();



  void handleMessage(RemoteMessage? message){

    if(message==null) return ;
    print("On click ${message!.notification!.title}");
    print("Pushing to detail screen");
    navigatorKey.currentState?.pushNamed(
      NotificationDetailsPage.route,
      arguments: message
    );

    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationDetails(message:message,)));
  }


  // Future initLocalNotifications()async{
  //   DarwinInitializationSettings ios = DarwinInitializationSettings(
  //     requestAlertPermission: true,
  //     requestBadgePermission: true,
  //     requestSoundPermission: true,
  //     onDidReceiveLocalNotification: (id, title, body,payload){}
  //   );
  //   AndroidInitializationSettings android = AndroidInitializationSettings('@drawable/ic_launcher');
  //   InitializationSettings settings = InitializationSettings(android: android,iOS: ios);
  //
  //
  //   await _localNotifications.initialize(
  //     settings,
  //     onDidReceiveNotificationResponse: (NotificationResponse details){
  //         print(jsonEncode(details!) as Map<String, dynamic>);
  //        final message = RemoteMessage.fromMap(jsonEncode(details!) as Map<String, dynamic>);
  //        final message = RemoteMessage.fromMap(jsonDecode(details! as String));
  //        print(message.notification!.title);
  //        handleMessage(message);
  // //       }
  //   );
  //
  //   final platform = _localNotifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
  //   await platform?.createNotificationChannel(_androidChannel);
  // }


  Future initPushNotifications() async{
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((message) async {


      final notification = message.notification;
      if(notification == null) return ;

      LocalNotificationManger().multipleNotificationShow(message);
      /// -
      // AndroidNotificationDetails androidNotificationDetails =  AndroidNotificationDetails(_androidChannel.id,
      //   _androidChannel.name,
      //   priority: Priority.max,
      //   importance: Importance.max,
      //   icon:'@drawable/ic_launcher',
      //   channelShowBadge: true,
      //   largeIcon: DrawableResourceAndroidBitmap('@drawable/ic_launcher')
      // );
      // NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
      // await _localNotifications.show(notification.hashCode, notification.title, notification.body, notificationDetails);
      /// - old
      // _localNotifications.show(notification.hashCode, notification.title, notification.body,
      //   NotificationDetails(
      //   android: AndroidNotificationDetails(
      //    _androidChannel.id,
      //    _androidChannel.name,
      //       channelDescription: _androidChannel.description,
      //     icon:"@drawable/ic_launcher",
      //
      //   ),
      // ),
      //   payload: jsonEncode(message.toMap()),
      //
      // );

    });

  }

  Future<void> initNotifications()async{
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("Firebase Token: ${fCMToken}");
    initPushNotifications();
    LocalNotificationManger().initNotification();
    // initLocalNotifications();
  }
}