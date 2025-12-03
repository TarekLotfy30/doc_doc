// // ═══════════════════════════════════════════════════════════════
// // LANGUAGE INTERCEPTOR
// // Path: lib/core/network/api_consumer/interceptors/language_interceptor.dart
// // ═══════════════════════════════════════════════════════════════

// import 'package:dio/dio.dart';

// import '../../../../core/helpers/classes/app_logger.dart';
// import '../../localization/local_service.dart';

// /// Interceptor that adds language headers to all API requests
// /// Ensures backend receives correct locale for localized responses
// // translate-me-ignore-all-file
// class LanguageInterceptor extends Interceptor {
//   LanguageInterceptor(this._localeService);

//   final LocaleService _localeService;
//   static const String _tag = 'LANGUAGE_INTERCEPTOR';

//   // Header keys for language
//   static const String _langHeaderKey = 'lang';
//   static const String _acceptLanguageKey = 'Accept-Language';

//   // Default language fallback
//   static const String _defaultLanguage = 'en';

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     try {
//       final currentLocale = _localeService.currentLocale;
//       final languageCode = currentLocale?.languageCode ?? _defaultLanguage;
//       final countryCode = currentLocale?.countryCode;

//       // Add simple language code (e.g., 'en', 'ar')
//       options.headers[_langHeaderKey] = languageCode;

//       // Add standard Accept-Language header (e.g., 'en-US', 'ar-EG')
//       final acceptLanguage = countryCode != null
//           ? '$languageCode-$countryCode'
//           : languageCode;

//       options.headers[_acceptLanguageKey] = acceptLanguage;

//       Logger.debug(
//         'Language headers added: $languageCode ($acceptLanguage)',
//         _tag,
//       );
//     } catch (error) {
//       Logger.error('Error adding language headers: $error', _tag);

//       // Fallback to default language
//       options.headers[_langHeaderKey] = _defaultLanguage;
//       options.headers[_acceptLanguageKey] = _defaultLanguage;

//       rethrow;
//     }

//     handler.next(options);
//   }
// }
