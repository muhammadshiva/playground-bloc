import 'package:flutter/material.dart';

class CustomDropDownPicker<T> extends StatelessWidget {
  final String label;
  final String placeholder;
  final T? selectedValue;
  final List<DropdownMenuItem<T>> items;
  final Function(T?) onChanged;
  final String? Function(T?)? validator;
  final bool isExpanded;

  const CustomDropDownPicker({
    super.key,
    required this.label,
    required this.placeholder,
    this.selectedValue,
    required this.items,
    required this.onChanged,
    this.validator,
    this.isExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE0E0E0)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: selectedValue,
              isExpanded: isExpanded,
              hint: Text(
                placeholder,
                style: const TextStyle(fontSize: 14, color: Color(0xFF7F8C8D)),
              ),
              icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF7F8C8D)),
              items: items,
              onChanged: onChanged,
              style: const TextStyle(fontSize: 14, color: Color(0xFF2C3E50)),
            ),
          ),
        ),
      ],
    );
  }
}

// Extension to create dropdown items easily
extension DropdownItemExtension on String {
  DropdownMenuItem<String> toDropdownItem() {
    return DropdownMenuItem<String>(value: this, child: Text(this));
  }
}

// Generic extension for any type
extension GenericDropdownItemExtension<T> on T {
  DropdownMenuItem<T> toDropdownItem(String displayText) {
    return DropdownMenuItem<T>(value: this, child: Text(displayText));
  }
}
