import 'app_logger.dart';
import 'app_regex.dart';

// translate-me-ignore-all-file
class InputValidator {
  InputValidator._();

  static const _tag = 'InputValidator';

  /// List of allowed email domains
  static const List<String> _validEmailDomains = [
    'gmail.com',
    'outlook.com',
    'yahoo.com',
    'hotmail.com',
  ];

  /// Validates an email address and returns an error message or null if valid.
  static String? validateEmail(String? email) {
    Logger.info('Validating email: $email', _tag);

    // Check if email is empty
    if (email == null || email.isEmpty) {
      Logger.warning('Email validation failed: Email is empty', _tag);
      return 'Email field is required.';
    }

    // Use AppRegex for basic email validation
    if (!AppRegex.isEmailValid(email)) {
      Logger.warning('Email validation failed: Invalid format', _tag);
      return 'Please enter a valid email address';
    }

    // Domain-specific validation (optional)
    final domain = email.split('@').last;
    if (!_validEmailDomains.contains(domain)) {
      Logger.warning('Email domain not in preferred list: $domain', _tag);
      // Note: This is now just a warning, not an error
      return 'Please use a valid email domain';
    }

    // If all validations pass
    Logger.success('Email validation passed for: $email', _tag);
    return null;
  }

  /// Validates a password and returns an error message or null if valid.
  static String? validatePassword(String? password) {
    Logger.info('Validating password', _tag);

    // Check if password is empty
    if (password == null || password.isEmpty) {
      Logger.warning('Password validation failed: Password is empty', _tag);
      return 'Password field is required.';
    }

    // Build detailed error message for password requirements not met
    if (!AppRegex.isPasswordValid(password)) {
      final List<String> missingRequirements = [];

      if (!AppRegex.hasMinLength(password)) {
        missingRequirements.add('At least 8 characters');
      }
      if (!AppRegex.hasUpperCase(password)) {
        missingRequirements.add('At least 1 uppercase letter');
      }
      if (!AppRegex.hasLowerCase(password)) {
        missingRequirements.add('At least 1 lowercase letter');
      }
      if (!AppRegex.hasNumber(password)) {
        missingRequirements.add('At least 1 number');
      }
      if (!AppRegex.hasSpecialCharacter(password)) {
        missingRequirements.add('At least 1 special character');
      }

      Logger.warning(
        'Password validation failed: '
        'Missing requirements: ${missingRequirements.join(', ')},',
        _tag,
      );

      return 'Password must have:\n${missingRequirements.map((req) => '- $req').join('\n')}';
    }

    // If all validations pass
    Logger.success('Password validation passed', _tag);
    return null;
  }
}
