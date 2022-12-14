import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_movies_app/core/bloc/detail/detail_bloc.dart';
import 'package:flutter_movies_app/core/resources/mock/mock_movies.dart';
import 'package:flutter_movies_app/core/resources/repository/movies/fake/fake_movies_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'detail_bloc_test.mocks.dart';

@GenerateMocks([FakeMoviesRepository])
void main() {
  late MockFakeMoviesRepository mockMoviesRepository;

  setUp(() {
    mockMoviesRepository = MockFakeMoviesRepository();
  });

  group("Test DetailBloc", () {
    group("fetch movie details", () {
      blocTest(
        "fetch movie details and emit [DetailLoading, DetailLoaded] states when successful",
        build: () {
          when(mockMoviesRepository.fetchMovieDetail(1))
              .thenAnswer((_) async => mockMovieDetail);
          return DetailBloc(mockMoviesRepository);
        },
        act: (bloc) => bloc.add(const FetchDetailEvent(1)),
        wait: const Duration(seconds: 1),
        expect: () => [DetailLoading(), DetailLoaded(mockMovieDetail)],
      );

      blocTest(
        "throw exception and emit [MoviesLoading, MoviesError] states when failed",
        build: () {
          when(mockMoviesRepository.fetchMovieDetail(1))
              .thenThrow(Exception("Failed to fetch data."));
          return DetailBloc(mockMoviesRepository);
        },
        act: (bloc) => bloc.add(const FetchDetailEvent(1)),
        wait: const Duration(seconds: 1),
        expect: () =>
            [DetailLoading(), DetailError("Exception: Failed to fetch data.")],
      );
    });
  });
}
