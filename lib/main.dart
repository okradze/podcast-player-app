import 'package:flutter/material.dart';
import 'package:podcast_player_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Podcast Player',
      theme: ThemeData(
        fontFamily: 'OpenSans',
      ),
      home: TabsScreen(),
    );
  }
}
