import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════════════
// ANIMATION CURVES
// ═══════════════════════════════════════════════════════════════
abstract final class AppAnimations {
  /// Standard curve for general UI transitions
  /// USE: Default for most animations, button presses, color changes
  /// EXAMPLES: Theme switching, icon color changes, background updates
  static const Curve standard = Curves.easeInOut;

  /// Smooth curve for entrance animations (starts slow, ends fast)
  /// USE: Elements appearing, expanding, or entering the screen
  /// EXAMPLES: Dialog opening, bottom sheet sliding up, list items appearing
  static const Curve entrance = Curves.easeOut;

  /// Quick curve for exit animations (starts fast, ends slow)
  /// USE: Elements disappearing, collapsing, or leaving the screen
  /// EXAMPLES: Dialog closing, snackbar dismissing, widgets fading out
  static const Curve exit = Curves.easeIn;

  /// Emphasized curve for important state changes (more dramatic)
  /// USE: Major UI changes that need user attention
  /// EXAMPLES: Page transitions, major layout changes, feature highlights
  static const Curve emphasized = Curves.easeInOutCubic;

  /// Smooth deceleration curve (fast start, smooth stop)
  /// USE: Natural feeling movements, user-initiated actions
  /// EXAMPLES: Scroll animations, drag-and-drop, swipe gestures
  static const Curve decelerate = Curves.decelerate;

  /// Spring-like curve for playful interactions (bouncy)
  /// USE: Fun, engaging interactions (use sparingly!)
  /// EXAMPLES: Success animations, game elements, celebration effects
  static const Curve spring = Curves.elasticOut;
}

  /// Configuration for fade transitions
  /// Duration: 300ms
  /// Curve: easeInOut (standard)

  /// Configuration for slide transitions
  /// Duration: 300ms
  /// Curve: easeInOut (standard)

  /// Configuration for scale transitions
  /// Duration: 200ms
  /// Curve: Curves.decelerate (decelerate)

  /// Configuration for page route transitions
  /// Duration: 300ms
  /// Curve: easeInOutCubic (emphasized)

  /// Configuration for bottom sheet animations
  /// Duration: 400ms
  /// Curve: Curves.decelerate (decelerate)

  /// Configuration for dialog animations
  /// Duration: 200ms
  /// Curve: Curves.decelerate (decelerate)
  ///
  /// Configuration for snackbar animations
  /// Duration: 200ms
  /// Curve: Curves.decelerate (decelerate)
  ///
  ///
  ///
  /// Most Common Combinations:
  ///
  /// Button/Icon interactions → ultraFast + standard curve
  /// List items appearing → fast + entrance curve
  /// Dialogs/Modals → fast + decelerate curve
  /// Bottom Sheets → medium + decelerate curve
  /// Page Transitions → standard + emphasized curve
  /// Fade in/out → fast + standard curve
