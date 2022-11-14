import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class RewardsHistory extends StatefulWidget{
  @override
  State<RewardsHistory> createState() => _RewardsHistoryState();
}

class _RewardsHistoryState extends State<RewardsHistory> {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25,),
                /// - Title
                Text(getTranslated(context, "history")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),textAlign: TextAlign.center,),
                const SizedBox(height: 25,),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context,index){
                       return  Padding(
                         padding: const EdgeInsets.only(left: 50.0, right: 50),
                         child: ListTile(
                          title:  Text("${getTranslated(context, "earnd")!}", style: TextStyle(color: Colors.green),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("2.09625 ${getTranslated(context, "pointEarnd")!} 19.75", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,color: Colors.amber),),
                              Text("2022-10-19 20:22:17", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,color: Colors.white60),),
                              const SizedBox(height: 10,),
                              Row(
                                children: List.generate(800~/10, (index) => Expanded(
                                  child: Container(
                                    color: index%2==0?Colors.transparent
                                        :Colors.grey,
                                    height: 1,
                                  ),
                                )),
                              ),
                            ],
                          ),
                      ),
                       );
                    },
                  ),
                ),



              ],
            ),
          ),
        ),
      ],
    );
  }
}