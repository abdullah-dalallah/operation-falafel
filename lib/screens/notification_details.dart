import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationDetailsPage extends StatelessWidget{
   static const route = '/notification-details';
   // RemoteMessage? message;
   NotificationDetailsPage({ super.key});

  @override
  Widget build(BuildContext context) {
    final RemoteMessage message = ((ModalRoute.of(context)!.settings.arguments!=null && ModalRoute.of(context)!.settings.arguments!="")?ModalRoute.of(context)!.settings.arguments :null) as RemoteMessage;

    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Details"),
      ),
      body: Center(
        child: (message!=null)?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(message.notification!.android!.imageUrl!),
            Text("Title:${message.notification?.title}",style: TextStyle(fontSize: 15),),
            Text("Body:${message.notification?.body}",style: TextStyle(fontSize: 15),),
          ],
        ):SizedBox(),
      ),
    );
  }

}