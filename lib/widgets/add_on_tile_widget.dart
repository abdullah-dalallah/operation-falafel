import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddOnTileWidget extends StatefulWidget{
  final String text;
  final String priceText;
  Color? colorOfText;
  final fontFamily;
  int quantity;
  final ValueChanged onChanged;
  AddOnTileWidget({super.key,required this.text,required this.priceText, this.colorOfText,required this.quantity,required this.fontFamily,required this.onChanged,});

  @override
  State<AddOnTileWidget> createState() => _AddOnTileWidgetState();
}

class _AddOnTileWidgetState extends State<AddOnTileWidget> {

  int addCount = 0;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(8),
      child: Row(
        children: [
          /// - pluse & minus
          Align(
            alignment:Alignment.centerRight,
            child: Container(
              width: 80,
              decoration:const BoxDecoration(
                borderRadius:  BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                // border: Border.all(
                //   width: 0.8,
                //   color: Colors.white,
                //   style: BorderStyle.solid,
                // ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// - minus
                  SizedBox(
                    width:25,
                    height:25,

                    child: ElevatedButton(
                      onPressed: () {
                        // setState(() {
                        //   if(widget.quantity>0){ widget.quantity -= 1; }
                        // });
                        // widget.onChanged(widget.quantity);
                        widget.onChanged("minus");

                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              (Localizations.localeOf(context).languageCode=='en')?
                              const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft:     Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                  ),
                                  side: BorderSide(color: Colors.transparent)
                              ):
                              (Localizations.localeOf(context).languageCode=='ar')?
                              const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomRight:     Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  side: BorderSide(color: Colors.transparent)
                              ):
                              const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft:     Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                  ),
                                  side: BorderSide(color: Colors.transparent)
                              )
                          ),
                          elevation:MaterialStateProperty.all(0),
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                          backgroundColor: MaterialStateProperty.all(Colors.amber),
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
                      child:const Icon(Icons.remove,size: 18,),
                    ),
                  ),
                  SizedBox(width:30, child: Text("${widget.quantity}",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),),
                  /// - Pluse
                  SizedBox(
                    width:25,
                    height:25,

                    child: ElevatedButton(
                      onPressed: () {
                        // setState(() {
                        //   if(widget.quantity>=0){
                        //     print("test");
                        //     widget.quantity += 1;
                        //
                        //   }
                        // });
                        widget.onChanged("pluse");
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              (Localizations.localeOf(context).languageCode=='en')?
                              const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomRight:     Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  side: BorderSide(color: Colors.transparent)
                              ):
                              (Localizations.localeOf(context).languageCode=='ar')?
                              const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft:     Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                  ),
                                  side: BorderSide(color: Colors.transparent)
                              ):
                              const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomRight:     Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  side: BorderSide(color: Colors.transparent)
                              )
                          ),
                          elevation:MaterialStateProperty.all(0),
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                          backgroundColor: MaterialStateProperty.all(Colors.amber),
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
                      child: const Icon(Icons.add,size: 18,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          /// - pluse & minus
          const SizedBox(width: 10,),
          /// - Text
          Text(widget.text, style:  TextStyle(
              color:
              (widget.colorOfText!=null)?
              (widget.quantity == 0)?
              widget.colorOfText!.withOpacity(0.5)
                  :widget.colorOfText!
                  :Colors.white,

              fontSize: 15,fontWeight: FontWeight.w300, fontFamily: widget.fontFamily),),


          /// - Text
          const Expanded(child: SizedBox(width: 10,)),

          /// - Price
          (widget.priceText!=null)?
          Text(widget.priceText!, style:  TextStyle(
              color:
              (widget.colorOfText!=null)?
              (widget.quantity == 0)?
              widget.colorOfText!.withOpacity(0.5)
                  :widget.colorOfText!
                  :Colors.white,

              fontSize: 15,fontWeight: FontWeight.w300, fontFamily: widget.fontFamily),):
          const SizedBox(width: 1,),

          /// - Price

        ],
      ),
    );
  }
}