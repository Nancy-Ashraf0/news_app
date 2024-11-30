import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  Function(int) onTab;
  DrawerWidget({super.key, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .13,
            decoration: const BoxDecoration(color: Color(0xff39A552)),
            child: Center(
                child: Text(
              context.tr("appName"),
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  color: Colors.white),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10, bottom: 10),
            child: InkWell(
              onTap: () {
                onTab(0);
              },
              child: Row(
                children: [
                  const Icon(Icons.list),
                  Text("  ${context.tr("categories")}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: InkWell(
              onTap: () {
                onTab(1);
              },
              child: Row(
                children: [
                  const Icon(Icons.settings),
                  Text("  ${context.tr("settings")}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ))
                ],
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
