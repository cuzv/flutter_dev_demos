import 'package:flutter/widgets.dart';

extension WidgetExt on Widget {
  Container margin(EdgeInsets insets) =>
      Container(padding: insets, child: this);
  Expanded expanded() => Expanded(child: this);
}
