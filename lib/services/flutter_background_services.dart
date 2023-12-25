import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:jti_test/constant/service_constants.dart';

import 'package:http/http.dart' as http;

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  Timer.periodic(const Duration(seconds: 30), (timer) async {
    print('MINITORING HIT API PER 30 s');
    await getBgService();
    return;
  });
}

@pragma('vm:entry-point')
bool onIosBackground(ServiceInstance service) {
  DartPluginRegistrant.ensureInitialized();
  return false;
}

Future getBgService() async {
  try {
    var url = Uri.parse(ServiceConstans.bgService);
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "nama": "Cecep Solihin Yusup",
        "email": "cecepsolihinyusup@gmail.com",
        "nohp": "085864930084"
      }),
    );
    var code = response.statusCode;
    var jsonData = await json.decode(response.body);

    if (code == 200) {
      print('BACKGROUND HIT $jsonData');
    }
  } catch (e) {
    String message = e.toString();
    print(message);
  }
}

class BackgroundService {
  static final BackgroundService instance = BackgroundService();
  factory BackgroundService() {
    return instance;
  }

  Future init() async {
    final service = FlutterBackgroundService();
    await service.configure(
        iosConfiguration: IosConfiguration(
          autoStart: false,
          onBackground: onIosBackground,
          onForeground: onIosBackground,
        ),
        androidConfiguration: AndroidConfiguration(
          onStart: onStart,
          autoStart: true,
          isForegroundMode: true,
          notificationChannelId: 'my_foreground',
          initialNotificationTitle: 'AWESOME SERVICE',
          initialNotificationContent: 'Initializing',
          foregroundServiceNotificationId: 888,
        ));
    await service.startService();
  }
}
