import 'package:camel/src/screens/home.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "dashboard",
      initialRoute: "/",
      home: HomeScreen(),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.amber[400],
        accentColor: Colors.amberAccent[100],
        brightness: Brightness.light
      ),
    );
  }
}
