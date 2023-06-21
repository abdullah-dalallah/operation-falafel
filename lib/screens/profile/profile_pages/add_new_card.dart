import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/AddNewCardPage/add_new_card_page.dart';
import 'package:operation_falafel/models/AppThemeModels/FontSizes/Language/lang.dart';
import 'package:operation_falafel/providers/AppTheme/theme_provider.dart';
import 'package:operation_falafel/providers/ProfileProviders/profile_provider.dart';
import 'package:operation_falafel/widgets/background.dart';
import 'package:provider/provider.dart';

class AddNewCard extends StatefulWidget{
  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  @override
  Widget build(BuildContext context) {

    return Consumer2<ThemeProvider, ProfileProvider>(builder: (context, appTheme,profileProvider, child)
    {
      Language? lng = (Localizations
          .localeOf(context)
          .languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme
          .appTheme.fontSizes?.en;
      AddNewCardPage? addNewCardPage = appTheme.appTheme.designPerPage?.addNewCardPage;
      bool loadingDesign = addNewCardPage != null;


      return Stack(
        children: [
          Background(),
          Scaffold(backgroundColor: Colors.transparent,
            appBar:  AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                (Localizations.localeOf(context).languageCode == 'en') ?
                ImageIcon(
                  NetworkImage(addNewCardPage!.appBar!.backIcon!.imageIcon),
                  size: double.parse(addNewCardPage.appBar!.backIcon!.mobileSize as String),
                ) :
                ImageIcon(
                  NetworkImage(addNewCardPage!.appBar!.backIcon!.imageIcon),
                  size: double.parse(addNewCardPage?.appBar!.backIcon!.mobileSize as String),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                addNewCardPage.appBar!.title!.data,
                style: TextStyle(
                    fontFamily: "${lng?.logoTitle.textFamily}",
                    fontWeight: FontWeight.bold),),
              actions: [],
            ),
            body: ,

          ),
        ],
      );
    });
  }
}