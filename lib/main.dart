import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:podcast_player_app/screens/podcast_detail_screen.dart';
import 'package:podcast_player_app/themes/colors.dart';
import 'package:podcast_player_app/providers/discover_podcasts_provider.dart';
import 'package:podcast_player_app/providers/podcasts_provider.dart';
import 'package:podcast_player_app/screens/tabs_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:podcast_player_app/themes/text_theme.dart';
import 'package:provider/provider.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => PodcastsProvider()),
        ChangeNotifierProvider(create: (ctx) => DiscoverPodcastsProvider()),
      ],
      child: MyApp(),
    ),
  );
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
