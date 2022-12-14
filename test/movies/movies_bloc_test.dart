import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_movies_app/core/bloc/movies/movies_bloc.dart';
import 'package:flutter_movies_app/core/resources/mock/mock_movies.dart';
import 'package:flutter_movies_app/core/resources/repository/movies/movies_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movies_bloc_test.mocks.dart';

@GenerateMocks([MoviesRepository])
void main() {
  late MockMoviesRepository mockMoviesRepository;

  setUp(() {
    mockMoviesRepository = MockMoviesRepository();
  });

  group("Test MoviesBloc", () {
    group("fetch moviesList", () {
      blocTest(
        "fetch moviesList and emit [MoviesLoading, MoviesLoaded] states when successful",
        build: () {
          when(mockMoviesRepository.fetchMoviesList())
              .thenAnswer((_) async => mockMoviesList);
          return MoviesBloc(mockMoviesRepository);
        },
        act: (bloc) => bloc.add(FetchMoviesEvent()),
        wait: const Duration(seconds: 1),
        expect: () => [MoviesLoading(), MoviesLoaded(mockMoviesList)],
      );

      blocTest(
        "throw exception and emit [MoviesLoading, MoviesError] states when failed",
        build: () {
          when(mockMoviesRepository.fetchMoviesList())
              .thenThrow(Exception("Failed to fetch data."));
          return MoviesBloc(mockMoviesRepository);
        },
        act: (bloc) => bloc.add(FetchMoviesEvent()),
        wait: const Duration(seconds: 1),
        expect: () =>
            [MoviesLoading(), MoviesError("Exception: Failed to fetch data.")],
      );
    });

    group("search keywords in moviesList", () {
      blocTest(
        "emit [MoviesFiltered] with all movies when keyword is empty",
        build: () {
          when(mockMoviesRepository.filterMoviesList("", mockMoviesList))
              .thenAnswer((_) => mockMoviesList);
          return MoviesBloc(mockMoviesRepository);
        },
        act: (bloc) => bloc.add(FilterMoviesEvent("", mockMoviesList)),
        wait: const Duration(seconds: 1),
        expect: () => [MoviesFiltered(mockMoviesList)],
      );

      blocTest(
        "search keyword in moviesList and emit [MoviesFiltered] with found movies",
        build: () {
          when(mockMoviesRepository.filterMoviesList("re", mockMoviesList))
              .thenAnswer((_) => mockMoviesList);
          return MoviesBloc(mockMoviesRepository);
        },
        act: (bloc) => bloc.add(FilterMoviesEvent("re", mockMoviesList)),
        wait: const Duration(seconds: 1),
        expect: () => [MoviesFiltered(mockMoviesList)],
      );

      blocTest(
        "search keyword in moviesList and emit [MoviesFiltered] with empty list",
        build: () {
          when(mockMoviesRepository.filterMoviesList("yellow", mockMoviesList))
              .thenAnswer((_) => []);
          return MoviesBloc(mockMoviesRepository);
        },
        act: (bloc) => bloc.add(FilterMoviesEvent("yellow", mockMoviesList)),
        wait: const Duration(seconds: 1),
        expect: () => [MoviesFiltered(const [])],
      );
    });
  });
}
