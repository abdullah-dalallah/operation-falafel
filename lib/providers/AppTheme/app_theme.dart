import 'package:flutter/cupertino.dart';

class AppTheme  with ChangeNotifier{
  Map _fontSizes = {
    "AR": {
      "LogoTitle":21.0,
      "TitleHeader1": 20.0,
      "TitleHeader2": 25.0,
      "Header1": 10.0,
      "Header2": 13.0,
      "Header3": 15.0,
      "Header4": 17.0,
      "Header5": 20.0
    },
    "EN": {
      "LogoTitle":20.0,
      "TitleHeader1": 35.0,
      "TitleHeader2": 45.0,
      "Header1": 10.0,
      "Header2": 13.0,
      "Header3": 15.0,
      "Header4": 17.0,
      "Header5": 20.0
    }
  };
  Map get fontSizes => _fontSizes;
  set fontSizes(Map value) {_fontSizes = value;}

  Map _homePage ={
    "AppBar": {
      "DrawerIcon": { "ImageIcon":"imagePath", "Size":""},
      "SearchAction": {"ImageIcon":"imagePath", "Size":""}
    },
    "Body": {
      "LocationWidget":{
        "LocationIcon": {"ImageIcon":"imagePath", "Size":""},
        "LocationTile": {"Data": "text data", "Color": "text color", "Textfamily": "textFamily"},
        "LocationChangeButton": {"Data": "text data", "Color": "text color", "Textfamily": "textFamily"}
      },
      "OrderNowButtonWidget": {"Data": "Them Text", "Color": "", "TextFamily": "textFamily", "BackGroundColor": "color in hex"},
      "DashboardWidget": {
        "HeaderTitle":{
          "CreditText": {"Data": "text data", "Color": "text color", "TextFamily": "textFamily"},
          "Text": {"Data": "text data", "Color": "text color", "TextFamily": "textFamily"}
        },
        "Buttons": {
          "MyCode": {"visibility":"true","ImageIcon":"imagePath", "Size":"", "Data": "text data", "Color": "text color", "TextFamily": "textFamily"},
          "MyRewards": {"visibility":"true","ImageIcon":"imagePath", "Size":"", "Data": "text data", "Color": "text color", "TextFamily": "textFamily"},
          "ReferFriend": {"visibility":"true","ImageIcon":"imagePath", "Size":"", "Data": "text data", "Color": "text color", "TextFamily": "textFamily"},
          "TransferCredit": {"visibility":"true","ImageIcon":"imagePath", "Size":"", "Data": "text data", "Color": "text color", "TextFamily": "textFamily"}
        }
      }
    }
  };


  Map get homePage => _homePage;
  set homePage(Map value) {
    _homePage = value;
  }

  AppTheme({fontSizes,homePage}){}
  Map<String, dynamic> toJson() {
    return {
      "fontSizes":this.fontSizes,
      "homePage":this.homePage,
  };}
  factory AppTheme.fromJson(Map<String, dynamic> parsedJson) {
    return  AppTheme(
      fontSizes:parsedJson['fontSizes'] ?? "",
      homePage:parsedJson['homePage'] ?? "",

    );
  }





}