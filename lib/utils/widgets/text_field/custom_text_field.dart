import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/app/theme/app_colors.dart';
import 'package:sample/app/theme/styles.dart';
import 'package:sample/utils/helper/text_field_wrapper.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final int? maxLength;
  final TextInputType inputType;
  final TextFieldWrapper wrapper;
  final bool isEnabled;
  final String? labelText;
  final String? suffixText;
  final Widget? suffixIcon;
  final bool isPassword;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    Key? key,
    required this.wrapper,
    this.hintText,
    this.maxLength,
    this.inputType = TextInputType.text,
    this.isEnabled = true,
    this.labelText,
    this.suffixText,
    this.suffixIcon,
    this.isPassword = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: wrapper.controller,
        style: Styles.tsBlackRegular16,
        maxLength: maxLength,
        keyboardType: inputType,
        enabled: isEnabled,
        obscureText: isPassword,
        onChanged: onChanged,
        cursorColor: AppColors.black,
        decoration: InputDecoration(
          errorText: wrapper.errorText.isEmpty ? null : wrapper.errorText,
          errorStyle: Styles.tsRedRegular18,
          counterText: '',
          suffixText: suffixText,
          suffixIcon: suffixIcon,
          fillColor: AppColors.primaryColor,
          filled: true,
          hintText: hintText,
          hintStyle: Styles.tsBlackRegular14,
          labelText: labelText,
          enabled: isEnabled,
          errorBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: UnderlineInputBorder(
            borderSide: const BorderSide(color: AppColors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: AppColors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: AppColors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: AppColors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
