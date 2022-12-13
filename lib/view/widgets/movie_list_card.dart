import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_app/core/router/app_router.gr.dart';

import '../../core/utils/size_utils.dart';

class MovieListCard extends StatelessWidget {
  final int id;
  final String title;
  final String image;
  final String year;
  final String genre;
  final double averageVote;

  const MovieListCard({
    super.key,
    required this.id,
    required this.title,
    required this.image,
    required this.year,
    required this.genre,
    required this.averageVote,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        context.router.navigate(DetailRoute(id: id));
      },
      child: _movieListCardBody(context),
    );
  }

  Container _movieListCardBody(BuildContext context) {
    return Container(
      width: SizeUtils.getWidth(context),
      height: SizeUtils.getDynamicHeight(context, 0.15),
      margin: EdgeInsets.symmetric(
        horizontal: SizeUtils.getDynamicWidth(context, 0.02),
        vertical: SizeUtils.getDynamicHeight(context, 0.01),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          _movieListCardRedBox(context),
          _movieListCardImage(context),
          _movieListCardInfo(),
        ],
      ),
    );
  }

  Container _movieListCardRedBox(BuildContext context) {
    return Container(
      width: 10,
      height: SizeUtils.getDynamicHeight(context, 0.15),
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(8.0),
        ),
      ),
    );
  }

  SizedBox _movieListCardImage(BuildContext context) {
    return SizedBox(
      width: SizeUtils.getDynamicWidth(context, 0.25),
      height: SizeUtils.getDynamicHeight(context, 0.15),
      child: CachedNetworkImage(
        imageUrl: "https://image.tmdb.org/t/p/w500/$image",
        fit: BoxFit.cover,
      ),
    );
  }

  Expanded _movieListCardInfo() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            _movieListCardBasicInfo(),
            _movieListCardVote(),
          ],
        ),
      ),
    );
  }

  Expanded _movieListCardBasicInfo() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _movieListCardTitle(),
          Row(
            children: [
              _movieListCardYear(),
              _movieListCardDotSign(),
              _movieListCardGenre(),
            ],
          ),
        ],
      ),
    );
  }

  Text _movieListCardYear() => Text(year);

  Padding _movieListCardDotSign() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        "•",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Column _movieListCardVote() {
    return Column(
      children: [
        const Icon(
          Icons.star_rounded,
          color: Colors.amber,
        ),
        Text(
          averageVote.toStringAsFixed(1),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Text _movieListCardGenre() => Text(genre);

  Text _movieListCardTitle() {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
