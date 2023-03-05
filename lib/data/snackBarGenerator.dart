import 'package:flutter/material.dart';
// import 'package:jomlahbazar/providers/tab_index_generator_provider.dart';
import 'package:provider/provider.dart';

import '../providers/tab_index_generator_provider.dart';

class SnackbarGenerator {
  BuildContext context;

  SnackbarGenerator(this.context);
  snackBarGeneratorLogin() {
    final snackBar = SnackBar(
      action: SnackBarAction(
          label: "Proceed",
          onPressed: () {
            Navigator.of(context).pop();
            Provider.of<TabIndexGenerator>(context, listen: false).setIndex(2);
          },
          textColor: Colors.white),
      content: const Text(
        "Please Login/Register Your Account",
        style: TextStyle(color: Colors.amber),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  snackBarGeneratorToast(String msg) {
    final snackBar = SnackBar(
      content: Text(
        msg,
        style: TextStyle(color: Colors.amber),
      ),
      duration:  const Duration(microseconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
