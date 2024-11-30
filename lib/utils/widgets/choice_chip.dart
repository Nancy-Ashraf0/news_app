import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  final String label;
  bool isSelected;
  final Function() onSelected;

  CustomChoiceChip(
      {super.key,
      required this.label,
      required this.onSelected,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ChoiceChip(
        onSelected: (value) {
          onSelected();
        },
        label: Text(label),
        selected: isSelected,
        showCheckmark: false,
        selectedColor: Colors.green,
        labelStyle: isSelected
            ? const TextStyle(color: Colors.white)
            : const TextStyle(color: Colors.green),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(color: Colors.green)),
      ),
    );
  }
}
