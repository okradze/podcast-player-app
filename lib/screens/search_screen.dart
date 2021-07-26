import 'package:flutter/material.dart';
import 'package:podcast_player_app/themes/colors.dart';
import 'package:podcast_player_app/widgets/search_input.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search-podcasts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightBackgroundColor,
        elevation: 0.0,
        title: Text(
          'Search podcasts',
          style: Theme.of(context).textTheme.headline5,
        ),
        iconTheme: IconThemeData(
          color: kTextColor,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SearchInput(),
            ],
          ),
        ),
      ),
    );
  }
}
