import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';

class MapLoadingWidget extends StatefulWidget{

  @override
  State<MapLoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<MapLoadingWidget> with TickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation1;
  late Animation<double> _opacityAnimation2;
  late Animation<double> _opacityAnimation3;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    _opacityAnimation1 = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.33, curve: Curves.easeInOut),
      ),
    );

    _opacityAnimation2 = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.33, 0.66, curve: Curves.easeInOut),
      ),
    );

    _opacityAnimation3 = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.66, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _opacityAnimation1.value,
                    child: Image.asset('assets/images/page2_icon.png', height: 18,width: 18,),
                  );
                },
              ),
              SizedBox(width: 5),
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _opacityAnimation2.value,
                    child: Image.asset('assets/images/page2_icon.png', height: 18,width: 18,),
                  );
                },
              ),
              SizedBox(width: 5),
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _opacityAnimation3.value,
                    child: Image.asset('assets/images/page2_icon.png', height: 18,width: 18,),
                  );
                },
              ),
            ],
          ),

        ],
      ),
    );
  }
}