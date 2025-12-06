// ═══════════════════════════════════════════════════════════════
//  APP REGEX HELPER
// ═══════════════════════════════════════════════════════════════

// translate-me-ignore-all-file
class AppRegex {
  AppRegex._();

  /// Validates if a name contains only alphabetic characters.
  ///
  /// @param name The name string to validate
  /// @return true if the name contains only letters, false otherwise
  static bool isNameValid(String name) {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(name);
  }

  /// Validates if a phone number matches common phone number formats.
  /// Allows for various international formats including country codes.
  static bool isPhoneValid(String phone) {
    return RegExp(
      r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$',
    ).hasMatch(phone);
  }

  // phonenUmber tab3 package esmha intlphonenumberfield
  // static bool _isValidLengthForCountry(PhoneNumber value) {
  //   final number = value.number;
  //   final countryCode = value.countryISOCode;

  //   switch (countryCode) {
  //     case 'EG':
  //       // Egypt: must be exactly 10 digits (without country code)
  //       return number.length == 10;

  //     case 'KW':
  //       // Kuwait: 8 digits
  //       return number.length == 8;

  //     case 'SA':
  //     case 'AE':
  //       // Saudi Arabia / UAE: 9 digits
  //       return number.length == 9;

  //     case 'OM':
  //       // Oman: 8 digits
  //       return number.length == 8;

  //     default:
  //       // Default fallback: accept numbers between 8–12 digits
  //       return number.length >= 8 && number.length <= 12;
  //   }
  // }

  // static bool _isValidPatternForCountry(PhoneNumber value) {
  //   final number = value.number;
  //   final countryCode = value.countryISOCode;

  //   switch (countryCode) {
  //     case 'EG':
  //       // Egypt: must start with 10, 11, 12, or 15
  //       return RegExp('^(10|11|12|15)').hasMatch(number);

  //     case 'KW':
  //       // Kuwait: starts with 5–9
  //       return RegExp('^[5-9]').hasMatch(number);

  //     case 'SA':
  //     case 'AE':
  //       // Saudi Arabia / UAE: starts with 5
  //       return RegExp('^5').hasMatch(number);

  //     case 'OM':
  //       // Oman: starts with 7 or 9
  //       return RegExp('^[79]').hasMatch(number);

  //     default:
  //       // Default: allow any digits (basic sanity)
  //       return RegExp(r'^\d+$').hasMatch(number);
  //   }
  // }

  // static String? getCountryValidationMessage(PhoneNumber value) {
  //   final countryCode = value.countryISOCode;

  //   if (!_isValidPatternForCountry(value)) {
  //     switch (countryCode) {
  //       case 'EG':
  //         return 'الرقم المصري يجب أن يبدأ بـ 10 أو 11 أو 12 أو 15.';
  //       case 'KW':
  //         return 'الرقم الكويتي يجب أن يبدأ برقم من 5 إلى 9.';
  //       case 'SA':
  //         return 'الرقم السعودي يجب أن يبدأ بـ 5.';
  //       case 'AE':
  //         return 'الرقم الإماراتي يجب أن يبدأ بـ 5.';
  //       case 'OM':
  //         return 'الرقم العماني يجب أن يبدأ بـ 7 أو 9.';
  //       default:
  //         return 'رقم الهاتف لا يتوافق مع تنسيق الدولة المحددة.';
  //     }
  //   }

  //   if (!_isValidLengthForCountry(value)) {
  //     switch (countryCode) {
  //       case 'EG':
  //         return 'يجب أن يتكون رقم الهاتف المصري من 10 أرقام.';
  //       case 'KW':
  //         return 'يجب أن يتكون رقم الهاتف الكويتي من 8 أرقام.';
  //       case 'SA':
  //         return 'يجب أن يتكون رقم الهاتف السعودي من 9 أرقام.';
  //       case 'AE':
  //         return 'يجب أن يتكون رقم الهاتف الإماراتي من 9 أرقام.';
  //       case 'OM':
  //         return 'يجب أن يتكون رقم الهاتف العماني من 8 أرقام.';
  //       default:
  //         return 'عدد الأرقام لا يتوافق مع الدولة المحددة.';
  //     }
  //   }

  //   return null;
  // }

  /// Validates if a username contains only alphanumeric characters.
  ///
  /// @param username The username string to validate
  /// @return true if the username contains only alphanumeric characters,
  /// false otherwise
  static bool isUsernameValid(String username) {
    return RegExp(r'^[a-zA-Z0-9]{3,}$').hasMatch(username);
  }

  /// Validates if a string is a valid website URL.
  /// This is an alias for isUrlValid for semantic clarity.
  ///
  /// @param website The website URL string to validate
  /// @return true if the website URL format is valid, false otherwise
  static bool isWebsiteValid(String website) {
    return RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    ).hasMatch(website);
  }

  /// Validates if a URL is in a valid format.
  /// Supports HTTP and HTTPS protocols.
  static bool isUrlValid(String url) {
    return RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    ).hasMatch(url);
  }

  /// Validates if a string is a valid image URL.
  /// Optionally checks for common image extensions if checkExtension is true.
  ///
  /// @param imageUrl The image URL string to validate
  /// @param checkExtension Whether to verify the URL ends with
  /// a common image extension
  /// @return true if the image URL format is valid, false otherwise
  static bool isImageUrlValid(String imageUrl, {bool checkExtension = false}) {
    if (!isUrlValid(imageUrl)) {
      return false;
    }

    if (checkExtension) {
      // Check if URL ends with common image extensions
      final hasImageExtension = RegExp(
        r'\.(jpg|jpeg|png|gif|bmp|webp|svg)$',
        caseSensitive: false,
      ).hasMatch(imageUrl);

      if (!hasImageExtension) {
        return false;
      }
    }

    return true;
  }

  /// Validates if a string is a valid video URL.
  /// Optionally checks for common video extensions if checkExtension is true.
  ///
  /// @param videoUrl The video URL string to validate
  /// @param checkExtension Whether to verify the URL ends
  /// with a common video extension
  /// @return true if the video URL format is valid, false otherwise
  static bool isVideoUrlValid(String videoUrl, {bool checkExtension = false}) {
    if (!isUrlValid(videoUrl)) {
      return false;
    }

    if (checkExtension) {
      // Check if URL ends with common video extensions
      final hasVideoExtension = RegExp(
        r'\.(mp4|avi|mov|wmv|flv|mkv|webm)$',
        caseSensitive: false,
      ).hasMatch(videoUrl);

      if (!hasVideoExtension) {
        return false;
      }
    }

    return true;
  }

  /// Validates if a string is a valid file URL.
  /// This is an alias for isUrlValid for semantic clarity.
  ///
  /// @param fileUrl The file URL string to validate
  /// @return true if the file URL format is valid, false otherwise
  static bool isFileUrlValid(String fileUrl) {
    return isUrlValid(fileUrl);
  }

  /// Validates if an email address is in a valid format.
  ///
  /// @param email The email string to validate
  /// @return true if the email format is valid, false otherwise
  static bool isEmailValid(String email) {
    return RegExp(
      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
    ).hasMatch(email);
  }

  /// Validates if a password meets security requirements:
  /// - At least 8 characters
  /// - At least 1 uppercase letter
  /// - At least 1 lowercase letter
  /// - At least 1 number
  /// - At least 1 special character
  ///
  /// @param password The password string to validate
  /// @return true if the password meets all requirements, false otherwise
  static bool isPasswordValid(String password) {
    return hasMinLength(password) &&
        hasLowerCase(password) &&
        hasUpperCase(password) &&
        hasNumber(password) &&
        hasSpecialCharacter(password);
  }

  /// Checks if a string contains at least one lowercase letter.
  ///
  /// @param input The string to check
  /// @return true if the string contains a lowercase letter, false otherwise
  static bool hasLowerCase(String password) {
    return RegExp('[a-z]').hasMatch(password);
  }

  /// Checks if a string contains at least one uppercase letter.
  ///
  /// @param input The string to check
  /// @return true if the string contains an uppercase letter, false otherwise
  static bool hasUpperCase(String password) {
    return RegExp('[A-Z]').hasMatch(password);
  }

  /// Checks if a string contains at least one number.
  ///
  /// @param input The string to check
  /// @return true if the string contains a number, false otherwise
  static bool hasNumber(String password) {
    return RegExp('[0-9]').hasMatch(password);
  }

  /// Checks if a string contains at least one special character.
  ///
  /// @param input The string to check
  /// @return true if the string contains a special character, false otherwise
  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[@$!%*?&])').hasMatch(password);
  }

  /// Checks if a string is at least 8 characters long.
  ///
  /// @param input The string to check
  /// @return true if the string is at least 8 characters long, false otherwise
  static bool hasMinLength(String password) {
    return password.length >= 8;
  }
}

/*
validator: (value) {
if (value == null || value.isEmpty) {
return 'Email cannot be empty';
}
if (!AppRegex.isEmailValid(value)) {
return 'Please enter a valid email address';
}
return null; // Validation passed
},*/

/*
validator: (value) {
if (value == null || value.isEmpty) {
return 'Password cannot be empty';
}
if (!AppRegex.isPasswordValid(value)) {
return 'Password must have:\n'
'- At least 8 characters\n'
'- At least 1 uppercase letter\n'
'- At least 1 lowercase letter\n'
'- At least 1 number\n'
'- At least 1 special character';
}
return null; // Validation passed
},*/

// fe el cubit
// String? validateEmail(String? value) {
   // Check if email is empty
//   if (value == null || value.isEmpty) {
//     return 'Email field is required.';
//   }

  // Use existing AppRegex for email validation
//   if (!AppRegex.isEmailValid(value)) {
//     return 'Please enter a valid email address';
//   }

  // Optional: Additional custom validation rules
//   if (!value.contains('@')) {
//     return 'Email must contain @ symbol';
//   }

   // Optional: Domain-specific validation
//   final validDomains = ['gmail.com', 'outlook.com', 'yahoo.com'];
//   final domain = value.split('@').last;
//   if (!validDomains.contains(domain)) {
//     return 'Please use a valid email domain';
//   }

   // If all validations pass
//   return null;
// }



//   String? validatePassword(String? value) {
//     // Check if password is empty
//     if (value == null || value.isEmpty) {
//       return 'Password field is required.';
//     }

//     // Use existing AppRegex for password validation
//     if (!AppRegex.isPasswordValid(value)) {
//       return 'Password must have:\n'
//           '- At least 8 characters\n'
//           '- At least 1 uppercase letter\n'
//           '- At least 1 lowercase letter\n'
//           '- At least 1 number\n'
//           '- At least 1 special character';
//     }

//     // If all validations pass
//     return null;
//   }

  /// Validates if a password meets security requirements:
  /// - At least 8 characters
  /// - At least 1 uppercase letter
  /// - At least 1 lowercase letter
  /// - At least 1 number
  /// - At least 1 special character
  /// 
  /// @param password The password string to validate
  // /// @return true if the password meets all requirements, false otherwise
  // bool isPasswordValid(String? password) {
  //   if (password == null || password.isEmpty) {
  //     return false;
  //   }
    
  //   final result = hasMinLength(password) && 
  //                 hasLowerCase(password) && 
  //                 hasUpperCase(password) && 
  //                 hasNumber(password) && 
  //                 hasSpecialCharacter(password);
    
  //   return result;
  // }
  
