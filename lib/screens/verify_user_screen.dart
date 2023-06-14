import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/widgets/verify_user_by_otp_widget.dart';

class VerifyUserScreen extends StatefulWidget{
  final ValueChanged onChanged;
  final String layOut ;
  VerifyUserScreen(this.onChanged,{super.key,required this.layOut});
  @override
  State<VerifyUserScreen> createState() => _VerifyUserScreenState();
}

class _VerifyUserScreenState extends State<VerifyUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          appBar:AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:
              (Localizations
                  .localeOf(context)
                  .languageCode == 'en') ?
              const ImageIcon(
                AssetImage("assets/images/back_new.png",),
                size: 35,
              ) :
              const ImageIcon(
                AssetImage("assets/images/back_arabic.png",),
                size: 35,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,

          ),
          body:   Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 450,),
              child: Column(
                children: [
                  Visibility(
                      visible: true,
                      child: Expanded(child: VerifyUserByOtpWidget(  layOut: widget.layOut, (value) {
                        widget.onChanged(value);
                      }))),
                ],
              ),
            ),
          ),

        )
      ],
    );
  }
}