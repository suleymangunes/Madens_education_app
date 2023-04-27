import 'package:flutter/material.dart';

class PaddingForScroll extends StatelessWidget {
  const PaddingForScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
    );
  }
}
