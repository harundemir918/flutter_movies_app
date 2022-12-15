import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/router/app_router.gr.dart';
import '../../core/utils/size_utils.dart';

class MoviesListCard extends StatelessWidget {
  final int id;
  final String title;
  final String posterPath;
  final String releaseDate;
  final String originalLanguage;
  final double voteAverage;

  const MoviesListCard({
    super.key,
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.originalLanguage,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        context.router.navigate(DetailRoute(id: id));
      },
      child: _moviesListCardBody(context),
    );
  }

  Container _moviesListCardBody(BuildContext context) {
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
          _moviesListCardRedBox(context),
          _moviesListCardImage(context),
          _moviesListCardInfo(),
        ],
      ),
    );
  }

  Container _moviesListCardRedBox(BuildContext context) {
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

  SizedBox _moviesListCardImage(BuildContext context) {
    return SizedBox(
      width: SizeUtils.getDynamicWidth(context, 0.25),
      height: SizeUtils.getDynamicHeight(context, 0.15),
      child: CachedNetworkImage(
        imageUrl: "https://image.tmdb.org/t/p/w500/$posterPath",
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, _, progress) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Expanded _moviesListCardInfo() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            _moviesListCardBasicInfo(),
            _moviesListCardVote(),
          ],
        ),
      ),
    );
  }

  Expanded _moviesListCardBasicInfo() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _moviesListCardTitle(),
          Row(
            children: [
              _moviesListCardYear(),
              _moviesListCardDotSign(),
              _moviesListCardOriginalLanguage(),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _moviesListCardYear() => Expanded(
        flex: 2,
        child: Text(
          DateFormat("MMM d, yyyy").format(
            DateTime.parse(releaseDate),
          ),
        ),
      );

  Padding _moviesListCardDotSign() {
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

  Column _moviesListCardVote() {
    return Column(
      children: [
        const Icon(
          Icons.star_rounded,
          color: Colors.amber,
        ),
        Text(
          voteAverage.toStringAsFixed(1),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Expanded _moviesListCardOriginalLanguage() => Expanded(
        child: Text(
          originalLanguage.toUpperCase(),
        ),
      );

  Text _moviesListCardTitle() {
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
