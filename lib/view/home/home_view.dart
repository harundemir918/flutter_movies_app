import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/home/home_bloc.dart';
import '../../core/models/genre_model.dart';
import '../../core/utils/size_utils.dart';
import '../widgets/genre_list_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/try_again_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<GenreModel> _genres = [];

  @override
  void initState() {
    context.read<HomeBloc>().add(FetchGenresEvent());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _genres = context.read<HomeBloc>().genresList;
    super.didChangeDependencies();
  }

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
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial || state is HomeLoading) {
            return _buildHomeLoading();
          }
          if (state is HomeLoaded) {
            return _buildHomeLoaded(state);
          }
          if (state is HomeFiltered) {
            return _buildHomeLoaded(state);
          } else {
            return _buildHomeError();
          }
        },
      ),
    );
  }

  Center _buildHomeLoading() =>
      const Center(child: CircularProgressIndicator());

  Column _buildHomeLoaded(dynamic state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _homeHeader(),
        const SizedBox(height: 10),
        _homeGenreList(genresList: state.genresList),
      ],
    );
  }

  TryAgainWidget _buildHomeError() {
    return TryAgainWidget(
      onPressed: () => context.read<HomeBloc>().add(FetchGenresEvent()),
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
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 10,
      ),
      child: SearchBar(
        onChanged: (val) => context.read<HomeBloc>().add(
              FilterGenresEvent(
                val,
                _genres,
              ),
            ),
      ),
    );
  }

  Flexible _homeGenreList({required List<GenreModel> genresList}) {
    return Flexible(
      child: ListView(
        padding: EdgeInsets.zero,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: genresList
            .map(
              (genre) => GenreListCard(id: genre.id!, title: genre.name!),
            )
            .toList(),
      ),
    );
  }
}
