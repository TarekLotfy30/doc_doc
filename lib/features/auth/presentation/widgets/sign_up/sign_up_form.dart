import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/helpers/classes/app_input_validator.dart';
import '../../../../../core/helpers/classes/app_logger.dart';
import '../../../../../core/helpers/extensions/theme_extension.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneNumberController,
    required this.obscurePasswordNotifier,
    required this.obscureConfirmPasswordNotifier,
    required this.dialCodeNotifier,
    required this.isValidPhoneNumber,
    required this.phoneNumber,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneNumberController;
  final ValueNotifier<bool> obscurePasswordNotifier;
  final ValueNotifier<bool> obscureConfirmPasswordNotifier;
  final ValueNotifier<bool> isValidPhoneNumber;
  final ValueNotifier<String> dialCodeNotifier;
  final ValueNotifier<String> phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        AppTextFormField(
          labelText: 'Name',
          hint: 'Enter your name',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: InputValidator.validateName,
          textCapitalization: TextCapitalization.words,
          controller: nameController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z.]')),
          ],
        ),
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
        ValueListenableBuilder<bool>(
          valueListenable: obscurePasswordNotifier,
          builder: (context, isObscure, child) {
            Logger.info('isObscure: $isObscure', 'SignUpForm');
            return AppTextFormField(
              labelText: 'Password',
              hint: 'Enter your password',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: InputValidator.validatePasswordSignUp,
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
        ValueListenableBuilder<bool>(
          valueListenable: obscureConfirmPasswordNotifier,
          builder: (context, isConfirmObscure, child) {
            Logger.info('isConfirmObscure: $isConfirmObscure', 'SignUpForm');
            return AppTextFormField(
              labelText: 'Confirm Password',
              hint: 'Enter your password',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => InputValidator.confirmPasswordSignUp(
                passwordController.text,
                confirmPasswordController.text,
              ),
              controller: confirmPasswordController,
              obscureText: isConfirmObscure,
              suffixIcon: IconButton(
                icon: Icon(
                  isConfirmObscure
                      ? AppIcons.visibility
                      : AppIcons.visibilityOff,
                  color: context.colorScheme.primary,
                ),
                onPressed: () =>
                    obscureConfirmPasswordNotifier.value = !isConfirmObscure,
              ),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
            );
          },
        ),
        ValueListenableBuilder<bool>(
          valueListenable: isValidPhoneNumber,
          builder: (context, value, child) {
            return InternationalPhoneNumberInput(
              validator: InputValidator.validatePhoneNumber,
              onInputValidated: (isValid) {
                Logger.info('isValid: $isValid', 'SignUpForm');
                isValidPhoneNumber.value = isValid;
                Logger.info(
                  'isValidPhoneNumber: ${isValidPhoneNumber.value}',
                  'SignUpForm',
                );
              },
              onSubmit: () {
                FocusScope.of(context).unfocus();
              },
              onInputChanged: (value) {
                dialCodeNotifier.value = value.dialCode!;
                Logger.info('dialCode: ${value.dialCode}', 'SignUpForm');
                phoneNumber.value = value.phoneNumber!;
                Logger.info('phoneNumber: ${value.phoneNumber}', 'SignUpForm');
              },
              autoValidateMode: AutovalidateMode.onUserInteraction,
              ignoreBlank: false,
              cursorColor: context.colorScheme.onSurface,
              inputDecoration: const InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
              ),
              formatInput: true,
              initialValue: PhoneNumber(
                dialCode: dialCodeNotifier.value,
                isoCode: 'EG',
              ),
              keyboardAction: TextInputAction.done,
              textFieldController: phoneNumberController,
              textStyle: context.textTheme.bodyLarge!.copyWith(
                color: context.colorScheme.onSurface,
              ),
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.DROPDOWN,
                setSelectorButtonAsPrefixIcon: true,
                showFlags: true,
                trailingSpace: false,
                leadingPadding: 20,
                useEmoji: true,
                countryComparator: (a, b) {
                  return a.dialCode!.length.compareTo(b.dialCode!.length);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
