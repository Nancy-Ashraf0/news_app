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
            child: const Center(
                child: Text(
              "News App!",
              style: TextStyle(
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
              child: const Row(
                children: [
                  Icon(Icons.list),
                  Text("  Categories",
                      style: TextStyle(
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
              child: const Row(
                children: [
                  Icon(Icons.settings),
                  Text("  Settings",
                      style: TextStyle(
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
