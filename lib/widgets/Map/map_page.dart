
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:operation_falafel/widgets/Map/custom_animated_marker.dart';

import 'package:shimmer/shimmer.dart';

import '../../localization/localization_constants.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // Initialize variables
  late GoogleMapController mapController;
  late LatLng centerMarkerPosition;
  String addressName = '';
  bool isMarkerLoading = false;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Set the initial position of the center marker
    centerMarkerPosition = LatLng(25.074759, 55.140225);
  }

  // Get the address name from the marked location
  Future<void> getAddressNameFromLocation(LatLng position) async {
    try {
      // Set the loading status to true
      setState(() {
        isMarkerLoading = true;
      });

      // Use geocoding API to get the address name from the location
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude);
      addressName = placemarks[0].name!;
      print(addressName);

      // Set the loading status to false
      setState(() {
        isMarkerLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Google Maps'),
      // ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Display the Google Map
            GoogleMap(
              // mapType: MapType.satellite,
              initialCameraPosition: CameraPosition(
                target: centerMarkerPosition,
                zoom: 10,
              ),
              onMapCreated: (GoogleMapController controller) {mapController = controller;},
              onCameraMove: (CameraPosition position) {
                // Set the position of the center marker when the map is moved
                centerMarkerPosition = position.target;
                setState(() {
                  isMarkerLoading =true;
                  addressName = '';
                });

                // Get the address name from the marked location
                // if(!isMarkerLoading){
                // _timer = Timer(const Duration(milliseconds: 700), () {
                //   centerMarkerPosition = position.target;
                //   getAddressNameFromLocation(centerMarkerPosition);
                // });


                // }

              },
              onCameraIdle: () {
                print("${centerMarkerPosition.latitude},${centerMarkerPosition.longitude}");
                if (_timer != null) {
                  _timer?.cancel();
                }
                // Get the address name from the marked location
                  _timer = Timer(const Duration(milliseconds: 700), () {
                    getAddressNameFromLocation(centerMarkerPosition);
                  });

              },
            ),
            // Display the center marker with a loading status
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [




                  CustomAnimatedMarker(
                    isLoading: isMarkerLoading,
                    // locationionName: addressName,
                  ),


                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding:const EdgeInsets.only(right: 8, left: 8,bottom: 8),
                  decoration:  const BoxDecoration(
                    color: Colors.black54,
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
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(

                        onTap: (){},
                        tileColor: Colors.transparent,
                        title: Text(
                          "Choose your location",
                          style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber,fontSize: double.parse(getTranslated(context, "cartpageHeader2SubTotal")!)),

                        ),
                        subtitle:
                        // addressName!=''?
                        // Text(addressName,
                        //   style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber,fontSize: double.parse(getTranslated(context, "cartpageHeader2SubTotal")!))
                        //   ,maxLines: 1,overflow: TextOverflow.ellipsis,)
                        //     :
                        // Shimmer.fromColors(
                        //   baseColor: Colors.grey[300]!,
                        //   highlightColor: Colors.grey[100]!,
                        //   child: Container(
                        //     margin: const EdgeInsets.only(top:5, bottom: 0, right: 25, left: 0),
                        //     decoration:  BoxDecoration(
                        //       color: Colors.grey.shade200,
                        //       borderRadius:const BorderRadius.all(
                        //           Radius.circular(5)
                        //       ),
                        //     ),
                        //     height: 15,
                        //     width: 200,
                        //   ),
                        //
                        // ),
                          Text('Ana Hair Extension DXB, 34GR+68R - Marina Street - Dubai Marina - Dubai',
                            style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white,fontSize: double.parse(getTranslated(context, "cartpageHeader2SubTotal")!))
                            ,maxLines: 1,overflow: TextOverflow.ellipsis,)
                      ),
                      // Material(
                      //     // color: Colors.transparent,
                      //   child:
                      //
                      // ),



                       Row(
                         children: [
                           Expanded(
                             child: SizedBox(
                               height: 40,
                               child: ElevatedButton(
                                  style: ButtonStyle(
                                      elevation: MaterialStateProperty.all<double>(0),
                                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(12)),
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(Colors.amber),
                                      foregroundColor:
                                      MaterialStateProperty.all<Color>(Colors.white),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                              side: BorderSide(color: Colors.transparent)))),
                                  onPressed: () {

                                  },
                                  child: Text(
                                   " Confirm location",
                                    style: TextStyle(color: Colors.white, fontSize: 15),
                                  ),
                                ),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(height: 8,),
                       Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    elevation: MaterialStateProperty.all<double>(0),
                                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(12)),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            side: BorderSide(color: Colors.transparent))
                                    )),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.black,fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
              
            ),

          ],
        ),
      ),
    );
  }
}

