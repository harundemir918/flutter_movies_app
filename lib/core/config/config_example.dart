const String configApiKey = '';

const String configApiUrl = 'https://api.themoviedb.org/3';
const String configGetGenresUrl =
    '$configApiUrl/genre/movie/list?api_key={{apiKey}}';
const String configGetMoviesUrl =
    '$configApiUrl/discover/movie?api_key={{apiKey}}&with_genres={{id}}';
const String configGetMovieDetailUrl =
    '$configApiUrl/movie/{{id}}?api_key={{apiKey}}';
