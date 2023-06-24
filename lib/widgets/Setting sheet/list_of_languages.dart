import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/main.dart';
import 'package:operation_falafel/providers/settings_provider/setting_provider.dart';
import 'package:operation_falafel/widgets/Setting%20sheet/language_radio_option.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:provider/provider.dart';

class ListOfLanguages extends StatefulWidget{
  final String? selectedLanguage;
  ScrollController scrollController;
  ListOfLanguages({required this.scrollController,this.selectedLanguage,super.key});


  @override
  State<ListOfLanguages> createState() => _ListOfLanguagesState();
}

class _ListOfLanguagesState extends State<ListOfLanguages> {

  void _changeLanguage (String languageCode) async {
    Locale _temp =await setLocale(languageCode);

    MyApp.setLocale(context,_temp);
  }

  String? _selectedLanguage;
  ValueChanged<String?> _valueChangedHandler() {

    return (value){
      print(value);
      setState(() {
        // if(_selectedLanguage == value){
        //   _selectedLanguage =null;
        // }
        // else{

        // _changeLanguage(value!);
          _selectedLanguage = value!;
        // }

      });

    };
  }
 void setLanguage(){
   _selectedLanguage = Localizations.localeOf(context).languageCode.toString();
 }
  @override
  Widget build(BuildContext context) {
    // _selectedLanguage = Localizations.localeOf(context).languageCode.toString();
   return

     Consumer<SettingProvider>(
       builder: (context, settingProvider, child) {
         bool loadingLanguages= settingProvider.languages!=null;
        return loadingLanguages?Expanded(
           child: ListView.builder(
               controller: widget.scrollController,
               itemCount:settingProvider.languages!.body!.length,
               physics: const BouncingScrollPhysics(),
               itemBuilder: (context, index) {
                 return   LanguageRadioOption<String>(
                   iconImage: "${settingProvider.languages!.body![index].icon}",
                   value: '${settingProvider.languages!.body![index].code}',
                   groupValue: _selectedLanguage,
                   onChanged: _valueChangedHandler(),
                   label: '1',
                   name: '${settingProvider.languages!.body![index].name}',
                 );
               }
           ),
         )
        :LoadingPage()
        ;
       }
     );


  }

  @override
  void initState() {
    super.initState();
    _selectedLanguage = widget.selectedLanguage;
  }
}