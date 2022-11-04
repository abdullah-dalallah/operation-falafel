import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/widgets/checkbox_option.dart';
import 'package:operation_falafel/widgets/radio_option.dart';
import 'package:getwidget/getwidget.dart';

import 'package:video_player/video_player.dart';

class ItemDetailsSheet extends StatefulWidget{
  ScrollController scrollController;
   ItemDetailsSheet(this.scrollController,{super.key});

  @override
  State<ItemDetailsSheet> createState() => _ItemDetailsSheetState();
}

class _ItemDetailsSheetState extends State<ItemDetailsSheet> {

  int checkCounts=0;
  ValueChanged _valueChangedHandler(int Index1, int Index2, bool addOnFlag) {
    return (value) => setState(() {
     if(!addOnFlag){
       if(checkCounts>=3 ){
         if(itemOptions[itemOptions.keys.elementAt(Index1)][Index2]['${itemOptions[itemOptions.keys.elementAt(Index1)][Index2].keys.elementAt(0)}']["flag"]==true){
           itemOptions[itemOptions.keys.elementAt(Index1)][Index2]['${itemOptions[itemOptions.keys.elementAt(Index1)][Index2].keys.elementAt(0)}']["flag"]=false;
           checkCounts--;

         }
       }
       else{
         itemOptions[itemOptions.keys.elementAt(Index1)][Index2]['${itemOptions[itemOptions.keys.elementAt(Index1)][Index2].keys.elementAt(0)}']["flag"]=(value==false)?true:false;
         checkCounts += (value==false)?1:-1;
         print(checkCounts);
       }
     }
     else{
       itemOptions[itemOptions.keys.elementAt(Index1)][Index2]['${itemOptions[itemOptions.keys.elementAt(Index1)][Index2].keys.elementAt(0)}']["flag"]=(value==false)?true:false;
     }


    });
  }

  Map itemOptions ={
    // 'Choice of Folding':["Wrap","Roll cut in half","Roll cut 4 Pieces"],
    // 'Choice of Cooking':["Well-done"],
    // 'Customization':["no lettuce","no picles","no aioli mayo"],
    'Choice of Folding':[{'Cheese':{"Price":50,"flag":false}}, {'Mini Fattoush':{"Price":51,"flag":false}},{'Mini Quinoa Tabouleh':{"Price":52,"flag":false}}],

    'Choice of Cooking':[{'Cheese':{"Price":50,"flag":false}}, {'Mini Fattoush':{"Price":51,"flag":false}},{'Mini Quinoa Tabouleh':{"Price":52,"flag":false}}],

    'Customization':[{'Cheese':{"Price":50,"flag":false}}, {'Mini Fattoush':{"Price":51,"flag":false}},{'Mini Quinoa Tabouleh':{"Price":52,"flag":false}}],

    'Add on':[{'Cheese':{"Price":50,"flag":false}}, {'Mini Fattoush':{"Price":51,"flag":false}},{'Mini Quinoa Tabouleh':{"Price":52,"flag":false}}],
  };




  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    print(itemOptions);
    print(itemOptions['Add on']?.length);
    print(itemOptions[itemOptions.keys.elementAt(1)][1]['${itemOptions[itemOptions.keys.elementAt(1)][1].keys.elementAt(0)}']["Id"]);

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      videoPlayerOptions: VideoPlayerOptions(

      ),

      'https://clipchamp.com/watch/tehjHhBuWKS',
    );

    _initializeVideoPlayerFuture = _controller.initialize();

  }


  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        _controller.value.isPlaying
            ? _controller.pause()
            : _controller.play();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8)
            )
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                "assets/images/background.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),

            Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const ImageIcon(
                    AssetImage("assets/images/down.png",),
                    size: 35,
                  ),
                ) ,
              ),
              body: SingleChildScrollView(
                controller:  widget.scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// -  item image
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),


                        ),
                        child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 280,width: double.maxFinite,fit: BoxFit.cover,)),
                    /// - item title & subtitle & price
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18,top: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                          const Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:const [
                               Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                            ],
                          ),
                          const SizedBox(height: 8,),
                          const Divider(color: Colors.white,height: 1,),


                        ],
                      ),
                    ),
                    /// - item options
                    Padding(
                        padding: const EdgeInsets.only(left:18.0,right: 18),
                        child: SizedBox(
                          height: 310,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics:const BouncingScrollPhysics(),
                            itemCount: itemOptions.length,
                            padding:const EdgeInsets.only(top: 5),
                              itemBuilder: (context, index) =>
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text("${itemOptions.keys.elementAt(index)}", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),

                                      ListView.builder(
                                        padding:const EdgeInsets.only(top: 0),
                                        physics:const BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: itemOptions[itemOptions.keys.elementAt(index)].length,
                                          itemBuilder: (context, Index) =>

                                              CheckboxOption(
                                                value: itemOptions[itemOptions.keys.elementAt(index)][Index]['${itemOptions[itemOptions.keys.elementAt(index)][Index].keys.elementAt(0)}']["flag"],
                                                onChanged:_valueChangedHandler(index,Index, (itemOptions.keys.elementAt(index)=="Add on")?true:false),
                                                label: '1',
                                                text: '${itemOptions[itemOptions.keys.elementAt(index)][Index].keys.elementAt(0)}',
                                                addOnFlag: (itemOptions.keys.elementAt(index)=="Add on")?true:false,
                                              ),


                                      ),

                                      const SizedBox(height: 10,)



                                    ],
                                  ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              bottomSheet:  Container(
                color: Colors.black,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    /// - Pluse & minuse
                    Visibility(
                      visible: true,
                      child: Padding(
                        padding: const EdgeInsets.only(left:0.0, right: 0),
                        child: Container(
                              decoration:const BoxDecoration(
                                borderRadius:  BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: Colors.transparent,
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
                                    width:45,
                                    height:45,

                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          //     (Localizations.localeOf(context).languageCode=='en')?
                                          //     const RoundedRectangleBorder(
                                          //         borderRadius: BorderRadius.only(
                                          //           bottomLeft:     Radius.circular(10),
                                          //           topLeft: Radius.circular(10),
                                          //         ),
                                          //         side: BorderSide(color: Colors.transparent)
                                          //     ):
                                          //     (Localizations.localeOf(context).languageCode=='ar')?
                                          //     const RoundedRectangleBorder(
                                          //         borderRadius: BorderRadius.only(
                                          //           bottomRight:     Radius.circular(10),
                                          //           topRight: Radius.circular(10),
                                          //         ),
                                          //         side: BorderSide(color: Colors.transparent)
                                          //     ):
                                          //     const RoundedRectangleBorder(
                                          //         borderRadius: BorderRadius.only(
                                          //           bottomLeft:     Radius.circular(10),
                                          //           topLeft: Radius.circular(10),
                                          //         ),
                                          //         side: BorderSide(color: Colors.transparent)
                                          //     )
                                          // ),
                                          elevation:MaterialStateProperty.all(0),
                                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                          foregroundColor: MaterialStateProperty.all(Colors.white),
                                          padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                                          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
                                      child:const Icon(Icons.remove,size: 18,),
                                    ),
                                  ),
                                  const SizedBox(width:30, child: Text("199",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),),
                                  SizedBox(
                                    width:45,
                                    height:45,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          //     (Localizations.localeOf(context).languageCode=='en')?
                                          //     const RoundedRectangleBorder(
                                          //         borderRadius: BorderRadius.only(
                                          //           bottomRight:     Radius.circular(10),
                                          //           topRight: Radius.circular(10),
                                          //         ),
                                          //         side: BorderSide(color: Colors.transparent)
                                          //     ):
                                          //     (Localizations.localeOf(context).languageCode=='ar')?
                                          //     const RoundedRectangleBorder(
                                          //         borderRadius: BorderRadius.only(
                                          //           bottomLeft:     Radius.circular(10),
                                          //           topLeft: Radius.circular(10),
                                          //         ),
                                          //         side: BorderSide(color: Colors.transparent)
                                          //     ):
                                          //     const RoundedRectangleBorder(
                                          //         borderRadius: BorderRadius.only(
                                          //           bottomRight:     Radius.circular(10),
                                          //           topRight: Radius.circular(10),
                                          //         ),
                                          //         side: BorderSide(color: Colors.transparent)
                                          //     )
                                          // ),
                                          elevation:MaterialStateProperty.all(0),
                                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                          foregroundColor: MaterialStateProperty.all(Colors.white),
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
                    /// - Add to cart
                    Expanded(
                      child: SizedBox(
                            width: 290,
                            height: 45,
                            child: ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    // If the video is playing, pause it.
                                    if (_controller.value.isPlaying) {
                                      _controller.pause();
                                    } else {
                                      // If the video is paused, play it.
                                      _controller.play();
                                    }
                                  });
                                  showAlertDialog( context);
                                },
                                style: ButtonStyle(
                                  backgroundColor:  MaterialStateProperty.all<Color>(Color(0xFF84ab24)),
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.black),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(0.0),
                                          side: BorderSide(color: Colors.transparent,width: 1.5)
                                      )
                                  ),


                                ),
                                child:  Text(getTranslated(context, "addToCart")!,style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,color: Colors.white,fontWeight: FontWeight.w300, fontSize: 20),)


                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Image.asset("assets/images/text button.png", color: Colors.white,),
                              // ),
                            )
                        ),
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