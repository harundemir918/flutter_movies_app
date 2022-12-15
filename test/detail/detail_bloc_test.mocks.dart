// Mocks generated by Mockito 5.3.2 from annotations
// in flutter_movies_app/test/detail/detail_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_movies_app/core/models/movie_model.dart' as _i2;
import 'package:flutter_movies_app/core/resources/repository/movies/fake/fake_movies_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeMovieModel_0 extends _i1.SmartFake implements _i2.MovieModel {
  _FakeMovieModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FakeMoviesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFakeMoviesRepository extends _i1.Mock
    implements _i3.FakeMoviesRepository {
  MockFakeMoviesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.MovieModel>> fetchMoviesList({required int? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchMoviesList,
          [],
          {#id: id},
        ),
        returnValue: _i4.Future<List<_i2.MovieModel>>.value(<_i2.MovieModel>[]),
      ) as _i4.Future<List<_i2.MovieModel>>);
  @override
  _i4.Future<_i2.MovieModel> fetchMovieDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #fetchMovieDetail,
          [id],
        ),
        returnValue: _i4.Future<_i2.MovieModel>.value(_FakeMovieModel_0(
          this,
          Invocation.method(
            #fetchMovieDetail,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.MovieModel>);
  @override
  List<_i2.MovieModel> filterMoviesList(
    String? keyword,
    List<_i2.MovieModel>? moviesList,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #filterMoviesList,
          [
            keyword,
            moviesList,
          ],
        ),
        returnValue: <_i2.MovieModel>[],
      ) as List<_i2.MovieModel>);
}
