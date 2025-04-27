import 'package:denaurlen_task/screens/CoinValuationScreen.dart';
import 'package:denaurlen_task/screens/UserAuthScreen.dart';
import 'package:denaurlen_task/ui/CustomTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const DenaurlenTest());
}

class DenaurlenTest extends StatelessWidget {

  const DenaurlenTest({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Denaurlen-test',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: UserAuthScreen() ,
    );
  }
}

