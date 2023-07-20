import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/SavedAddressPage/saved_address_page.dart';
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
                                      screen: UpdateAddress(),
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