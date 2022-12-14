import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies_app/core/bloc/home/home_bloc.dart';
import 'package:flutter_movies_app/core/resources/repository/genres/fake/fake_genres_repository.dart';
import 'package:flutter_movies_app/view/home/home_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_widget_test.mocks.dart';

@GenerateMocks([HomeBloc, HomeEvent, HomeState, FakeGenresRepository])
void main() {
  late MockHomeBloc mockHomeBloc;
  late MockFakeGenresRepository mockGenresRepository;

  setUp(() {
    mockGenresRepository = MockFakeGenresRepository();
    mockHomeBloc = MockHomeBloc();
  });

  group("Test HomeLoading", () {
    testWidgets("show loading indicator when fetching data",
        (widgetTester) async {
      when(mockHomeBloc.state).thenReturn(HomeLoading());

      final homeLoadingIndicator =
          find.byKey(const ValueKey("homeLoadingIndicator"));

      await widgetTester.pumpWidget(
        BlocProvider<HomeBloc>(
          create: (context) =>
              HomeBloc(mockGenresRepository)..add(FetchGenresEvent()),
          child: const MaterialApp(
            title: "Movies App",
            home: HomeView(),
          ),
        ),
      );

      expect(homeLoadingIndicator, findsOneWidget);
    });
  });

  group("Test TryAgainWidget", () {
    testWidgets("show try again button when fail to fetch data",
        (widgetTester) async {
      when(mockHomeBloc.state)
          .thenReturn(const HomeError("Exception: Failed to fetch data"));

      final tryAgainButton = find.byKey(const ValueKey("tryAgainButton"));
      final tryAgainText = find.byKey(const ValueKey("tryAgainText"));

      await widgetTester.pumpWidget(
        BlocProvider<HomeBloc>(
          create: (context) =>
              HomeBloc(mockGenresRepository)..add(FetchGenresEvent()),
          child: const MaterialApp(
            title: "Movies App",
            home: HomeView(),
          ),
        ),
      );

      await widgetTester.pumpAndSettle(const Duration(seconds: 1));

      expect(tryAgainButton, findsOneWidget);
      expect(tryAgainText, findsOneWidget);
    });
  });
}
