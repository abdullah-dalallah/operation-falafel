import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            itemCount: profileProvider.savedAddressList?.savedAddressItem?.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${profileProvider.savedAddressList.savedAddressItem![index].flat} | ${profileProvider.savedAddressList.savedAddressItem![index].name}", style: TextStyle(
                    color: Colors.amber,
                    fontSize: 15,
                    fontWeight: FontWeight.w300),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${profileProvider.savedAddressList.savedAddressItem![index].area} - ${profileProvider.savedAddressList.savedAddressItem![index].building}", style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),),
                    Divider(color: Colors.white,)
                  ],
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, left: 18),
                  child: Image.asset(
                    "assets/images/icon_location_address.png", scale: 3,),
                ),

              );
            }
        ),
      ): LoadingWidget();


    });
  }
}