import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  final String hint;
  final String value;
  final ValueChanged<String> onChanged;
  final VoidCallback? onClear;

  const AppSearchBar({
    super.key,
    required this.hint,
    required this.value,
    required this.onChanged,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: value);
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: value.isEmpty
            ? null
            : IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  controller.clear();
                  onChanged('');
                  onClear?.call();
                },
              ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
