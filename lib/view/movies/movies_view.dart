import 'package:flutter/material.dart';
import 'package:flutter_movies_app/view/widgets/search_bar.dart';

import '../../core/utils/size_utils.dart';
import '../widgets/movie_list_card.dart';

class MoviesView extends StatefulWidget {
  final String genre;

  const MoviesView({Key? key, required this.genre}) : super(key: key);

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _moviesAppBar(),
      body: _moviesBody(),
    );
  }

  AppBar _moviesAppBar() {
    return AppBar(
      title: Text(
        widget.genre,
        style: const TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    );
  }

  Container _moviesBody() {
    return Container(
      width: SizeUtils.getWidth(context),
      height: SizeUtils.getHeight(context),
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: SizeUtils.getDynamicHeight(context, 0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _moviesSearchBar(),
          const SizedBox(height: 10),
          _moviesList(),
        ],
      ),
    );
  }

  Padding _moviesSearchBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: SearchBar(),
    );
  }

  Flexible _moviesList() {
    return Flexible(
      child: ListView(
        padding: EdgeInsets.zero,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: const [
          MovieListCard(
            id: 1,
            title: "Black Adam",
            genre: "Action",
            image: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
            year: "2022-10-19",
            averageVote: 7.3,
          ),
          MovieListCard(
            id: 1,
            title: "Troll",
            genre: "Action",
            image: "/53BC9F2tpZnsGno2cLhzvGprDYS.jpg",
            year: "2022-12-01",
            averageVote: 6.8,
          ),
          MovieListCard(
            id: 1,
            title: "The Woman King",
            genre: "Action",
            image: "/7zQJYV02yehWrQN6NjKsBorqUUS.jpg",
            year: "2022-09-15",
            averageVote: 7.9,
          ),
          MovieListCard(
            id: 1,
            title: "Black Adam",
            genre: "Action",
            image: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
            year: "2022-10-19",
            averageVote: 7.3,
          ),
          MovieListCard(
            id: 1,
            title: "Black Adam",
            genre: "Action",
            image: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
            year: "2022-10-19",
            averageVote: 7.3,
          ),
          MovieListCard(
            id: 1,
            title: "Black Adam",
            genre: "Action",
            image: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
            year: "2022-10-19",
            averageVote: 7.3,
          ),
          MovieListCard(
            id: 1,
            title: "Black Adam",
            genre: "Action",
            image: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
            year: "2022-10-19",
            averageVote: 7.3,
          ),
          MovieListCard(
            id: 1,
            title: "Black Adam",
            genre: "Action",
            image: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
            year: "2022-10-19",
            averageVote: 7.3,
          ),
          MovieListCard(
            id: 1,
            title: "Black Adam",
            genre: "Action",
            image: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
            year: "2022-10-19",
            averageVote: 7.3,
          ),
          MovieListCard(
            id: 1,
            title: "Black Adam",
            genre: "Action",
            image: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
            year: "2022-10-19",
            averageVote: 7.3,
          ),
        ],
      ),
    );
  }
}
