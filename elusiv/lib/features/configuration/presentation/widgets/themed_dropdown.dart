import 'package:flutter/material.dart';

// 4. Labeled Dropdown Widget
class ThemedDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final String selectedItem;
  final ValueChanged<String?> onChanged;

  const ThemedDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
          DropdownButton<String>(
            value: selectedItem,
            isExpanded: true,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}