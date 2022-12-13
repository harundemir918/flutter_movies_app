import 'package:flutter/material.dart';
import 'package:flutter_movies_app/view/widgets/genre_list_card.dart';

import '../../core/utils/size_utils.dart';
import '../widgets/search_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _homeBody(),
    );
  }

  Container _homeBody() {
    return Container(
      width: SizeUtils.getWidth(context),
      height: SizeUtils.getHeight(context),
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: SizeUtils.getDynamicHeight(context, 0.05),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _homeHeader(),
          const SizedBox(height: 10),
          _homeGenreList(),
        ],
      ),
    );
  }

  Padding _homeHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Please choose a genre below.",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          _homeSearchBar(),
        ],
      ),
    );
  }

  Padding _homeSearchBar() {
    return const Padding(
      padding: EdgeInsets.only(
        top: 20,
        bottom: 10,
      ),
      child: SearchBar(),
    );
  }

  Flexible _homeGenreList() {
    return Flexible(
      child: ListView(
        padding: EdgeInsets.zero,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: const [
          GenreListCard(id: 1, title: "Action"),
          GenreListCard(id: 2, title: "Adventure"),
          GenreListCard(id: 3, title: "Animation"),
          GenreListCard(id: 4, title: "Comedy"),
          GenreListCard(id: 5, title: "Crime"),
          GenreListCard(id: 6, title: "Documentary"),
          GenreListCard(id: 7, title: "Drama"),
          GenreListCard(id: 8, title: "Family"),
          GenreListCard(id: 9, title: "Fantasy"),
          GenreListCard(id: 10, title: "History"),
        ],
      ),
    );
  }
}
