import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routing/app_routes_name.dart';
import '../../../../core/constants/app_duration.dart';
import '../../../../core/helpers/classes/app_logger.dart';
import '../../../../core/helpers/classes/app_navigation.dart';
import '../../../../core/widgets/app_custom_text.dart';
import '../../../../core/widgets/app_dialog.dart';
import '../../../../core/widgets/app_loading_indicator.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../controller/cubit/sign_in_cubit.dart';
import '../../data/models/login_request_model.dart';
import 'login_footer.dart';
import 'login_form_section.dart';
import 'or_sign_in_divider.dart';
import 'social_sign_in_buttons.dart';
import 'welcome_header.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  late final ValueNotifier<bool> _obscurePasswordNotifier;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: 'tarektest123@gmail.com');
    _passwordController = TextEditingController(text: 'Qweasd@123456');
    _formKey = GlobalKey<FormState>();
    _obscurePasswordNotifier = ValueNotifier<bool>(true);
  }

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

    if (_formKey.currentState?.validate() ?? false) {
      await signInCubit.signIn(
        LoginRequestModel(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    } else {
      // Optional: Add a subtle shake animation or focus to the first
      // invalid field.
      FocusManager.instance.primaryFocus?.unfocus();
      await Future.delayed(AppDurations.medium);
      FocusManager.instance.primaryFocus?.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listenWhen: (previous, current) =>
          current is SignInError || current is SignInSuccess,
      listener: _blocListener,
      child: Form(
        key: _formKey,
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Logo and Welcome Texts
            const WelcomeHeader(),
            const SizedBox(height: 32),

            // 2. Form Section (Email, Password)
            LoginFormSection(
              emailController: _emailController,
              passwordController: _passwordController,
              obscurePasswordNotifier: _obscurePasswordNotifier,
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
            const LoginFooter(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _obscurePasswordNotifier.dispose();
    super.dispose();
  }
}
