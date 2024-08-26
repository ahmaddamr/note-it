// Project imports:
import 'package:todo_app2/core/services/_service_interface.dart';
import 'package:todo_app2/core/services/debug_service.dart';

class Service extends ServiceInterface{

  @override
  String get name => 'Service'; 
  
  DebugService debugService = DebugService();
  
  @override
  Future<void> initialize() async{
    await debugService.initialize();
  }

  // singleton
  Service.init();

  static  Service? _instance;

  factory Service() => _instance ??= Service.init();
  
}
