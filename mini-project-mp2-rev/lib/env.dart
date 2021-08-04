import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  late Env value;
  String? appName;

  bool get isInDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }

  Env() {
    var mapConfig = dotenv.env;
    loadConfig(mapConfig);
    value = this;
  }

  loadConfig(Map<String, dynamic> config) async {
    this.appName = config['app_name'];
  }
}
