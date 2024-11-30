import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 18, left: 28, right: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.tr("language"),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
          ),
          const SizedBox(
            height: 18,
          ),
          DropdownButtonFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2))),
              value: context.locale.languageCode,
              isExpanded: true,
              items: [
                DropdownMenuItem(
                    value: "en",
                    child: Text(context.tr("english"),
                        style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w400,
                            fontSize: 18))),
                const DropdownMenuItem(
                    value: "ar",
                    child: Text("العربية",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w400,
                            fontSize: 18)))
              ],
              onChanged: (newValue) {
                context
                    .setLocale(Locale(newValue ?? context.locale.languageCode));
              })
        ],
      ),
    );
  }
}
