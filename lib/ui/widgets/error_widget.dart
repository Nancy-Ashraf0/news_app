import 'package:flutter/cupertino.dart';

class MyError extends StatelessWidget {
  String errorMessage = "";
  Function onRetry;

  MyError({super.key, required this.errorMessage, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text("Error"),
      content: Text(errorMessage),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text("Retry"),
          onPressed: () {
            onRetry();
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
