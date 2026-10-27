import 'package:flutter_background/flutter_background.dart';

class BackgroundServiceHelper {
  
  static Future<bool> iniciarServicoBackground() async {
    final androidConfig = FlutterBackgroundAndroidConfig(
      notificationTitle: "Visão Acessível Ativa",
      notificationText: "O aplicativo está monitorando o ambiente em segundo plano.",
      notificationIcon: AndroidResource(name: 'mipmap', defType: 'ic_launcher'), 
      enableWifiLock: true, 
    );
    
    bool initialized = await FlutterBackground.initialize(androidConfig: androidConfig);
    if (!initialized) {
      return false;
    }

    bool hasPermissions = await FlutterBackground.enableBackgroundExecution();
    return hasPermissions;
  }

  static Future<void> pararServicoBackground() async {
    if (FlutterBackground.isBackgroundExecutionEnabled) {
      await FlutterBackground.disableBackgroundExecution();
    }
  }
}