import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/data/snackBarGenerator.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/SavedAddressPage/saved_address_page.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/ProfileProviders/models/saved_address_list_res_model.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:operation_falafel/widgets/loading_widget.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../providers/ProfileProviders/profile_provider.dart';
import '../../screens/profile/profile_pages/update_address.dart';

class SavedAddressListWidget extends StatefulWidget{
  Language? lng;
  SavedAddressPage? savedAddressPage; 
  
  
  SavedAddressListWidget({ this.lng,  this.savedAddressPage, super.key});

  @override
  State<SavedAddressListWidget> createState() => _SavedAddressListWidgetState();
}

class _SavedAddressListWidgetState extends State<SavedAddressListWidget> {

  void showDeleteAddressDialog(BuildContext context,SavedAddressPage savedAddressPage , Language lng,SavedAddressItem savedAddressItem  ) {
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
                    height: 190,
                    constraints:const BoxConstraints(maxWidth: 450, ),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding:const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(40)),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,

                      body:Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(child:MyText("Are you sure you want to delete this address?",
                                style: TextStyle(
                                  fontFamily: "${lng.titleHeader2.textFamily}",
                                  color: Colors.white,
                                  fontSize: lng?.titleHeader1.size.toDouble(),

                                ),),),
                            ),


                            const SizedBox(height: 10,),
                            // MyText(profilePage.body.logoutDialog!.dialogBodyTitle!.data,
                            //   style: TextStyle(
                            //     fontFamily: "${lng.header3.textFamily}",
                            //     color: Color(int.parse(profilePage!.body.logoutDialog!.dialogBodyTitle!.color as String)),
                            //     fontSize: lng?.header3.size.toDouble(),
                            //
                            //   ),
                            //
                            // ),
                            // const SizedBox(height: 10,),

                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(

                                      onPressed: () {
                                        var authProvider = Provider.of<AuthProvider>(context,listen: false);
                                        String token =authProvider.loggedInUser?.token??"";
                                        Provider.of<ProfileProvider>(context,listen: false).deleteAddress(userToken: token,addressId: savedAddressItem.id! ).then((res) {
                                          if(res.statusCode==200){
                                            Provider.of<ProfileProvider>(context,listen: false).savedAddressList.savedAddressItem?.remove(savedAddressItem);
                                          }else{
                                            SnackbarGenerator(context).snackBarGeneratorToast("User address delete Failed!",);
                                          }
                                          Navigator.pop(context);
                                        });

                                      },
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .all(
                                                      Radius.circular(10)),
                                                  side: BorderSide(
                                                      color: Colors
                                                          .transparent,
                                                      width: 1)
                                              )
                                          ),
                                          overlayColor: MaterialStateProperty.all(Colors.black12),
                                          elevation: MaterialStateProperty.all(0),
                                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                                          backgroundColor: MaterialStateProperty.all(Colors.amber),

                                          foregroundColor: MaterialStateProperty.all(Colors.black),
                                          padding: MaterialStateProperty.all(const EdgeInsets.only(top: 10, bottom: 10,right: 10, left: 10)),
                                          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 12))),
                                      child: MyText(
                                        "Delete",
                                        style:

                                        TextStyle(
                                          fontFamily: "${lng.titleHeader1.textFamily}",
                                          color: Colors.white,
                                          fontSize: lng?.header5.size.toDouble(),

                                        ),
                                        // TextStyle(
                                        //   fontFamily: getTranslated(context, "fontFamilyBody")!,
                                        //   color: Colors.white,
                                        //   fontWeight: FontWeight.w300,),


                                        textAlign: TextAlign.center,),


                                    ),
                                  ),
                                ),
                              ],
                            ),



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
    return
      Consumer<ProfileProvider>(builder: (context, profileProvider, child){
        bool _savedAddressListloading = profileProvider.savedAddressList.success!= null;
        return
          _savedAddressListloading?
          Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50),
            child: ListView.builder(
              itemCount: profileProvider.savedAddressList.savedAddressItem?.length,
              // physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// - Address title
                            MyText("${profileProvider.savedAddressList.savedAddressItem![index].area} - ${profileProvider.savedAddressList.savedAddressItem![index].name}",
                              style:TextStyle(
                                  fontFamily: widget.lng?.header3.textFamily,
                                  color: Color(int.parse(widget.savedAddressPage?.body.addressList.title.color as String)),
                                  fontSize: widget.lng?.header3.size.toDouble()
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            /// - Address Sub Title
                            MyText("${profileProvider.savedAddressList.savedAddressItem![index].building}",
                              style: TextStyle(
                                  fontFamily: widget.lng?.header3.textFamily,
                                  color: Color(int.parse(widget.savedAddressPage?.body.addressList.subTitle.color as String)),
                                  fontSize: widget.lng?.header3.size.toDouble()
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                      SizedBox(

                        child: Row(
                          children: [
                            /// - Edit Address
                            SizedBox(
                              width: 25,
                              height: 25,

                              child: ElevatedButton(
                                  onPressed: () {
                                    // context.go("${GoRouter.of(context).routerDelegate.currentConfiguration.fullPath}/${UpdateAddress.routeName}");

                                    PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: UpdateAddress(savedAddressItem:profileProvider.savedAddressList.savedAddressItem![index] ),
                                      withNavBar: true,
                                      // OPTIONAL VALUE. True by default.
                                      pageTransitionAnimation: PageTransitionAnimation
                                          .cupertino,
                                    );
                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                                          borderRadius: BorderRadius
                                              .all(
                                              Radius.circular(
                                                  100)),
                                          side: BorderSide(
                                              color: Colors
                                                  .transparent,
                                              width: 1)
                                      )),
                                      overlayColor: MaterialStateProperty.all(Colors.white30),
                                      elevation: MaterialStateProperty.all(0),
                                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                                      backgroundColor: MaterialStateProperty.all(Color(int.parse(widget.savedAddressPage?.body.addressList.editButton.backGroundColor as String))),
                                      foregroundColor: MaterialStateProperty.all(Colors.white),
                                      padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15))),
                                  child: const Icon(
                                    Icons.mode_edit_outline_outlined,
                                    color: Colors.white, size: 15,)
                              ),
                            ),
                            /// - Delete Address
                            IconButton(
                                onPressed: () {

                                  showDeleteAddressDialog( context, widget!.savedAddressPage! , widget.lng!, profileProvider.savedAddressList.savedAddressItem![index]);
                                  
                                  
                                
                                },
                                icon: ImageIcon(
                                  NetworkImage(widget.savedAddressPage?.body.addressList.deleteButton.imageIcon as String),
                                  size: double.parse(widget.savedAddressPage?.body.addressList.deleteButton.mobileSize as String),
                                  color: Colors.white54,

                                )
                            ),


                          ],
                        ),
                      ),

                    ],
                  ),
                );
              },
            ),
          ),
        ):
          Expanded(child: LoadingWidget())
        ;
      });



  }
}