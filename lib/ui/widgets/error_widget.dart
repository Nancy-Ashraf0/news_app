import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyError extends StatelessWidget {
  String errorMessage = "";
  Function onRetry;
  MyError({super.key, required this.errorMessage,required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("Error"),
      content: Text(errorMessage),
      actions: [
      CupertinoDialogAction(
        isDefaultAction: true,
        child: Text("Retry"),
        onPressed: (){
          onRetry();
          //todo:retry handling
          Navigator.pop(context);
        },
      )
      ],
    );
  }
}
