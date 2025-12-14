import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routing/app_routes_name.dart';
import '../../../../../core/constants/app_duration.dart';
import '../../../../../core/helpers/classes/app_logger.dart';
import '../../../../../core/helpers/classes/app_navigation.dart';
import '../../../../../core/widgets/app_custom_text.dart';
import '../../../../../core/widgets/app_dialog.dart';
import '../../../../../core/widgets/app_loading_indicator.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../controller/sign_in_cubit/sign_in_cubit.dart';
import '../../../controller/sign_up_cubit/sign_up_cubit.dart';
import '../../../data/models/sign_in/sign_up_request_model.dart';
import 'already_have_an_account.dart';
import 'gender_selection_row.dart';
import 'header_section.dart';
import 'or_sign_up_with.dart';
import 'sign_up_form.dart';
import 'social_sign_up_buttons.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _obscurePasswordNotifier = ValueNotifier<bool>(
    true,
  );
  final ValueNotifier<bool> _obscureConfirmPasswordNotifier =
      ValueNotifier<bool>(true);

  final ValueNotifier<bool> _isValidPhoneNumber = ValueNotifier<bool>(false);
  final ValueNotifier<int> _genderNotifier = ValueNotifier<int>(0);
  final ValueNotifier<String> _dialCodeNotifier = ValueNotifier<String>('+20');
  final ValueNotifier<String> phoneNumberNotifier = ValueNotifier<String>('');

  Future<void> _blocListener(context, SignUpState state) async {
    if (state is SignUpError) {
      await AppDialog.showWarning(
        context: context,
        title: 'Registration Failed 😥',
        message: state.message,
      );
    } else if (state is SignUpSuccess) {
      await AppSnackBar.showSuccess(context, state.message);
      await AppNavigation.navigateToAndClearStack(
        context,
        AppRoutesName.bottomNavBarView,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Logger.info('Build SignUpViewBody', 'SignUpViewBody');
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpError || current is SignUpSuccess,
      listener: _blocListener,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  1. Header Section
            const HeaderSection(),
            const SizedBox(height: 16),

            //  2. Form Fields (Name, Email, Passwords, Phone)
            SignUpForm(
              nameController: _nameController,
              emailController: _emailController,
              passwordController: _passwordController,
              confirmPasswordController: _confirmPasswordController,
              phoneNumberController: _phoneController,
              obscurePasswordNotifier: _obscurePasswordNotifier,
              obscureConfirmPasswordNotifier: _obscureConfirmPasswordNotifier,
              dialCodeNotifier: _dialCodeNotifier,
              isValidPhoneNumber: _isValidPhoneNumber,
              phoneNumber: phoneNumberNotifier,
            ),
            const SizedBox(height: 16),

            // 3.Gender Selection Row
            GenderSelectionRow(genderNotifier: _genderNotifier),
            const SizedBox(height: 32),

            // 4. Sign Up Button
            BlocBuilder<SignUpCubit, SignUpState>(
              buildWhen: (previous, current) =>
                  current is SignUpLoading || current is SignUpError,
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: AppDurations.standard,
                  child: state is SignUpLoading
                      ? const Center(
                          // Use a distinct key to ensure the AnimatedSwitcher
                          // works correctly.
                          key: ValueKey('LoadingIndicator'),
                          child: AppLoadingIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: state is SignInLoading
                              ? null
                              : () async {
                                  if (_formKey.currentState!.validate() &&
                                      _isValidPhoneNumber.value) {
                                    await BlocProvider.of<SignUpCubit>(
                                      context,
                                    ).signUp(
                                      SignUpRequestModel(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        phoneNumber: phoneNumberNotifier.value,
                                        name: _nameController.text,
                                        gender: _genderNotifier.value,
                                        confirmPassword:
                                            _passwordController.text,
                                      ),
                                    );
                                  } else if (!_isValidPhoneNumber.value) {
                                    await AppSnackBar.showError(
                                      context,
                                      'Please enter a valid phone number.',
                                    );
                                  }
                                },
                          key: const ValueKey('Create Account Button'),
                          child: const CustomText(data: 'Create Account'),
                        ),
                );
              },
            ),
            const SizedBox(height: 46),

            // 5. Or Sign Up with Divider
            const OrSignUpDivider(),
            const SizedBox(height: 32),

            // 6. Social Sign-Up Buttons
            const SocialSignUpButtons(),
            const SizedBox(height: 32),

            // 6. Already have an account? Sign In
            const AlreadyHaveAnAccount(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _obscureConfirmPasswordNotifier.dispose();
    _obscurePasswordNotifier.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
