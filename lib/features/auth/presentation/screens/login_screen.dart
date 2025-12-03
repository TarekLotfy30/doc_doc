// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/helpers/classes/app_input_validator.dart';
import '../../../../core/helpers/classes/app_logger.dart';
import '../../../../core/helpers/extensions/theme_extension.dart';
import '../../../../core/theme/colors/light_colors.dart';
import '../../../../core/theme/styles/app_font_family.dart';
import '../../../../core/widgets/app_custom_text.dart';
import '../../../../core/widgets/app_svg.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../onboarding/presentation/widgets/doc_doc_logo_and_text.dart';

// translate-me-ignore-all-file
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Hero(
                  tag: 'DocDocLogoAndText',
                  child: DocDocLogoAndText(),
                ),
                const SizedBox(height: 24),
                CustomText(
                  data: 'Welcome Back',
                  textTheme: context.textTheme.displayLarge,
                  fontSize: 24,
                  color: context.colorScheme.primary,
                  height: 1.5,
                  letterSpacing: -0.2,
                ),
                const SizedBox(height: 8),
                CustomText(
                  data:
                      "We're excited to have you back, can't wait to \n see what you've been up to since you last logged in.",
                  textTheme: context.textTheme.bodyLarge,
                  fontSize: 14,
                  color: context.colorScheme.outline,
                  height: 1.8,
                  letterSpacing: -0.2,
                ),
                const SizedBox(height: 36),
                AppTextFormField(
                  valueKey: 'Email',
                  labelText: 'Email Address',
                  hint: 'Enter your email address',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: InputValidator.validateEmail,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9@a-zA-Z.]')),
                  ],
                ),
                const SizedBox(height: 16),
                AppTextFormField(
                  valueKey: 'password',
                  labelText: 'Password',
                  hint: 'Enter your password',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: InputValidator.validatePassword,
                  controller: _passwordController,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                  ],
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {},
                  child: const CustomText(data: 'Login'),
                ),
                const SizedBox(height: 46),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    CustomText(
                      data: 'Or Sign in with',
                      textTheme: context.textTheme.bodyLarge,
                      fontSize: 12,
                      color: context.colorScheme.outline,
                      height: 1.5,
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RawMaterialButton(
                      onPressed: () {},
                      fillColor: context.colorScheme.onInverseSurface,
                      padding: const EdgeInsets.all(7),
                      disabledElevation: 0,
                      elevation: 0,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: const CircleBorder(),
                      child: const SizedBox(
                        height: 32,
                        width: 32,
                        child: AppSVG(assetPath: AppIcons.google),
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      fillColor: context.colorScheme.onInverseSurface,
                      padding: const EdgeInsets.all(7),
                      disabledElevation: 0,
                      elevation: 0,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: const CircleBorder(),
                      child: const SizedBox(
                        height: 32,
                        width: 32,
                        child: AppSVG(assetPath: AppIcons.facebook),
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      fillColor: context.colorScheme.onInverseSurface,
                      padding: const EdgeInsets.all(7),
                      disabledElevation: 0,
                      elevation: 0,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: const CircleBorder(),
                      child: const SizedBox(
                        height: 32,
                        width: 32,
                        child: AppSVG(assetPath: AppIcons.apple),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'By logging, you agree to our ',
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontSize: 11,
                            height: 1.5,
                            color: context.colorScheme.outline,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms & Conditions ',
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontSize: 11,
                            height: 1.5,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              debugPrint('Clicked');
                            },
                        ),
                        TextSpan(
                          text: 'and ',
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontSize: 11,
                            height: 1.5,
                            color: context.colorScheme.outline,
                          ),
                        ),
                        TextSpan(
                          text: 'PrivacyPolicy ',
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontSize: 11,
                            height: 1.5,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              debugPrint('Clicked');
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: Align(
                    alignment: Alignment.center,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an account yet?  ',
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontSize: 11,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign Up',
                            style: context.textTheme.headlineLarge?.copyWith(
                              fontSize: 11,
                              color: context.colorScheme.primary,
                              height: 1.5,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                debugPrint('Clicked');
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
