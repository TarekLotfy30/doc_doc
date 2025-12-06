import 'package:flutter/material.dart';

import '../widgets/sign_up/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        body: SafeArea(
          top: true,
          bottom: false,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            physics: ClampingScrollPhysics(),
            child: SignUpViewBody(),
          ),
        ),
      ),
    );
  }
}
