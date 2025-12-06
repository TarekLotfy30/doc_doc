import 'package:flutter/material.dart';

import '../widgets/sign_in/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          physics: ClampingScrollPhysics(), 
          child: SignInViewBody(),
        ),
      ),
    );
  }
}
