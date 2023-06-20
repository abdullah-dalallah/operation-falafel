import 'package:flutter/cupertino.dart';

class Background extends StatefulWidget {
  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {

  @override
  Widget build(BuildContext context) {
  return SingleChildScrollView(
    physics: const NeverScrollableScrollPhysics(),

    child: Column(
      children: [
        Image.asset(
          "assets/images/background.png",
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          fit: BoxFit.cover,
        ),
      ],
    ),
  );
  }
}