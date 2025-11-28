import 'package:flutter/material.dart';

import '../../../onboarding/presentation/widgets/doc_doc_logo_and_text.dart';

// translate-me-ignore-all-file
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          children: [
            Hero(tag: 'DocDocLogoAndText', child: DocDocLogoAndText()),
          ],
        ),
      ),
    );
  }
}
