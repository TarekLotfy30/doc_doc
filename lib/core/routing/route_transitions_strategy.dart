import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ───────────────────────────────────────────────────────────────
// ROUTE TYPES
// ───────────────────────────────────────────────────────────────
enum RouteType { slide, fade, cupertinoSheet, scale, rotation }

enum SlideDirection { rightToLeft, leftToRight, topToBottom, bottomToTop }

// ───────────────────────────────────────────────────────────────
// BASE STRATEGY (Interface)
// ───────────────────────────────────────────────────────────────
abstract interface class RouteTransitionStrategy {
  PageRoute<T> build<T>(Widget child, RouteSettings? settings);
}
