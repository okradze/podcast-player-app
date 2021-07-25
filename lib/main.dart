import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:podcast_player_app/screens/podcast_detail_screen.dart';
import 'package:podcast_player_app/themes/colors.dart';
import 'package:podcast_player_app/screens/tabs_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:podcast_player_app/themes/text_theme.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: kOffsetColor,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: kLightBackgroundColor,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Podcast Player',
      theme: ThemeData(
        textTheme: DEFAULT_TEXT_THEME,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
        primaryColor: kPrimaryColor,
        accentColor: kSecondaryColor,
        scaffoldBackgroundColor: kLightBackgroundColor,
      ),
      routes: {
        '/': (ctx) => TabsScreen(),
        PodcastDetailScreen.routeName: (ctx) => PodcastDetailScreen(),
      },
    );
  }
}
