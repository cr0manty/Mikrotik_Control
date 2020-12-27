import 'package:flutter/material.dart';
import 'package:mikrotik_switch/routing/routing.dart';

class mikrotikApp extends StatefulWidget {
  @override
  _mikrotikAppState createState() => _mikrotikAppState();
}

class _mikrotikAppState extends State<mikrotikApp> {
  final AppRouting _routing = AppRouting();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      onGenerateRoute: _routing.generateRoute,
    );
  }

  @override
  void dispose() {
    _routing.dispose();
    super.dispose();
  }
}
