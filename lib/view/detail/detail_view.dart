import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_app/core/models/movie_model.dart';

import '../../core/models/genre_model.dart';
import '../../core/utils/size_utils.dart';

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
  final MovieModel _movieModel = MovieModel(
    id: 436270,
    originalTitle: "Black Adam",
    overview:
        "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
    genres: [
      GenreModel(id: 28, name: "Action"),
      GenreModel(id: 14, name: "Fantasy"),
      GenreModel(id: 878, name: "Science Fiction"),
    ],
    posterPath: "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
    releaseDate: "2022-10-19",
    runtime: 125,
    voteAverage: 7.3,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _detailBody(),
    );
  }

  NestedScrollView _detailBody() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          expandedHeight: SizeUtils.getDynamicHeight(context, 0.6),
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              foregroundDecoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),
              child: CachedNetworkImage(
                imageUrl:
                    "https://image.tmdb.org/t/p/original/${_movieModel.posterPath!}",
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              _movieModel.originalTitle!,
              style: TextStyle(
                fontSize: _movieModel.originalTitle!.length > 20 ? 14 : 18,
              ),
            ),
            centerTitle: true,
          ),
        ),
      ],
      body: _detailContent(),
    );
  }

  Widget _detailContent() {
    return Container(
      margin: EdgeInsets.only(
        left: SizeUtils.getDynamicWidth(context, 0.05),
        right: SizeUtils.getDynamicWidth(context, 0.05),
      ),
      child: ListView(
        children: [
          _detailSpecs(),
          _detailInfo(title: "Overview", content: _movieModel.overview!),
          _detailGenres(),
          _detailInfo(title: "Release Date", content: _movieModel.releaseDate!),
          _detailInfo(
              title: "Movie Duration", content: "${_movieModel.runtime!} mins"),
          SizedBox(
            height: SizeUtils.getDynamicHeight(context, 0.1),
          ),
        ],
      ),
    );
  }

  Padding _detailSpecs() {
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
                text: _movieModel.voteAverage!.toString(),
                children: const [
                  TextSpan(text: "/10", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            title: "Vote",
          ),
          _detailSpecsCard(
            content: Text(
              "${_movieModel.runtime!.toString()} mins",
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
              _movieModel.releaseDate!.substring(0, 4),
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

  Column _detailGenres() {
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
            children: _movieModel.genres!
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
