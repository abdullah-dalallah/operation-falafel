import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class RegisterCheckbox extends StatelessWidget{
  final bool value;
  final String label;
  final String text;
  final bool addOnFlag;
  Color? colorOfBox;
  Color? colorOfText;
  String? fontFamily;
  String? priceText;
  final ValueChanged onChanged;
  RegisterCheckbox({super.key,
    required this.value,
    required this.label,
    required this.text,
    required this.onChanged,
    this.priceText,
    this.colorOfBox,
    this.colorOfText,
    required this.addOnFlag,
    this.fontFamily
  });

  Widget _buildLabel() {
    final bool isSelected = value  ;

    return Container(
      width: 22,
      height: 22,
      decoration:  BoxDecoration(
        color: Colors.transparent,
        borderRadius:const BorderRadius.only(
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          topLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        border: Border.all(
          width: 1,
          color: (colorOfBox!=null)?colorOfBox!:Colors.amber,
          style: BorderStyle.solid,
        ),
      ),
      child: Center(
        child:
        isSelected ? Image.asset("assets/images/page2_icon.png", height: 50,width: 50,)
            :null,
      ),
    );
  }

  Widget _buildText( BuildContext context) {
    return Row(

      children: [
        // RichText(
        //   text: TextSpan(
        //     text: "",
        //     style: TextStyle(color: (widget.colorOfText!=null)?widget.colorOfText!:Colors.green, fontSize: 15,fontWeight: FontWeight.w300, fontFamily: widget.fontFamily),
        //     children: <TextSpan>[
        //
        //       TextSpan(
        //           text: widget.text,
        //           style:const TextStyle(decoration: TextDecoration.underline),
        //           recognizer: TapGestureRecognizer()
        //             ..onTap = () => print('click')),
        //     ],
        //   ),
        // ),

       Text(getTranslated(context,text)!, style:  TextStyle(color: (colorOfText!=null)?colorOfText!:Colors.green, fontSize: 15,fontWeight: FontWeight.w300, fontFamily: fontFamily,decoration: TextDecoration.underline),),



      ],
    );
  }



  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (context, __, ___) {
        return Center(
          child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 450,
                    constraints: BoxConstraints(maxWidth: 450, ),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding:const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(40)),
                    child: Scaffold(
                        backgroundColor: Colors.transparent,

                        body:Center(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                Align(child:Text( getTranslated(context, "termsTitleNewUser")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),),),
                                Expanded(child: ListView(
                                  padding: EdgeInsets.all(18),
                                  children: [
                                    Text("${getTranslated(context, "terms")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white),),
                                  ],
                                )),
                              ],

                          ),
                        ),
                      )
                  ),
                ),
                Positioned(
                  top: 1,
                  right: 20,
                  child:  SizedBox(
                    width:40,
                    height:40,

                    child: ElevatedButton(
                        onPressed: () {
                         Navigator.pop(context);
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                    side: BorderSide(color: Colors.transparent,width: 1)
                                )
                            ),
                            overlayColor: MaterialStateProperty.all(Colors.white30),
                            elevation:MaterialStateProperty.all(0),
                            shadowColor: MaterialStateProperty.all(Colors.transparent),
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                        child: const Icon(Icons.close, color: Colors.white,)
                    ),
                  ),),
              ],
            ),

        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        }
        else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(8),
      child: InkWell(
        onTap: () => onChanged(value),
        splashColor: Colors.grey.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            _buildLabel(),
            const SizedBox(width: 10),
            GestureDetector(
                onTap: (){
                  showCustomDialog( context);
                },
                child: _buildText(context)),



          ],
        ),




      ),
    );
  }
}