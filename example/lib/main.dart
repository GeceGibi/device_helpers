import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_helpers/flutter_helpers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DeviceInfo? deviceInfo;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Helpers.openAppSettings();

    // Helpers.updateBadgeRequest().then((_) {
    //   print(_);
    //   Helpers.badgeUpdate(20);
    // });

    FlutterHelpers.requestTrackingAuthorization().then((value) async {
      print(await FlutterHelpers.getIdfa());
    });

    final info = await FlutterHelpers.getDeviceInfo();

    setState(() {
      deviceInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $deviceInfo\n'),
        ),
      ),
    );
  }
}
