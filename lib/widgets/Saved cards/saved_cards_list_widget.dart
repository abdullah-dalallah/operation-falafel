import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/SavedCardsPage/saved_cards_page.dart';
import 'package:operation_falafel/models/AppThemeModels/FontSizes/Language/lang.dart';
import 'package:operation_falafel/providers/ProfileProviders/profile_provider.dart';
import 'package:operation_falafel/widgets/loading_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class SavedCardsListWidget extends StatefulWidget{
  Language? lng;
  SavedCardsPage? savedCardsPage;
  SavedCardsListWidget({ this.lng,  this.savedCardsPage, super.key});
  @override
  State<SavedCardsListWidget> createState() => _SavedCardsListWidgetState();
}

class _SavedCardsListWidgetState extends State<SavedCardsListWidget> {


  @override
  Widget build(BuildContext context) {
    return
      Consumer<ProfileProvider>(builder: (context, profileProvider, child){
        bool cardListLoading = profileProvider.savedCards !=null;

        return
          cardListLoading?
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50),
              child: ListView.separated(
                padding: EdgeInsets.only(top: 10),
                itemCount:profileProvider.savedCards!.body!.length!,
                // profileProvider.savedAddressList.savedAddressItem?.length,
                physics: const ScrollPhysics(),
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
                              Visibility(
                                  visible:profileProvider.savedCards!.body![index].isMain ==1,
                                  child: Text("Main Card", style: TextStyle(
                                      fontFamily: widget.lng?.header3.textFamily,
                                      color: Color(int.parse(widget.savedCardsPage?.body.cardsList.subTitle.color as String)),
                                      fontSize: widget.lng?.header2.size.toDouble()
                                  ),)),
                              /// - Card title
                              Text(hideCreditCardNumber("${profileProvider.savedCards!.body![index].cardNumber}"),
                                style:TextStyle(
                                    fontFamily: widget.lng?.header3.textFamily,
                                    color: Color(int.parse(widget.savedCardsPage?.body.cardsList.title.color as String)),
                                    fontSize: widget.lng?.header4.size.toDouble()
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              /// - Card Sub Title
                              Text("${profileProvider.savedCards!.body![index].cardholderName}",
                                style: TextStyle(
                                    fontFamily: widget.lng?.header3.textFamily,
                                    color: Color(int.parse(widget.savedCardsPage?.body.cardsList.title.color as String)),
                                    fontSize: widget.lng?.header3.size.toDouble(),
                                     fontWeight: FontWeight.bold
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
                            children:[
                              /// - Edit Card
                              // SizedBox(
                              //   width: 25,
                              //   height: 25,
                              //
                              //   child: ElevatedButton(
                              //       onPressed: () {
                              //         // PersistentNavBarNavigator.pushNewScreen(
                              //         //   context,
                              //         //   screen: UpdateAddress(),
                              //         //   withNavBar: true,
                              //         //   // OPTIONAL VALUE. True by default.
                              //         //   pageTransitionAnimation: PageTransitionAnimation
                              //         //       .cupertino,
                              //         // );
                              //       },
                              //       style: ButtonStyle(
                              //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                              //               borderRadius: BorderRadius.all(Radius.circular(100)),
                              //               side: BorderSide(color: Colors.transparent, width: 1)
                              //           )),
                              //           overlayColor: MaterialStateProperty.all(Colors.white30),
                              //           elevation: MaterialStateProperty.all(0),
                              //           shadowColor: MaterialStateProperty.all(Colors.transparent),
                              //           backgroundColor: MaterialStateProperty.all(Color(int.parse(widget.savedCardsPage?.body.cardsList.editButton.backGroundColor as String))),
                              //           foregroundColor: MaterialStateProperty.all(Colors.white),
                              //           padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                              //           textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15))),
                              //       child: ImageIcon(
                              //         NetworkImage(widget.savedCardsPage?.body.cardsList.editButton.imageIcon as String),
                              //         size: double.parse(widget.savedCardsPage?.body.cardsList.editButton.mobileSize as String),
                              //         // color: Colors.white54,
                              //
                              //       )
                              //   ),
                              // ),
                              /// - Delete Card
                              IconButton(
                                  onPressed: () {

                                  },
                                  icon: ImageIcon(
                                    NetworkImage(widget.savedCardsPage?.body.cardsList.deleteButton.imageIcon as String),
                                    size: double.parse(widget.savedCardsPage?.body.cardsList.deleteButton.mobileSize as String),
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
               separatorBuilder: (context,index){
                  return Divider(color: Colors.white54,);
               },

              ),
            ),
          ):
          Expanded(child: LoadingWidget()
          )
        ;
      });



  }


  String hideCreditCardNumber(String cardNumber) {
    final int visibleDigits = 4;
    final int totalDigits = cardNumber.length;
    final int hiddenDigits = totalDigits - visibleDigits;

    String maskedNumber = '';
    for (int i = 0; i < hiddenDigits; i++) {
      maskedNumber += '*';
      if ((i + 1) % 4 == 0) {
        maskedNumber += ' ';
      }
    }
    maskedNumber += cardNumber.substring(hiddenDigits);

    return maskedNumber;
  }
}