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
import '../../../data/models/sign_up/sign_in_request_model.dart';
import 'sign_in_footer.dart';
import 'sign_in_form_section.dart';
import 'or_sign_in_divider.dart';
import 'social_sign_in_buttons.dart';
import 'welcome_header.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final TextEditingController emailController = TextEditingController(
    text: 'tarektest123@gmail.com',
  );
  final TextEditingController passwordController = TextEditingController(
    text: 'Qweasd@123456',
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> obscurePasswordNotifier = ValueNotifier<bool>(true);

  Future<void> _blocListener(BuildContext context, SignInState state) async {
    if (state is SignInError) {
      if (context.mounted) {
        await AppDialog.showError(
          context: context,
          title: 'Error occurred',
          message: state.message,
        );
      }
    } else if (state is SignInSuccess) {
      await AppSnackBar.showSuccess(context, state.message);
      if (context.mounted) {
        await AppNavigation.navigateToAndClearStack(
          context,
          AppRoutesName.homeView,
        );
      }
    }
  }

  Future<void> _loginButtonPress(BuildContext context) async {
    Logger.debug('Login button pressed', 'LoginViewBody');
    final signInCubit = BlocProvider.of<SignInCubit>(context);

    if (formKey.currentState?.validate() ?? false) {
      await signInCubit.signIn(
        SignInRequestModel(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listenWhen: (previous, current) =>
          current is SignInError || current is SignInSuccess,
      listener: _blocListener,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Logo and Welcome Texts
            const WelcomeHeader(),
            const SizedBox(height: 32),

            // 2. Form Section (Email, Password)
            LoginFormSection(
              emailController: emailController,
              passwordController: passwordController,
              obscurePasswordNotifier: obscurePasswordNotifier,
            ),
            const SizedBox(height: 32),

            // 3. Login Button
            BlocBuilder<SignInCubit, SignInState>(
              buildWhen: (previous, current) {
                if (previous == current) {
                  return false;
                }
                return current is SignInLoading || current is SignInError;
              },
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: AppDurations.standard,
                  child: state is SignInLoading
                      ? const Center(
                          // Use a distinct key to ensure the AnimatedSwitcher
                          // works correctly.
                          key: ValueKey('LoadingIndicator'),
                          child: AppLoadingIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: state is SignInLoading
                              ? null
                              : () => _loginButtonPress(context),
                          key: const ValueKey('LoginButton'),
                          child: const CustomText(data: 'Login'),
                        ),
                );
              },
            ),
            const SizedBox(height: 46),

            // 5. Or Sign-In Section
            const OrSignInDivider(),
            const SizedBox(height: 32),

            // 5. Social Sign-in Section
            const SocialSignInButtons(),
            const SizedBox(height: 32),

            // 6. Terms and Sign Up Links
            const SignInFooter(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    obscurePasswordNotifier.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
