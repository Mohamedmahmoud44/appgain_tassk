import 'package:appgain_task/bloc_observer.dart';
import 'package:appgain_task/core/api/firebase_api.dart';
import 'package:appgain_task/firebase_options.dart';
import 'package:appgain_task/injection_containar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Future.wait([
    initInjectionContainer(),
    FirebaseApi().initNotification(),
  ]);
  runApp(const MyApp());
}
