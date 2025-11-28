import 'package:flutter/material.dart';

import '../../../onboarding/presentation/widgets/doc_doc_logo_and_text.dart';

// translate-me-ignore-all-file
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        child: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            key: ValueKey('item_$index'), // <-- this
            subtitle: const DocDocLogoAndText(),
          ),
        ),
      ),
    );
  }
}
