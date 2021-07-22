import 'package:flutter/material.dart';
import 'package:podcast_player_app/colors.dart';
import 'package:podcast_player_app/my_app_icons.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> tabs = [
    Text('Podcasts'),
    Text('Discover'),
    Text('Playing')
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
        title: Text('Podcast'),
      ),
      body: IndexedStack(
        index: selectedTabIndex,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectTab,
        currentIndex: selectedTabIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 22,
        selectedItemColor: kSecondaryColor,
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
