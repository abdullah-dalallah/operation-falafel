import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/screens/profile/profile_pages/add_new_address.dart';
import 'package:operation_falafel/screens/profile/profile_pages/update_address.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class SavedAddress extends StatefulWidget{
  @override
  State<SavedAddress> createState() => _SavedAddressState();
}

class _SavedAddressState extends State<SavedAddress> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(

          backgroundColor: Colors.transparent,
          appBar:AppBar(
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon:
              (Localizations.localeOf(context).languageCode=='en')?
              const ImageIcon(
                AssetImage("assets/images/back_new.png",),
                size: 35,
              ):
              const ImageIcon(
                AssetImage("assets/images/back_arabic.png",),
                size: 35,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title:Text(getTranslated(context, "operationFalafelLogo")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyTitle")!}", fontWeight: FontWeight.bold),),
            actions: [],
          ),
          body: Center(
            child: Column(
              children: [
                Text(getTranslated(context, "savedAddressTitl")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),),
                const  SizedBox(height: 15,),
                Expanded(
                  child: ListView(
                     shrinkWrap: true,
                     children: [
                       Container(
                         decoration: const BoxDecoration(
                           color: Colors.transparent,
                           borderRadius: BorderRadius.only(
                             topRight: Radius.circular(10),
                             bottomLeft: Radius.circular(10),
                             topLeft: Radius.circular(10),
                             bottomRight: Radius.circular(10),
                           ),
                           // border: Border.all(
                           //   width: 0.5,
                           //   color: Colors.white,
                           //   style: BorderStyle.solid,
                           // ),
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Dubai - Jumeirah Lake Tower -ma...", style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.amber, fontSize:14 )),
                                 Text("Flat | Jumeirah Lakes Tower", style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize:13 )),
                               ],
                             ),
                            const SizedBox(width: 20,),
                             SizedBox(

                               child: Row(
                                 children: [
                                   SizedBox(
                                     width:25,
                                     height:25,

                                     child: ElevatedButton(
                                         onPressed: () {
                                           PersistentNavBarNavigator.pushNewScreen(
                                             context,
                                             screen: UpdateAddress(),
                                             withNavBar: true, // OPTIONAL VALUE. True by default.
                                             pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                           );
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
                                             textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15))),
                                         child: const Icon(Icons.mode_edit_outline_outlined, color: Colors.white,size: 15,)
                                     ),
                                   ),
                                   IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.white54,))
                                 ],
                               ),
                             ),

                           ],
                         ),
                       ),




                     ],
                   ),
                ),

                SizedBox(
                    width: 330,
                    height: 38,
                    child: ElevatedButton(
                        onPressed: (){
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: AddNewAddress(),
                            withNavBar: true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:  MaterialStateProperty.all<Color>(Colors.amber),
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side:const BorderSide(color: Colors.transparent,width: 1.5)
                              )
                          ),


                        ),
                        child: Text(getTranslated(context, "addNewAddress")!,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize:17 ),)

                    )
                ),
                const SizedBox(height: 20,),

              ],
            ),
          ),
        ),
      ],
    );
  }
}