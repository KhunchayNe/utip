import 'package:flutter/material.dart';

class BillAmount extends StatelessWidget {
  const BillAmount({
    super.key,
    required this.onChange,
    required this.billAmont,
  });

  final String billAmont;
  final ValueChanged<String> onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.attach_money),
          labelText: 'Bill Amount'),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        onChange(value);
      },
    );
  }
}
