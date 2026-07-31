import 'dart:async';

import 'package:sensors_plus/sensors_plus.dart';

class MotionService {
  StreamSubscription<AccelerometerEvent>? _subscription;

  bool _isRunning = false;

  bool get isRunning => _isRunning;

  /// Movement sensitivity
  /// Increase = less sensitive
  /// Decrease = more sensitive
  static const double movementThreshold = 15.0;

  void start({
    required VoidCallback onMotionDetected,
  }) {
    if (_isRunning) return;

    _isRunning = true;

    _subscription = accelerometerEventStream().listen((event) {
      final movement =
          event.x.abs() +
          event.y.abs() +
          event.z.abs();

      if (movement > movementThreshold) {
        onMotionDetected();
      }
    });
  }

  Future<void> stop() async {
    await _subscription?.cancel();
    _subscription = null;
    _isRunning = false;
  }

  void dispose() {
    _subscription?.cancel();
  }
}

typedef VoidCallback = void Function();
