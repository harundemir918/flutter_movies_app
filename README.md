# Movies App

Movies App is a Flutter app for listing genres/movies and getting movie details.

## Used Packages

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) (For State Management)
- [auto_route](https://pub.dev/packages/auto_route) (To Navigate Between Pages)
- [auto_route_generator](https://pub.dev/packages/auto_route_generator) (To Generate Auto Router Boilerplate Code)
- [build_runner](https://pub.dev/packages/build_runner) (To Generate Boilerplate Code)
- [dio](https://pub.dev/packages/dio) (To Fetch Data)
- [cached_network_image](https://pub.dev/packages/cached_network_image) (To Cache Images)
- [equatable](https://pub.dev/packages/equatable) (To Compare States)
- [intl](https://pub.dev/packages/intl) (To Format Date)
- [bloc_test](https://pub.dev/packages/bloc_test) (To Test Blocs)
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) (To Change App Icon)
- [mockito](https://pub.dev/packages/mockito) (To Mock Data For Testing)

## Used APIs

- [TMDB API](https://www.themoviedb.org/) (Getting movie data)

## Pages

- Home Page
    - Get movie genres from API
    - Search in genres list with search bar

- Movies Page
    - Get movies based on genres from API
    - Search in movies list with search bar
    - Navigate to Detail Page using movie id

- Detail Page
    - View movie details using movie id