import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get largeValue => height * 0.07;
  double get highValue => height * 0.1;
  double get logoValue => height * 0.15;
  double get introImageTitle => height * 0.65;
  double get textFieldWidht => width * 0.8;
}

extension SizedSpaceBoxExtension on BuildContext {
  SizedBox get normalSpace => SizedBox(height: height * 0.02);
  SizedBox get space => SizedBox(height: height * 0.03);
  SizedBox get smallSpace => SizedBox(height: height * 0.01);
  SizedBox get xmallSpace => SizedBox(height: height * 0.00);

  SizedBox get meidumSpace => SizedBox(height: height * 0.04);
  SizedBox get largeSpace => SizedBox(height: height * 0.08);
  SizedBox get bigSpace => SizedBox(height: height * 0.12);
}
