import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CustomAnimatedMarker extends StatefulWidget {
  final double size;
  final bool isLoading;

  CustomAnimatedMarker({this.size = 50.0, this.isLoading = false});

  @override
  _CustomAnimatedMarkerState createState() => _CustomAnimatedMarkerState();
}

class _CustomAnimatedMarkerState extends State<CustomAnimatedMarker> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    // Create loading animation
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });

    // Start loading animation if isLoading is true
    if (widget.isLoading) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [

        // Loading progress
        AnimatedOpacity(
          opacity: widget.isLoading ? 1.0 : 0.0,
          duration: Duration(milliseconds: 100),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _animation.value * 2 * 3.14,
                child: AnimatedContainer(
                     duration: Duration(milliseconds: 100),
                     padding: EdgeInsets.all(3),
                    height: widget.isLoading ?25:0,
                    width:widget.isLoading ?25:0,
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius:const BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    // border: Border.all(
                    //   width: 0.5,
                    //   color: Colors.white,
                    //   style: BorderStyle.solid,
                    // ),
                  ),
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                ),
              );
            },
          ),
        ),
        AnimatedOpacity(
          opacity: !widget.isLoading ? 1.0 : 0.0,
          duration: Duration(milliseconds: 100),
          child: Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            width: widget.size / 8,
            height: widget.size / 8,
          ),
        ),




        // Nail
        AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: widget.isLoading ?80:50,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  LineAwesomeIcons.map_pin,
                  color: Colors.black,
                  size: widget.size,
                ),

                // Icon(
                //   LineAwesomeIcons.dot,
                //   color: Colors.black,
                //   size: widget.size,
                // ),

              ],
            ),
        ),


      ],
    );
  }
}
