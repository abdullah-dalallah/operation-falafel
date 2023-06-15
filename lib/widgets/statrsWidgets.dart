import 'package:flutter/cupertino.dart';

class StarsWidgets extends StatefulWidget{
  final ValueChanged onChanged;
  const StarsWidgets(this.onChanged,{super.key,});
  @override
  State<StarsWidgets> createState() => _StarsWidgetsState();
}

class _StarsWidgetsState extends State<StarsWidgets> {


  int fullStars =2;
  _build(int rat){
    List<Widget> starsList=[];

      for(int i=1;i<=5;i++){
        if(rat>=i){
          starsList.add(
            GestureDetector(
                onTap: (){
                  setState(() {
                    fullStars =i;
                  });

                },
                child: Image.asset("assets/images/star_full.png", height: 50,width: 50,))
            ,);
        }
        else{
          starsList.add(
            GestureDetector(
                onTap: (){
                  setState(() {
                    fullStars =i;
                  });


                },
                child: Image.asset("assets/images/star_empty.png", height: 50,width: 50,)),
          );
        }

      }

    widget.onChanged(fullStars);



    return starsList;
  }

  @override
  Widget build(BuildContext context) {
   return Row(
     mainAxisAlignment: MainAxisAlignment.center,
    children: _build(fullStars),
   );
  }


}