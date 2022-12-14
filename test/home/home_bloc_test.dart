import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_movies_app/core/bloc/home/home_bloc.dart';
import 'package:flutter_movies_app/core/resources/mock/mock_movies.dart';
import 'package:flutter_movies_app/core/resources/repository/genres/fake/fake_genres_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([FakeGenresRepository])
void main() {
  late MockFakeGenresRepository mockGenresRepository;

  setUp(() {
    mockGenresRepository = MockFakeGenresRepository();
  });

  group("Test HomeBloc", () {
    group("fetch genresList", () {
      blocTest(
        "fetch genresList and emit [HomeLoading, HomeLoaded] states when successful",
        build: () {
          when(mockGenresRepository.fetchGenresList())
              .thenAnswer((_) async => mockGenresList);
          return HomeBloc(mockGenresRepository);
        },
        act: (bloc) => bloc.add(FetchGenresEvent()),
        wait: const Duration(seconds: 1),
        expect: () => [HomeLoading(), HomeLoaded(mockGenresList)],
      );

      blocTest(
        "throw exception and emit [HomeLoading, HomeError] states when failed",
        build: () {
          when(mockGenresRepository.fetchGenresList())
              .thenThrow(Exception("Failed to fetch data."));
          return HomeBloc(mockGenresRepository);
        },
        act: (bloc) => bloc.add(FetchGenresEvent()),
        wait: const Duration(seconds: 1),
        expect: () => [
          HomeLoading(),
          const HomeError("Exception: Failed to fetch data.")
        ],
      );
    });

    group("search keywords in genresList", () {
      blocTest(
        "emit [HomeFiltered] with all genres when keyword is empty",
        build: () {
          when(mockGenresRepository.filterGenresList("", mockGenresList))
              .thenAnswer((_) => mockGenresList);
          return HomeBloc(mockGenresRepository);
        },
        act: (bloc) => bloc.add(FilterGenresEvent("", mockGenresList)),
        wait: const Duration(seconds: 1),
        expect: () => [HomeFiltered(mockGenresList)],
      );

      blocTest(
        "search keyword in genresList and emit [HomeFiltered] with found genres",
        build: () {
          when(mockGenresRepository.filterGenresList("y", mockGenresList))
              .thenAnswer((_) => mockGenresList);
          return HomeBloc(mockGenresRepository);
        },
        act: (bloc) => bloc.add(FilterGenresEvent("y", mockGenresList)),
        wait: const Duration(seconds: 1),
        expect: () => [HomeFiltered(mockGenresList)],
      );

      blocTest(
        "search keyword in genresList and emit [HomeFiltered] with empty list",
        build: () {
          when(mockGenresRepository.filterGenresList("genre", mockGenresList))
              .thenAnswer((_) => []);
          return HomeBloc(mockGenresRepository);
        },
        act: (bloc) => bloc.add(FilterGenresEvent("genre", mockGenresList)),
        wait: const Duration(seconds: 1),
        expect: () => [const HomeFiltered([])],
      );
    });
  });
}
