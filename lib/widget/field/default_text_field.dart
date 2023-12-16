import 'package:flutter/material.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_text.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? labelText;
  final int? maxLength;
  final TextInputType? inputType;
  final bool initial;
  final String? initialText;
  final bool isObscure;
  final bool alignRight;
  final ValueChanged<String?>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final Widget? prefixWidget;
  final BoxConstraints? prefixConstraints;
  final bool isEnabled;
  final bool readOnly;
  final bool needAutoValidate;
  final int maxLines;

  const DefaultTextField({
    Key? key,
    required this.hintText,
    this.onSaved,
    this.controller,
    this.labelText,
    this.maxLength,
    this.inputType = TextInputType.text,
    this.initial = false,
    this.initialText,
    this.isObscure = false,
    this.alignRight = false,
    this.onChanged,
    this.validator,
    this.prefixWidget,
    this.prefixConstraints,
    this.isEnabled = true,
    this.readOnly = false,
    this.needAutoValidate = false,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      readOnly: readOnly,
      controller: controller,
      onChanged: onChanged ?? (value) {},
      textAlign: alignRight ? TextAlign.end : TextAlign.start,
      cursorColor: AppColors.primaryColor,
      initialValue: initialText,
      keyboardType: inputType,
      obscureText: isObscure,
      style: AppText.text12,
      maxLines: maxLines,
      autovalidateMode: needAutoValidate ? AutovalidateMode.always : null,
      decoration: InputDecoration(
        focusColor: AppColors.primaryColor,
        filled: false,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: AppColors.whiteColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintText: hintText,
        hintStyle: AppText.text12.copyWith(
          color: AppColors.whiteColor,
        ),
        labelText: labelText,
        labelStyle: AppText.text12,
        floatingLabelStyle: AppText.text12.copyWith(
          color: AppColors.primaryColor,
        ),
        contentPadding: const EdgeInsets.all(16),
        prefixIcon: prefixWidget,
        prefixIconColor: AppColors.whiteColor,
        prefixIconConstraints: prefixConstraints,
      ),
      maxLength: maxLength,
      validator: validator,
      onSaved: onSaved ?? (value) {},
    );
  }
}
