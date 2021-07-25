import 'package:flutter/material.dart';
import 'package:podcast_player_app/my_app_icons.dart';
import 'package:podcast_player_app/themes/colors.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: kTextColor,
      ),
      decoration: InputDecoration(
        fillColor: kOffsetColor,
        filled: true,
        prefixIcon: Icon(
          MyAppIcons.search,
          color: Color(0xFFDEDEDE),
        ),
        contentPadding: const EdgeInsets.fromLTRB(12, 24, 15, 16),
        isDense: true,
        hintStyle: TextStyle(color: kLightBorder),
        hintText: 'Search podcasts',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: kOffsetColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Color(0xFFDEDEDE),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
