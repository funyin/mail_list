import 'package:flutter/material.dart';

mixin UiKits {
  Widget height(double val) => SizedBox(height: val);

  Widget width(double val) => SizedBox(width: val);

  Widget formSpace() => height(24);

  Widget formEndSpace() => height(24);

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  bool lightMode(BuildContext context) =>
      MediaQuery.of(context).platformBrightness == Brightness.light;

  TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;

  ColorScheme colorScheme(BuildContext context) =>
      Theme.of(context).colorScheme;

  // AppColorScheme appColorScheme(BuildContext context) =>
  //     Theme.of(context).extension<AppColorScheme>()!;

  EdgeInsets viewInsets(BuildContext context) =>
      MediaQuery.of(context).viewPadding;
}
