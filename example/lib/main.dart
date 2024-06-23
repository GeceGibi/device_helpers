import 'package:flutter/material.dart';
import 'dart:async';

import 'package:device_helpers/device_helpers.dart';

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

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Helpers.openAppSettings();

    // Helpers.updateBadgeRequest().then((_) {
    //   print(_);
    //   Helpers.badgeUpdate(20);
    // });

    DeviceHelpers.requestTrackingAuthorization().then((value) async {
      print(await DeviceHelpers.getIdfa());
    });

    final info = await DeviceHelpers.getInfo();

    setState(() {
      deviceInfo = info;
    });
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
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
