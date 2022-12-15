# Movies App

Movies App is a Flutter app for listing genres/movies and getting movie details.

## Installation

1. Clone the Git repository:

```sh
git clone https://github.com/harundemir918/flutter_movies_app.git
```

2. Get the packages that the app uses:

```sh
flutter pub get
```

3. To use the app, you need an API key from TMDB.
* Go to [TMDB Website](https://www.themoviedb.org/) and create a new account using the link on the top-right.
* After creating account, click API on the left side of the Account page.
* Request a new API key with filling the form.
* Save the key.

4. Open the app folder, go to ```lib/core/config``` , copy ```config_example.dart```, paste in the same folder and rename it as ```config.dart```. It must be like this:

```
lib/
|____core/
     |____config/
          |____config.dart // create this file
          |____config_example.dart
```

5. Paste your API key to ```configApiKey``` in ```config.dart```.
6. Run the app using ```flutter run``` (you can also use the built-in functions of the IDE that you're using (Android Studio - VS Code etc)).

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