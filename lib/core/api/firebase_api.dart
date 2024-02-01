import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

Future<void>handelBackgroundMassage(RemoteMessage massage)async
{
  if (kDebugMode) {
    print('title${massage.notification?.title}');
  }
  if (kDebugMode) {
    print('body${massage.notification?.body}');
  }
  if (kDebugMode) {
    print('payLoad${massage.data}');
  }
}
class FirebaseApi
{
  final firebaseMassaging = FirebaseMessaging.instance;

  Future<void> initNotification()async
  {
    await firebaseMassaging.requestPermission();
    final fnmToken = await firebaseMassaging.getToken();
    if (kDebugMode) {
      print('token:$fnmToken');
    }
    FirebaseMessaging.onBackgroundMessage(handelBackgroundMassage);

  }

}