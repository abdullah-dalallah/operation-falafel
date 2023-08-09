import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/network_constants.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/NetworkPaymentProvider/network_two_stage_payment_provider.dart';

import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthenticationScreen extends StatefulWidget {
   String? authenticationUrl;
   String? acsPaReq ;
   String? acsMd ;
   String? acsUrl ;
   String? accessToken ;
   final String directPaymentLink ;


  AuthenticationScreen({ this.authenticationUrl, this.acsPaReq, this.acsMd,  this.acsUrl,  this.accessToken, required this.directPaymentLink});

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _webViewKey = UniqueKey();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text('Authentication Payment',style: TextStyle(fontFamily: getTranslated(context,"fontFamilyBody")),),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),)
      ),
      body: WebViewWidget(

        controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {

                // Update loading bar.
              },
              onPageStarted: (String url) {
                print("Start URL : ${url}");
              print("Order ref: ${getStringAfterRef(url)}");
              if(getStringAfterRef(url)!=null){
                String? accessToken = Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestTokenResponse.accessToken;
                _showLoadingDialog(context);
                Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).checkStatusOfPayment(accessToken!,getStringAfterRef(url)!,NetworkConstants.outletReference ).then((value)
                {
                  print(value);
                  if(value.statusCode ==200){
                    Navigator.pop(context);
                    // _showSuccessDialog(context);
                    // Navigator.pop(context);
                    Navigator.pop(context);
                  }

                });


              }},
              onPageFinished: (String url) {

              },
              onWebResourceError: (WebResourceError error) {
                print("Error URL:${error}");
              },
              onNavigationRequest: (NavigationRequest request) {
                print("Req URL : ${request}");
                if (request.url.startsWith('${widget.authenticationUrl}')) {

                //  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(
            Uri.parse(widget.directPaymentLink),

          ),


          // ..loadRequest(
          //     Uri.parse(
          //     // "https://api-gateway.sandbox.ngenius-payments.com/transactions/outlets/b5bb339e-a5cc-4291-9c92-4af232963a70/orders/0a024fde-1c84-496e-bcb0-763a03e0ae92/payments/640a4c71-481d-4174-884a-d8ec2f60e046/card/3ds"
          //         widget.acsUrl!
          //     ),
          //     method: LoadRequestMethod.post,
          //
          //       body:
          //
          //       // Uint8List.fromList(
          //       //   utf8.encode(
          //       //     jsonEncode("YOUR MAP<STRING, DYNAMIC>"),
          //       //   ),
          //       // ),
          //       Uint8List.fromList(utf8.encode("acsPaReq=${widget.acsPaReq}&acsMd=${widget.acsMd}&PaRes=${widget.acsPaReq}&MD=7fb7990e65b2c656&href=${widget.authenticationUrl}")),//&acsUrl=${widget.acsUrl}
          //       headers: {
          //         'Content-Type': 'application/x-www-form-urlencoded',
          //         'Authorization: Bearer ':widget.accessToken!
          //       },
          //
          //   ),

      ),
    );
  }



  String? getStringAfterRef(String text) {
    final refIndex = text.indexOf("ref=");
    if (refIndex != -1) {
      return text.substring(refIndex + 4); // Adding 4 to skip "ref="
    } else {
      return null;
    }
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Payment Status Loading..."),
          // content: Text(""),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Payment Successful"),
          content: Text("Thank you for your payment!"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

}
