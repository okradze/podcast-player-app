import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_player_app/bloc/podcasts_bloc.dart';
import 'package:podcast_player_app/themes/colors.dart';
import 'package:podcast_player_app/my_app_icons.dart';
import 'package:podcast_player_app/screens/discover_podcasts_screen.dart';
import 'package:podcast_player_app/screens/podcast_detail_screen.dart';
import 'package:podcast_player_app/screens/podcasts_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> tabs = [
    PodcastsScreen(),
    DiscoverPodcastsScreen(),
    // PodcastDetailScreen(),
  ];
  final List<String> appBarLabels = [
    'Podcasts',
    'Discover New Podcasts',
    'Now Playing'
  ];
  int selectedTabIndex = 0;

  void selectTab(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarLabels[selectedTabIndex],
          style: TextStyle(
            color: kSecondaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: kOffsetColor,
        elevation: 0.0,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<PodcastsBloc>(create: (ctx) => PodcastsBloc()),
        ],
        child: IndexedStack(
          index: selectedTabIndex,
          children: tabs,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectTab,
        currentIndex: selectedTabIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 22,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: kTextColor,
        backgroundColor: kOffsetColor,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MyAppIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(MyAppIcons.search),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(MyAppIcons.podcast),
            label: 'Podcast',
          ),
        ],
      ),
    );
  }
}
