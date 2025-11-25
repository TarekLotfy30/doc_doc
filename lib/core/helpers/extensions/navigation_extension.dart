// The BC extension for accessing Navigator, perform to navigate between differ
//  screens of our application. This can be useful for changing screens after a
//  user action.
import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
}

// Extension usage
// context.navigator.push(
//   MaterialPageRoute(builder: (context) => ProductDetail(product)),
// );
