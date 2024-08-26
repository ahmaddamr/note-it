// Flutter imports:
import 'package:flutter/foundation.dart' show ChangeNotifier, kDebugMode;

abstract class ServiceInterface extends ChangeNotifier{ 
  String get name;

  bool get debugPrint => true;

  void d(String message) {
    if (kDebugMode && debugPrint) {
      // ignore: avoid_print
      print('[Service] [$name] $message');
    }
  }
  
  Future<void> initialize();
}
