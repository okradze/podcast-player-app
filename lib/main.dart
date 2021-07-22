import 'package:flutter/material.dart';
import 'package:podcast_player_app/colors.dart';
import 'package:podcast_player_app/providers/podcasts_provider.dart';
import 'package:podcast_player_app/screens/tabs_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => PodcastsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Podcast Player',
        theme: ThemeData(
          fontFamily: 'OpenSans',
          primaryColor: kPrimaryColor,
          accentColor: kSecondaryColor,
          scaffoldBackgroundColor: kLightBackgroundColor,
        ),
        home: TabsScreen(),
      ),
    );
  }
}
