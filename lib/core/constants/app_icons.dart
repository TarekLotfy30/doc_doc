// ═══════════════════════════════════════════════════════════════
// ICON CONSTANTS
// ═══════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';

abstract final class AppIcons {
  // ----------------------------- Material Icons ------------------------------

  // Authentication & User
  /// Email icon for login/signup forms
  static const IconData email = Icons.email_outlined;

  /// Password icon for secure input fields
  static const IconData password = Icons.lock_outline;

  /// Show password icon
  static const IconData visibility = Icons.visibility_outlined;

  /// Hide password icon
  static const IconData visibilityOff = Icons.visibility_off_outlined;

  /// User profile icon
  static const IconData user = Icons.person_outline;

  /// User account/profile icon (filled)
  static const IconData userFilled = Icons.person;

  /// Edit profile icon
  static const IconData edit = Icons.edit_outlined;

  /// Logout icon
  static const IconData logout = Icons.logout_outlined;

  // Navigation
  /// Back navigation arrow
  static const IconData back = Icons.arrow_back_ios_new_rounded;

  /// Forward navigation arrow
  static const IconData forward = Icons.arrow_forward_ios_rounded;

  /// Home icon
  static const IconData home = Icons.home_outlined;

  /// Home icon (filled)
  static const IconData homeFilled = Icons.home;

  /// Search icon
  static const IconData search = Icons.search_rounded;

  /// Menu icon
  static const IconData menu = Icons.menu_rounded;

  /// Close icon
  static const IconData close = Icons.close_rounded;

  /// Settings icon
  static const IconData settings = Icons.settings_outlined;

  // Status & Feedback
  /// Error state icon
  static const IconData error = Icons.error_outline;

  /// Success state icon
  static const IconData success = Icons.check_circle_outline;

  /// Warning state icon
  static const IconData warning = Icons.warning_amber_outlined;

  /// Info state icon
  static const IconData info = Icons.info_outline;

  /// Loading/refresh icon
  static const IconData refresh = Icons.refresh_rounded;

  // Actions
  /// Add/create icon
  static const IconData add = Icons.add_rounded;

  /// Delete/remove icon
  static const IconData delete = Icons.delete_outline;

  /// Favorite/like icon (outlined)
  static const IconData favorite = Icons.favorite_border;

  /// Favorite/like icon (filled)
  static const IconData favoriteFilled = Icons.favorite;

  /// Share icon
  static const IconData share = Icons.share_outlined;

  /// Filter icon
  static const IconData filter = Icons.filter_list_rounded;

  /// Sort icon
  static const IconData sort = Icons.sort_rounded;

  /// Download icon
  static const IconData download = Icons.download_outlined;

  /// Upload icon
  static const IconData upload = Icons.upload_outlined;

  // Shopping & E-commerce
  /// Shopping cart icon (outlined)
  static const IconData cart = Icons.shopping_cart_outlined;

  /// Shopping cart icon (filled)
  static const IconData cartFilled = Icons.shopping_cart;

  /// Shopping bag icon
  static const IconData bag = Icons.shopping_bag_outlined;

  /// Payment/card icon
  static const IconData payment = Icons.credit_card_outlined;

  /// Wishlist icon
  static const IconData wishlist = Icons.favorite_border;

  // Communication
  /// Notification icon (outlined)
  static const IconData notification = Icons.notifications_outlined;

  /// Notification icon (filled)
  static const IconData notificationFilled = Icons.notifications;

  /// Chat/message icon
  static const IconData chat = Icons.chat_bubble_outline;

  /// Phone/call icon
  static const IconData phone = Icons.phone_outlined;

  /// Mail icon
  static const IconData mail = Icons.mail_outline;

  // Media
  /// Camera icon
  static const IconData camera = Icons.camera_alt_outlined;

  /// Image/photo icon
  static const IconData image = Icons.image_outlined;

  /// Video icon
  static const IconData video = Icons.videocam_outlined;

  /// Play icon
  static const IconData play = Icons.play_arrow_rounded;

  /// Pause icon
  static const IconData pause = Icons.pause_rounded;

  // Location
  /// Location/map pin icon
  static const IconData location = Icons.location_on_outlined;

  /// Map icon
  static const IconData map = Icons.map_outlined;

  /// GPS/navigation icon
  static const IconData gps = Icons.gps_fixed_rounded;

  // Time & Date
  /// Calendar icon
  static const IconData calendar = Icons.calendar_today_outlined;

  /// Clock/time icon
  static const IconData clock = Icons.access_time_rounded;

  /// History icon
  static const IconData history = Icons.history_rounded;

  // Miscellaneous
  /// Star rating icon (outlined)
  static const IconData star = Icons.star_border_rounded;

  /// Star rating icon (filled)
  static const IconData starFilled = Icons.star_rounded;

  /// Help/support icon
  static const IconData help = Icons.help_outline;

  /// Language icon
  static const IconData language = Icons.language_rounded;

  /// Dark mode icon
  static const IconData darkMode = Icons.dark_mode_outlined;

  /// Light mode icon
  static const IconData lightMode = Icons.light_mode_outlined;

  // ----------------------------- Custom SVG Icons ----------------------------

  // Navigation Arrows
  /// Left arrow for navigation
  static const String leftArrow = 'assets/svgs/icons/left_arrow.svg';

  /// Right arrow for navigation
  static const String rightArrow = 'assets/svgs/icons/right_arrow.svg';

  // Social Media Icons
  /// Google logo for social login
  static const String google = 'assets/svgs/icons/google.svg';

  /// Apple logo for social login
  static const String apple = 'assets/svgs/icons/apple.svg';

  /// Apple logo (dark theme)
  static const String appleDark = 'assets/svgs/icons/apple_dark.svg';

  /// Facebook logo for social login
  static const String facebook = 'assets/svgs/icons/facebook.svg';

  /// Twitter/X logo for social login
  static const String twitter = 'assets/svgs/icons/twitter.svg';

  // Brand Icons
  /// App logo icon
  static const String logo = 'assets/svgs/icons/logo.svg';

  /// App logo (small variant)
  static const String logoSmall = 'assets/svgs/icons/logo_small.svg';
}
