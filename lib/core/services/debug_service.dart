// Package imports:
import 'package:logger/logger.dart';
import 'package:todo_app2/core/services/_service_interface.dart';
// Project imports:

class Debug {
  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) => DebugService.log.t(message, error: error, stackTrace: stackTrace);
  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) => DebugService.log.i(message, error: error, stackTrace: stackTrace);
  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) => DebugService.log.e(message, error: error, stackTrace: stackTrace);
  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) => DebugService.log.d(message, error: error, stackTrace: stackTrace);
  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) => DebugService.log.w(message, error: error, stackTrace: stackTrace);
  static void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) => DebugService.log.f(message, error: error, stackTrace: stackTrace);
  static void log(Level level,dynamic message, [dynamic error, StackTrace? stackTrace]) => DebugService.log.log(level, message, error: error, stackTrace: stackTrace);

  static void vt(dynamic message, [dynamic error, StackTrace? stackTrace]) => DebugService.logTrace.t(message, error: error, stackTrace: stackTrace);
  static void it(dynamic message, [dynamic error, StackTrace? stackTrace]) => DebugService.logTrace.i(message, error: error, stackTrace: stackTrace);
  static void et(dynamic message, [dynamic error, StackTrace? stackTrace]) => DebugService.logTrace.e(message, error: error, stackTrace: stackTrace);
  static void dt(dynamic message, [dynamic error, StackTrace? stackTrace]) => DebugService.logTrace.d(message, error: error, stackTrace: stackTrace);
  static void wt(dynamic message, [dynamic error, StackTrace? stackTrace]) => DebugService.logTrace.w(message, error: error, stackTrace: stackTrace);
  static void wtft(dynamic message, [dynamic error, StackTrace? stackTrace]) => DebugService.logTrace.f(message, error: error, stackTrace: stackTrace);
  static void logt(Level level,dynamic message, [dynamic error, StackTrace? stackTrace]) => DebugService.logTrace.log(level, message, error: error, stackTrace: stackTrace);
}

class DebugService extends ServiceInterface {
 

  static Logger logTrace = Logger(
    printer: PrettyPrinter(
      methodCount: 4,
      lineLength: 120,
    ),
  );
  
  static Logger log = Logger(
    printer: SimplePrinter(),
  );


  @override
  Future initialize() async {
    
  }

  void blocDebugStart() {

  }
  

  // singleton
  DebugService.init();
  static DebugService? _instance;
  factory DebugService() => _instance ??= DebugService.init();
  
  @override
  String get name => 'Debug Service';
}
