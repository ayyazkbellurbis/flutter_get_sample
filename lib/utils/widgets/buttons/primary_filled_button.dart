import 'package:flutter/material.dart';
import 'package:sample/app/theme/app_colors.dart';
import 'package:sample/app/theme/styles.dart';

class PrimaryFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? buttonColor;
  final TextStyle? textStyle;
  final double? minWidth;
  final EdgeInsets padding;

  const PrimaryFilledButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.buttonColor,
    this.textStyle,
    this.minWidth,
    this.padding = const EdgeInsets.all(20.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: buttonColor ?? AppColors.secondaryColor,
      padding: padding,
      minWidth: minWidth,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Text(text, style: textStyle ?? Styles.tsWhiteRegular18),
    );
  }
}
