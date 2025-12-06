import 'package:flutter/material.dart';

import '../../../../../core/helpers/classes/app_logger.dart';
import '../../../../../core/helpers/extensions/theme_extension.dart';
import '../../../../../core/widgets/app_custom_text.dart';

class GenderSelectionRow extends StatelessWidget {
  const GenderSelectionRow({super.key, required this.genderNotifier});

  final ValueNotifier<int> genderNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: genderNotifier,
      builder: (context, gender, child) {
        Logger.info('Gender: $gender', 'GenderSelectionRow');
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              data: 'Gender',
              textTheme: context.textTheme.titleMedium,
              fontWeight: FontWeight.bold,
              color: context.colorScheme.onSurface,
            ),
            const Spacer(),
            const CustomText(data: 'Male'),
            RadioGroup(
              groupValue: gender,
              onChanged: (value) => {genderNotifier.value = value ?? 0},
              child: const Radio.adaptive(value: 0),
            ),
            const Spacer(),
            RadioGroup(
              groupValue: gender,
              onChanged: (value) => {genderNotifier.value = value ?? 1},
              child: const Radio.adaptive(value: 1),
            ),
            const CustomText(data: 'Female'),
          ],
        );
      },
    );
  }
}
