

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';

/// A widget for selecting styles
/// Calls the onSelected callback when a new size is selected
/// Note: this must be a StatefulWidget, otherwise the DropdownButton
/// value can't be updated
class SizeSelector extends ConsumerStatefulWidget {
  const SizeSelector({Key? key}) : super(key: key);

  static const Key selectorKey = Key("size_selector");

  @override
  ConsumerState<SizeSelector> createState() => _SizeSelectorState();

  // Special constant which is not really a size
  static const noSize = "Select size";

  // Allowed sizes
  static const sizes = [noSize, "S", "M", "L", "XL"];


}

class _SizeSelectorState extends ConsumerState<SizeSelector> {
  String? selectedValue = SizeSelector.noSize;

  @override
  Widget build(BuildContext context) {
    DropdownButton<String> dropdownButton = DropdownButton<String>(
      key: SizeSelector.selectorKey,
      items: SizeSelector.sizes
          .map((size) => DropdownMenuItem(value: size, child: Text(size)))
          .toList(),
      onChanged: _sizeSelected,
      value: selectedValue,
    );
    return dropdownButton;
  }

  /// This method is called when a new value is selected
  /// call the `onSelected` callback if the selected value is not the "title"
  void _sizeSelected(String? size) {
    // Update the value in the UI
    setState((){
      selectedValue = size;
      ref.read(selectedState.notifier).state = size == SizeSelector.noSize ? "" : size;
    });
  }
}
