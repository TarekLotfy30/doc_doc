import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helpers/extensions/theme_extension.dart';
import 'app_custom_text.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.autovalidateMode,
    this.controller,
    this.labelText,
    this.hint,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.obscureText = false,
    this.readOnly = false,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onChanged,
  });

  final AutovalidateMode? autovalidateMode;
  final TextEditingController? controller;
  final String? labelText;
  final String? hint;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String?>? onFieldSubmitted;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      controller: controller,
      cursorColor: context.colorScheme.onSurface,
      cursorErrorColor: context.colorScheme.error,
      cursorHeight: 20,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hint,
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      enableSuggestions: true,
      errorBuilder: (context, errorText) => CustomText(
        data: errorText,
        textTheme: context.textTheme.bodyLarge,
        fontSize: 12,
        color: context.colorScheme.error,
        height: 1.5,
        letterSpacing: -0.2,
      ),
      style: context.textTheme.titleLarge?.copyWith(
        color: context.colorScheme.onSurface,
        fontSize: 14,
        height: 1.5,
      ),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      validator: validator,
      obscureText: obscureText,
      readOnly: readOnly,
      obscuringCharacter: '*',
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
