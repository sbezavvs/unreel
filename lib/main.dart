import 'package:Unreel/src/logic/utils/app_theme.dart';
import 'package:Unreel/src/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/views/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
    ));

    bool _loggedIn = checkLoggedStatus();
    Widget _initScreen = Login();

    if (_loggedIn) {
      _initScreen = MainScreen();
    }

    return MaterialApp(
      title: 'Unreel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.android,
      ),
      home: _initScreen,
    );
  }

  bool checkLoggedStatus() {
    // TODO Firebase integration
    return false;
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
