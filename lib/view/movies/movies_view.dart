import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/movies/movies_bloc.dart';
import '../../core/models/movie_model.dart';
import '../../core/utils/size_utils.dart';
import '../widgets/movies_list_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/try_again_widget.dart';

class MoviesView extends StatefulWidget {
  final int id;
  final String genre;

  const MoviesView({
    Key? key,
    required this.id,
    required this.genre,
  }) : super(key: key);

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  List<MovieModel> _movies = [];

  @override
  void initState() {
    context.read<MoviesBloc>().add(FetchMoviesEvent(id: widget.id));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _movies = context.read<MoviesBloc>().moviesList;
    super.didChangeDependencies();
  }

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
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesInitial || state is MoviesLoading) {
            return _buildMoviesLoading();
          }
          if (state is MoviesLoaded) {
            return _buildMoviesLoaded(state);
          }
          if (state is MoviesFiltered) {
            return _buildMoviesLoaded(state);
          } else {
            return _buildMoviesError();
          }
        },
      ),
    );
  }

  Center _buildMoviesLoading() =>
      const Center(child: CircularProgressIndicator());

  Column _buildMoviesLoaded(dynamic state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _moviesSearchBar(),
        const SizedBox(height: 10),
        _moviesList(moviesList: state.moviesList),
      ],
    );
  }

  TryAgainWidget _buildMoviesError() {
    return TryAgainWidget(
      onPressed: () =>
          context.read<MoviesBloc>().add(FetchMoviesEvent(id: widget.id)),
    );
  }

  Padding _moviesSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: SearchBar(
        onChanged: (val) => context.read<MoviesBloc>().add(
              FilterMoviesEvent(
                val,
                _movies,
              ),
            ),
      ),
    );
  }

  Flexible _moviesList({required List<MovieModel> moviesList}) {
    return Flexible(
      child: ListView(
        padding: EdgeInsets.zero,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: moviesList
            .map(
              (movie) => MoviesListCard(
                id: movie.id!,
                title: movie.title!,
                posterPath: movie.posterPath!,
                releaseDate: movie.releaseDate!,
                originalLanguage: movie.originalLanguage!,
                voteAverage: movie.voteAverage!,
              ),
            )
            .toList(),
      ),
    );
  }
}
