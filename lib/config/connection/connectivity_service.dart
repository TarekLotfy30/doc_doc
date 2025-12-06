// ═══════════════════════════════════════════════════════════════
// CONNECTIVITY SERVICE
// ═══════════════════════════════════════════════════════════════
// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../core/constants/app_duration.dart';

/// Service for checking internet connectivity status
class ConnectivityService {
  ConnectivityService(this._connectivity);
  final Connectivity _connectivity;

  /// Default timeout for internet verification
  static const Duration _defaultTimeout = AppDurations.extraLongDelay;

  /// Default host for internet verification
  static const String _defaultHost = 'google.com';

  /// Checks if device has active internet connection
  ///
  /// Returns `true` if:
  /// - Device is connected to WiFi, Mobile, or Ethernet
  /// - Can successfully reach the internet (verified by DNS lookup)
  ///
  /// Returns `false` if:
  /// - No network connection available
  /// - Network is connected but no internet access (captive portal, etc.)
  ///
  /// 📱 _hasNetworkConnection(): "Am I connected to a WiFi network?" → YES
  ///🌐 _verifyInternetAccess(): "Can I actually reach websites on the internet?" → Maybe NO!
  Future<bool> hasInternetConnection({
    String host = _defaultHost,
    Duration timeout = _defaultTimeout,
  }) async {
    // Check connectivity type
    if (!await _hasNetworkConnection()) {
      return false;
    }

    // Verify actual internet access
    return _verifyInternetAccess(host: host, timeout: timeout);
  }

  /// Checks if device has any network connection (WiFi, Mobile, or Ethernet)
  Future<bool> _hasNetworkConnection() async {
    final connectivityResult = await _connectivity.checkConnectivity();

    return connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.ethernet);
  }

  /// Verifies real internet access by attempting DNS lookup
  /// Why Do We Need This?
  // The Problem: False Positives
  // connectivity_plus plugin only checks if you're connected to a network,
  // not if you have internet access.
  // Scenarios Where Network ≠ Internet:
  Future<bool> _verifyInternetAccess({
    required String host,
    required Duration timeout,
  }) async {
    try {
      final result = await InternetAddress.lookup(host).timeout(timeout);
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    } on TimeoutException catch (_) {
      return false;
    }
  }

  /// Stream of connectivity changes
  ///
  /// Emits `true` when internet is available, `false` otherwise
  Stream<bool> get connectivityStream {
    return _connectivity.onConnectivityChanged.asyncMap((_) async {
      return hasInternetConnection();
    });
  }

  /// Gets current connectivity result
  Future<List<ConnectivityResult>> getCurrentConnectivity() {
    return _connectivity.checkConnectivity();
  }
}
 // Listen to changes
// getIt<ConnectivityService>().connectivityStream.listen((hasInternet) {
   // Update UI state
