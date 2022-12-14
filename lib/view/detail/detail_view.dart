import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/bloc/detail/detail_bloc.dart';
import '../../core/models/genre_model.dart';
import '../../core/models/movie_model.dart';
import '../../core/utils/size_utils.dart';
import '../widgets/try_again_widget.dart';

class DetailView extends StatefulWidget {
  final int id;

  const DetailView({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  void initState() {
    context.read<DetailBloc>().add(FetchDetailEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _detailBody(),
    );
  }

  BlocBuilder<DetailBloc, DetailState> _detailBody() {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        if (state is DetailInitial || state is DetailLoading) {
          return _buildDetailLoading();
        }
        if (state is DetailLoaded) {
          return _buildDetailLoaded(state);
        } else {
          return _buildDetailError();
        }
      },
    );
  }

  Center _buildDetailLoading() =>
      const Center(child: CircularProgressIndicator());

  NestedScrollView _buildDetailLoaded(DetailLoaded state) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        _detailAppBar(
          context,
          state.movie.posterPath!,
          state.movie.title!,
        ),
      ],
      body: _detailContent(movie: state.movie),
    );
  }

  SizedBox _buildDetailError() {
    return SizedBox(
      width: SizeUtils.getWidth(context),
      child: TryAgainWidget(
        onPressed: () =>
            context.read<DetailBloc>().add(FetchDetailEvent(widget.id)),
      ),
    );
  }

  SliverAppBar _detailAppBar(BuildContext context, String url, String title) {
    return SliverAppBar(
      expandedHeight: SizeUtils.getDynamicHeight(context, 0.6),
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
          ),
          child: CachedNetworkImage(
            imageUrl: "https://image.tmdb.org/t/p/original/$url",
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, _, progress) => const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: title.length > 20 ? 14 : 18,
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  Widget _detailContent({required MovieModel movie}) {
    return Container(
      margin: EdgeInsets.only(
        left: SizeUtils.getDynamicWidth(context, 0.05),
        right: SizeUtils.getDynamicWidth(context, 0.05),
      ),
      child: ListView(
        children: [
          _detailSpecs(
            voteAverage: movie.voteAverage!.toStringAsFixed(1),
            runtime: movie.runtime!.toString(),
            releaseDate: movie.releaseDate!,
          ),
          _detailInfo(title: "Overview", content: movie.overview!),
          _detailGenres(genresList: movie.genres!),
          _detailInfo(title: "Release Date", content: movie.releaseDate!),
          _detailInfo(
              title: "Movie Duration", content: "${movie.runtime!} mins"),
          SizedBox(
            height: SizeUtils.getDynamicHeight(context, 0.1),
          ),
        ],
      ),
    );
  }

  Padding _detailSpecs({
    required String voteAverage,
    required String runtime,
    required String releaseDate,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _detailSpecsCard(
            content: Text.rich(
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              TextSpan(
                text: voteAverage,
                children: const [
                  TextSpan(text: "/10", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            title: "Vote",
          ),
          _detailSpecsCard(
            content: Text(
              "$runtime mins",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            title: "Duration",
          ),
          _detailSpecsCard(
            content: Text(
              DateFormat("yyyy").format(
                DateTime.parse(releaseDate),
              ),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            title: "Year",
          ),
        ],
      ),
    );
  }

  Column _detailSpecsCard({required Text content, required String title}) {
    return Column(
      children: [
        content,
        const SizedBox(height: 10),
        Text(title),
      ],
    );
  }

  Column _detailGenres({required List<GenreModel> genresList}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "Genres",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: SizeUtils.getDynamicHeight(context, 0.075),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: genresList
                .map((genre) => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            genre.name!,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  Column _detailInfo({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            content,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
