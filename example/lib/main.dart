import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_utils/flutter_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _appVersionName = 'Unknown';
  String _appVersionCode = 'Unknown';
  String _androidId = 'Unknown';
  bool _isAppDebug = false;

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    String appVersionName = 'Unknown';
    String appVersionCode = 'Unknown';
    String androidId = 'Unknown';
    bool isAppDebug = false;
    try {
      appVersionName = await FlutterUtils.appVersionName;
      appVersionCode = await FlutterUtils.appVersionCode;
      androidId = await FlutterUtils.uuid;
      isAppDebug = await FlutterUtils.isAppDebug;
    } on PlatformException {
      appVersionName = 'Failed to get platform version.';
      appVersionCode = 'Failed to get platform version.';
      androidId = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _appVersionName = appVersionName;
      _appVersionCode = appVersionCode;
      _androidId = androidId;
      _isAppDebug = isAppDebug;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('android id: $_androidId'),
              Text('app version name: $_appVersionName'),
              Text('app verison code: $_appVersionCode'),
              Text('app is debug: $_isAppDebug'),
            ],
          ),
        ),
      ),
    );
  }
}
