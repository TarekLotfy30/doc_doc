
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
    // Check if email is empty
    if (email == null || email.isEmpty) {
      return 'Email field is required.';
    }

    // Use AppRegex for basic email validation
    if (!AppRegex.isEmailValid(email)) {
      return 'Please enter a valid email address';
    }

    // Domain-specific validation (optional)
    final domain = email.split('@').last;
    if (!_validEmailDomains.contains(domain)) {
      return 'Please use a valid email domain';
    }
    return null;
  }

  /// Validates a password and returns an error message or null if valid.
  static String? validatePasswordSignUp(String? password) {

    // Check if password is empty
    if (password == null || password.isEmpty) {
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

      return 'Password must have:\n${missingRequirements.map((req) => '- $req').join('\n')}';
    }

    // If all validations pass
    return null;
  }

  static String? confirmPasswordSignUp(
    String? password,
    String? confirmPassword,
  ) {
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  /// Validates a password and returns an error message or null if valid.
  static String? validatePasswordSignIn(String? password) {
    // Check if password is empty
    if (password == null || password.isEmpty) {
      return 'Password field is required.';
    }

    // Build detailed error message for password requirements not met
    if (!AppRegex.isPasswordValid(password)) {
      return 'Enter a valid password';
    }

    // If all validations pass
    return null;
  }

  /// Validates a phone number and returns an error message or null if valid.
  static String? validatePhoneNumber(String? phoneNumber) {

    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Phone number field is required.';
    }

    if (!AppRegex.isPhoneValid(phoneNumber)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  /// Validates a name and returns an error message or null if valid.
  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name field is required.';
    }

    if (!AppRegex.isNameValid(name)) {
      return 'Please enter a valid name';
    }

    return null;
  }
}
