import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/providers/ProfileProviders/models/saved_address_list_res_model.dart';
import 'package:provider/provider.dart';

import '../../providers/ProfileProviders/profile_provider.dart';
import '../loading_widget.dart';

class SavedAddressListSheet extends StatefulWidget{
  ScrollController scrollController;

   SavedAddressListSheet({required this.scrollController,super.key});



  @override
  State<SavedAddressListSheet> createState() => _SavedAddressListSheetState();
}

class _SavedAddressListSheetState extends State<SavedAddressListSheet> {

  bool doesSelectedAddressExistInList({ SavedAddressItem? currentAddress, SavedAddressItem? selectedAddress}) {
    // Check if the list is empty.
    if (currentAddress==null || selectedAddress==null) {
      return false;
    }else {
      // Iterate over the list and compare each object to the given object.
        if (currentAddress.id == selectedAddress.id) {
          return true;
        }

    }

    // The object was not found in the list.
    return false;
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<ProfileProvider>(builder: (context, profileProvider, child)
    {

      bool _savedAddressListloading = profileProvider.savedAddressList.success!= null;


      return

        _savedAddressListloading?
        Expanded(
        child: ListView.builder(
            controller: widget.scrollController,
            itemCount: profileProvider.savedAddressList?.savedAddressItems?.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0, left: 0),
                      child: Image.asset(
                        "assets/images/icon_location_address.png", scale: 3,height: 17,),
                    ),
                    const SizedBox(width: 8,),
                    Expanded(
                      child: MyText("${profileProvider.savedAddressList.savedAddressItems![index].flat} | ${profileProvider.savedAddressList.savedAddressItems![index].name}", style: TextStyle(
                          color: Colors.amber,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),overflow: TextOverflow.ellipsis,maxLines: 1,),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText("${profileProvider.savedAddressList.savedAddressItems![index].area} - ${profileProvider.savedAddressList.savedAddressItems![index].building}", style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),),
                    Divider(color: Colors.white,)
                  ],
                ),
                // leading: Padding(
                //   padding: const EdgeInsets.only(bottom: 8.0, left: 18),
                //   child: Image.asset(
                //     "assets/images/icon_location_address.png", scale: 3,),
                // ),
                trailing: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.amberAccent.shade100.withOpacity(0.2))
                  ),
                  onPressed: () {
                    if(!doesSelectedAddressExistInList(currentAddress: profileProvider.savedAddressList.savedAddressItems![index], selectedAddress: profileProvider.selectedAddress)){
                      profileProvider.selectAddress(profileProvider.savedAddressList.savedAddressItems![index]);
                      Navigator.pop(context);
                    }else{
                      profileProvider.resetSelectAddress();
                    }

                  },
                  child:
                  (profileProvider.selectedAddress!=null)?
                  (doesSelectedAddressExistInList(currentAddress: profileProvider.savedAddressList.savedAddressItems![index], selectedAddress: profileProvider.selectedAddress)) ?
                  Text(
                    "Selected",
                    style: TextStyle(color: Colors.amber.shade100, fontWeight: FontWeight.bold,  fontFamily: "Raleway-Regular", fontSize: 13),
                  ):
                  Text(
                    "Select",
                    style: TextStyle(color: Colors.amber.shade100, fontWeight: FontWeight.bold,  fontFamily: "Raleway-Regular", fontSize: 13),
                  ):
                  Text(
                    "Select",
                    style: TextStyle(color: Colors.amber.shade100, fontWeight: FontWeight.bold,  fontFamily: "Raleway-Regular", fontSize: 13),
                  )
                  ,
                ),
              );
            }
        ),
      ): LoadingWidget();


    });
  }
}