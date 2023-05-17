import 'package:flutter/material.dart';

class TextPrice extends StatelessWidget {
  const TextPrice({super.key, required this.price});
  final String price;

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$$price",
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: const Color.fromARGB(255, 229, 99, 0),
          ),
    );
  }
}
