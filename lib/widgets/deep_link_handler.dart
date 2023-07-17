import 'dart:async';

import 'package:flutter/material.dart';
import 'package:operation_falafel/screens/drawer_pages/locations.dart';
import 'package:operation_falafel/screens/register%20&%20login%20pages/enter_of_world.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;

class DeepLinkHandlerWidget extends StatefulWidget {
  @override
  _DeepLinkHandlerWidgetState createState() => _DeepLinkHandlerWidgetState();
}

class _DeepLinkHandlerWidgetState extends State<DeepLinkHandlerWidget> {
  late StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    _initDeepLinkListener();
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  void _initDeepLinkListener() {
    _sub = uriLinkStream.listen((Uri? uri) {
      // Handle the deep link here
      print("Received deep link: $uri");

      if (uri!.path == '/details') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Locations()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Locations()),
        );
      }
    }, onError: (err) {
      print("Error handling deep link: $err");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deep Link Handler'),
      ),
      body: Center(
        child: Text('Waiting for deep link...'),
      ),
    );
  }
}