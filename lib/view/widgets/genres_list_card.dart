import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../core/models/genre_model.dart';
import '../../core/router/app_router.gr.dart';
import '../../core/utils/size_utils.dart';

class GenresListCard extends StatelessWidget {
  final GenreModel genre;

  const GenresListCard({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        context.router.navigate(
          MoviesRoute(
            genre: genre,
          ),
        );
      },
      child: _genresListCardBody(context),
    );
  }

  Container _genresListCardBody(BuildContext context) {
    return Container(
      width: SizeUtils.getWidth(context),
      height: SizeUtils.getDynamicHeight(context, 0.1),
      margin: EdgeInsets.symmetric(
        horizontal: SizeUtils.getDynamicWidth(context, 0.02),
        vertical: SizeUtils.getDynamicHeight(context, 0.01),
      ),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: kShadowColor,
            blurRadius: 4,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          _genresListCardRedBox(context),
          _genresListCardTitle(),
        ],
      ),
    );
  }

  Container _genresListCardRedBox(BuildContext context) {
    return Container(
      width: 10,
      height: SizeUtils.getDynamicHeight(context, 0.1),
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(8.0),
        ),
      ),
    );
  }

  Expanded _genresListCardTitle() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(genre.name!),
      ),
    );
  }
}
