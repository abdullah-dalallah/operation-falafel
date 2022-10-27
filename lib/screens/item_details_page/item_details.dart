import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/widgets/radio_option.dart';

class ItemDetails extends StatefulWidget{
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {

  String? _foodType;
  ValueChanged<String?> _valueChangedHandler() {

    return (value) => setState(() {

      _foodType = value!;
    });
  }

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
                AssetImage("assets/images/back_new.png",),
                size: 35,
              ),
            ) ,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 280,width: double.maxFinite,fit: BoxFit.cover,),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18,top: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                    const Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                        Container(
                          width: 320,
                          height: 40,
                          child:  TextField(

                            decoration:  InputDecoration(
                              fillColor: Colors.orange.withOpacity(0.1),
                              filled: true,
    
                              contentPadding: EdgeInsets.only(left:8),
                              focusedBorder:const OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(0)),
                                borderSide: BorderSide(color: Colors.grey, width: 1.0,),

                              ),
                              enabledBorder:const OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(0)),
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              hintText: 'Special instruction',
                              hintStyle:const TextStyle(color: Colors.grey)
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    const Divider(color: Colors.white,height: 1,),


                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:18.0,right: 18),
                  child: ListView.builder(
                    itemCount: 5,
                    padding: EdgeInsets.only(top: 0),
                      itemBuilder: (context, index) =>
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Add On", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),

                              RadioOption<String>(
                              value: '1',
                              groupValue: _foodType,
                              onChanged:_valueChangedHandler(),
                              label: '1',
                              text: 'Vegetarian',
                      ),
                            ],
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,bottom: 10),
                child: Container(
                    width: 330,
                    height: 38,
                    child: ElevatedButton(
                        onPressed: (){print("added");},
                        style: ButtonStyle(
                          backgroundColor:  MaterialStateProperty.all<Color>(Color(0xFF84ab24)),
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Colors.grey.shade200,width: 1.5)
                              )
                          ),


                        ),
                        child: const Text("Add to cart",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),)


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
      ],
    );
  }
}