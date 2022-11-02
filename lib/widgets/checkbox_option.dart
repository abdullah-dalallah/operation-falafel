import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxOption extends StatelessWidget{
  final bool value;
  final String label;
  final String text;
  final bool addOnFlag;
  final ValueChanged onChanged;
  const CheckboxOption({super.key,
    required this.value,
    required this.label,
    required this.text,
    required this.onChanged,
    required this.addOnFlag
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
          color: Colors.amber,
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

  Widget _buildText() {
    return Text(
      text,
      style: const TextStyle(color: Colors.green, fontSize: 15,fontWeight: FontWeight.w300),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: InkWell(
        onTap: () => onChanged(value),
        splashColor: Colors.grey.withOpacity(0.5),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              _buildLabel(),
              const SizedBox(width: 10),
              _buildText(),
              /// - Pluse & minuse
              Expanded(child: SizedBox(width: 10,)),
              Visibility(
                visible: (addOnFlag)?true:false,
                child: Align(
                    alignment:Alignment.bottomCenter,
                    child: Container(
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width:30,
                            height:25,

                            child: ElevatedButton(
                              onPressed: () {},
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
                          const SizedBox(width:30, child: Text("9",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),),
                          SizedBox(
                            width:30,
                            height:25,

                            child: ElevatedButton(
                              onPressed: () {},
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

              ),
             
            ],
          ),
        ),
      ),
    );
  }

}