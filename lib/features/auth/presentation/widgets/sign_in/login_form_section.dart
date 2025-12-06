import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/helpers/classes/app_input_validator.dart';
import '../../../../../core/helpers/extensions/theme_extension.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.obscurePasswordNotifier,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueNotifier<bool> obscurePasswordNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFormField(
          labelText: 'Email Address',
          hint: 'Enter your email address',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: InputValidator.validateEmail,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9@a-zA-Z.]')),
          ],
        ),
        const SizedBox(height: 16),
        ValueListenableBuilder<bool>(
          valueListenable: obscurePasswordNotifier,
          builder: (context, isObscure, child) {
            return AppTextFormField(
              labelText: 'Password',
              hint: 'Enter your password',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: InputValidator.validatePassword,
              controller: passwordController,
              obscureText: isObscure,
              suffixIcon: IconButton(
                icon: Icon(
                  isObscure ? AppIcons.visibility : AppIcons.visibilityOff,
                  color: context.colorScheme.primary,
                ),
                onPressed: () => obscurePasswordNotifier.value = !isObscure,
              ),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
            );
          },
        ),
      ],
    );
  }
}
