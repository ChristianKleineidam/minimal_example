import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  MethodChannel _channel = MethodChannel('logging_to_logcat');
  _channel.invokeListMethod("log", ["aa"]);

  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  AppLifecycleState? state;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);

    super.dispose();
  }

  void didChangeAppLifeCycleState(AppLifecycleState appLifecycleState) {
    state = appLifecycleState;
    print(appLifecycleState);
    print(":::::::");
  }

  @override
  Widget build(BuildContext context) {
    print("app start");
    return Scaffold(
      body: Container(
        child: Center(child: Text("hi")),
      ),
    );
  }
}
