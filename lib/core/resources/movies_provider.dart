import 'dart:math';

import 'package:flutter/foundation.dart';

import '../models/genre_model.dart';
import '../models/movie_model.dart';

class MoviesProvider {
  Future<List<GenreModel>> fetchGenresList() async {
    List<GenreModel> genresList = [];
    var randomBool = Random().nextBool();
    debugPrint("bool: $randomBool");
    await Future.delayed(const Duration(seconds: 1));
    if (randomBool) {
      genresList = [
        GenreModel(id: 1, name: "Action"),
        GenreModel(id: 2, name: "Adventure"),
        GenreModel(id: 3, name: "Animation"),
        GenreModel(id: 4, name: "Comedy"),
        GenreModel(id: 5, name: "Crime"),
        GenreModel(id: 6, name: "Documentary"),
        GenreModel(id: 7, name: "Drama"),
        GenreModel(id: 8, name: "Family"),
        GenreModel(id: 9, name: "Fantasy"),
        GenreModel(id: 10, name: "History"),
      ];
      return genresList;
    } else {
      throw Exception("Failed to fetch data.");
    }
  }

  Future<List<MovieModel>> fetchMoviesList() async {
    List<MovieModel> moviesList = [];
    var randomBool = Random().nextBool();
    debugPrint("bool: $randomBool");
    await Future.delayed(const Duration(seconds: 1));
    if (randomBool) {
      moviesList = [
        MovieModel(
          adult: false,
          backdropPath: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
          belongsToCollection: null,
          budget: 200000000,
          genres: [
            GenreModel(id: 28, name: "Action"),
            GenreModel(id: 14, name: "Fantasy"),
            GenreModel(id: 878, name: "Science Fiction"),
          ],
          homepage: "https://www.dc.com/BlackAdam",
          id: 436270,
          imdbId: "tt6443346",
          originalLanguage: "en",
          originalTitle: "Black Adam",
          overview:
              "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
          popularity: 6580.238,
          posterPath: "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
          productionCompanies: [
            ProductionCompanies(
              id: 12,
              logoPath: "/iaYpEp3LQmb8AfAtmTvpqd4149c.png",
              name: "New Line Cinema",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 34081,
              logoPath: null,
              name: "Flynn Picture Company",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 73669,
              logoPath: "/7tmSGstK3KwgcDIuBYLTAayjit9.png",
              name: "Seven Bucks Productions",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 128064,
              logoPath: "/13F3Jf7EFAcREU0xzZqJnVnyGXu.png",
              name: "DC Films",
              originCountry: "US",
            ),
          ],
          productionCountries: [
            ProductionCountries(
              iso31661: "US",
              name: "United States of America",
            ),
          ],
          releaseDate: "2022-10-19",
          revenue: 384571691,
          runtime: 125,
          spokenLanguages: [
            SpokenLanguages(
              englishName: "English",
              iso6391: "en",
              name: "English",
            ),
          ],
          status: "Released",
          tagline: "The world needed a hero. It got Black Adam.",
          title: "Black Adam",
          video: false,
          voteAverage: 7.308,
          voteCount: 2725,
        ),
        MovieModel(
          adult: false,
          backdropPath: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
          belongsToCollection: null,
          budget: 200000000,
          genres: [
            GenreModel(id: 28, name: "Action"),
            GenreModel(id: 14, name: "Fantasy"),
            GenreModel(id: 878, name: "Science Fiction"),
          ],
          homepage: "https://www.dc.com/BlackAdam",
          id: 436270,
          imdbId: "tt6443346",
          originalLanguage: "en",
          originalTitle: "Green Adam",
          overview:
              "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
          popularity: 6580.238,
          posterPath: "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
          productionCompanies: [
            ProductionCompanies(
              id: 12,
              logoPath: "/iaYpEp3LQmb8AfAtmTvpqd4149c.png",
              name: "New Line Cinema",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 34081,
              logoPath: null,
              name: "Flynn Picture Company",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 73669,
              logoPath: "/7tmSGstK3KwgcDIuBYLTAayjit9.png",
              name: "Seven Bucks Productions",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 128064,
              logoPath: "/13F3Jf7EFAcREU0xzZqJnVnyGXu.png",
              name: "DC Films",
              originCountry: "US",
            ),
          ],
          productionCountries: [
            ProductionCountries(
              iso31661: "US",
              name: "United States of America",
            ),
          ],
          releaseDate: "2022-10-19",
          revenue: 384571691,
          runtime: 125,
          spokenLanguages: [
            SpokenLanguages(
              englishName: "English",
              iso6391: "en",
              name: "English",
            ),
          ],
          status: "Released",
          tagline: "The world needed a hero. It got Black Adam.",
          title: "Green Adam",
          video: false,
          voteAverage: 7.308,
          voteCount: 2725,
        ),
        MovieModel(
          adult: false,
          backdropPath: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
          belongsToCollection: null,
          budget: 200000000,
          genres: [
            GenreModel(id: 28, name: "Action"),
            GenreModel(id: 14, name: "Fantasy"),
            GenreModel(id: 878, name: "Science Fiction"),
          ],
          homepage: "https://www.dc.com/BlackAdam",
          id: 436270,
          imdbId: "tt6443346",
          originalLanguage: "en",
          originalTitle: "Grey Adam",
          overview:
              "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
          popularity: 6580.238,
          posterPath: "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
          productionCompanies: [
            ProductionCompanies(
              id: 12,
              logoPath: "/iaYpEp3LQmb8AfAtmTvpqd4149c.png",
              name: "New Line Cinema",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 34081,
              logoPath: null,
              name: "Flynn Picture Company",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 73669,
              logoPath: "/7tmSGstK3KwgcDIuBYLTAayjit9.png",
              name: "Seven Bucks Productions",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 128064,
              logoPath: "/13F3Jf7EFAcREU0xzZqJnVnyGXu.png",
              name: "DC Films",
              originCountry: "US",
            ),
          ],
          productionCountries: [
            ProductionCountries(
              iso31661: "US",
              name: "United States of America",
            ),
          ],
          releaseDate: "2022-10-19",
          revenue: 384571691,
          runtime: 125,
          spokenLanguages: [
            SpokenLanguages(
              englishName: "English",
              iso6391: "en",
              name: "English",
            ),
          ],
          status: "Released",
          tagline: "The world needed a hero. It got Black Adam.",
          title: "Grey Adam",
          video: false,
          voteAverage: 7.308,
          voteCount: 2725,
        ),
        MovieModel(
          adult: false,
          backdropPath: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
          belongsToCollection: null,
          budget: 200000000,
          genres: [
            GenreModel(id: 28, name: "Action"),
            GenreModel(id: 14, name: "Fantasy"),
            GenreModel(id: 878, name: "Science Fiction"),
          ],
          homepage: "https://www.dc.com/BlackAdam",
          id: 436270,
          imdbId: "tt6443346",
          originalLanguage: "en",
          originalTitle: "Red Adam",
          overview:
              "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
          popularity: 6580.238,
          posterPath: "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
          productionCompanies: [
            ProductionCompanies(
              id: 12,
              logoPath: "/iaYpEp3LQmb8AfAtmTvpqd4149c.png",
              name: "New Line Cinema",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 34081,
              logoPath: null,
              name: "Flynn Picture Company",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 73669,
              logoPath: "/7tmSGstK3KwgcDIuBYLTAayjit9.png",
              name: "Seven Bucks Productions",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 128064,
              logoPath: "/13F3Jf7EFAcREU0xzZqJnVnyGXu.png",
              name: "DC Films",
              originCountry: "US",
            ),
          ],
          productionCountries: [
            ProductionCountries(
              iso31661: "US",
              name: "United States of America",
            ),
          ],
          releaseDate: "2022-10-19",
          revenue: 384571691,
          runtime: 125,
          spokenLanguages: [
            SpokenLanguages(
              englishName: "English",
              iso6391: "en",
              name: "English",
            ),
          ],
          status: "Released",
          tagline: "The world needed a hero. It got Black Adam.",
          title: "Red Adam",
          video: false,
          voteAverage: 7.308,
          voteCount: 2725,
        ),
        MovieModel(
          adult: false,
          backdropPath: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
          belongsToCollection: null,
          budget: 200000000,
          genres: [
            GenreModel(id: 28, name: "Action"),
            GenreModel(id: 14, name: "Fantasy"),
            GenreModel(id: 878, name: "Science Fiction"),
          ],
          homepage: "https://www.dc.com/BlackAdam",
          id: 436270,
          imdbId: "tt6443346",
          originalLanguage: "en",
          originalTitle: "Rose Adam",
          overview:
              "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
          popularity: 6580.238,
          posterPath: "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
          productionCompanies: [
            ProductionCompanies(
              id: 12,
              logoPath: "/iaYpEp3LQmb8AfAtmTvpqd4149c.png",
              name: "New Line Cinema",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 34081,
              logoPath: null,
              name: "Flynn Picture Company",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 73669,
              logoPath: "/7tmSGstK3KwgcDIuBYLTAayjit9.png",
              name: "Seven Bucks Productions",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 128064,
              logoPath: "/13F3Jf7EFAcREU0xzZqJnVnyGXu.png",
              name: "DC Films",
              originCountry: "US",
            ),
          ],
          productionCountries: [
            ProductionCountries(
              iso31661: "US",
              name: "United States of America",
            ),
          ],
          releaseDate: "2022-10-19",
          revenue: 384571691,
          runtime: 125,
          spokenLanguages: [
            SpokenLanguages(
              englishName: "English",
              iso6391: "en",
              name: "English",
            ),
          ],
          status: "Released",
          tagline: "The world needed a hero. It got Black Adam.",
          title: "Rose Adam",
          video: false,
          voteAverage: 7.308,
          voteCount: 2725,
        ),
        MovieModel(
          adult: false,
          backdropPath: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
          belongsToCollection: null,
          budget: 200000000,
          genres: [
            GenreModel(id: 28, name: "Action"),
            GenreModel(id: 14, name: "Fantasy"),
            GenreModel(id: 878, name: "Science Fiction"),
          ],
          homepage: "https://www.dc.com/BlackAdam",
          id: 436270,
          imdbId: "tt6443346",
          originalLanguage: "en",
          originalTitle: "Blue Adam",
          overview:
              "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
          popularity: 6580.238,
          posterPath: "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
          productionCompanies: [
            ProductionCompanies(
              id: 12,
              logoPath: "/iaYpEp3LQmb8AfAtmTvpqd4149c.png",
              name: "New Line Cinema",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 34081,
              logoPath: null,
              name: "Flynn Picture Company",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 73669,
              logoPath: "/7tmSGstK3KwgcDIuBYLTAayjit9.png",
              name: "Seven Bucks Productions",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 128064,
              logoPath: "/13F3Jf7EFAcREU0xzZqJnVnyGXu.png",
              name: "DC Films",
              originCountry: "US",
            ),
          ],
          productionCountries: [
            ProductionCountries(
              iso31661: "US",
              name: "United States of America",
            ),
          ],
          releaseDate: "2022-10-19",
          revenue: 384571691,
          runtime: 125,
          spokenLanguages: [
            SpokenLanguages(
              englishName: "English",
              iso6391: "en",
              name: "English",
            ),
          ],
          status: "Released",
          tagline: "The world needed a hero. It got Black Adam.",
          title: "Blue Adam",
          video: false,
          voteAverage: 7.308,
          voteCount: 2725,
        ),
        MovieModel(
          adult: false,
          backdropPath: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
          belongsToCollection: null,
          budget: 200000000,
          genres: [
            GenreModel(id: 28, name: "Action"),
            GenreModel(id: 14, name: "Fantasy"),
            GenreModel(id: 878, name: "Science Fiction"),
          ],
          homepage: "https://www.dc.com/BlackAdam",
          id: 436270,
          imdbId: "tt6443346",
          originalLanguage: "en",
          originalTitle: "Pink Adam",
          overview:
              "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
          popularity: 6580.238,
          posterPath: "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
          productionCompanies: [
            ProductionCompanies(
              id: 12,
              logoPath: "/iaYpEp3LQmb8AfAtmTvpqd4149c.png",
              name: "New Line Cinema",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 34081,
              logoPath: null,
              name: "Flynn Picture Company",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 73669,
              logoPath: "/7tmSGstK3KwgcDIuBYLTAayjit9.png",
              name: "Seven Bucks Productions",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 128064,
              logoPath: "/13F3Jf7EFAcREU0xzZqJnVnyGXu.png",
              name: "DC Films",
              originCountry: "US",
            ),
          ],
          productionCountries: [
            ProductionCountries(
              iso31661: "US",
              name: "United States of America",
            ),
          ],
          releaseDate: "2022-10-19",
          revenue: 384571691,
          runtime: 125,
          spokenLanguages: [
            SpokenLanguages(
              englishName: "English",
              iso6391: "en",
              name: "English",
            ),
          ],
          status: "Released",
          tagline: "The world needed a hero. It got Black Adam.",
          title: "Pink Adam",
          video: false,
          voteAverage: 7.308,
          voteCount: 2725,
        ),
        MovieModel(
          adult: false,
          backdropPath: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
          belongsToCollection: null,
          budget: 200000000,
          genres: [
            GenreModel(id: 28, name: "Action"),
            GenreModel(id: 14, name: "Fantasy"),
            GenreModel(id: 878, name: "Science Fiction"),
          ],
          homepage: "https://www.dc.com/BlackAdam",
          id: 436270,
          imdbId: "tt6443346",
          originalLanguage: "en",
          originalTitle: "Purple Adam",
          overview:
              "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
          popularity: 6580.238,
          posterPath: "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
          productionCompanies: [
            ProductionCompanies(
              id: 12,
              logoPath: "/iaYpEp3LQmb8AfAtmTvpqd4149c.png",
              name: "New Line Cinema",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 34081,
              logoPath: null,
              name: "Flynn Picture Company",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 73669,
              logoPath: "/7tmSGstK3KwgcDIuBYLTAayjit9.png",
              name: "Seven Bucks Productions",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 128064,
              logoPath: "/13F3Jf7EFAcREU0xzZqJnVnyGXu.png",
              name: "DC Films",
              originCountry: "US",
            ),
          ],
          productionCountries: [
            ProductionCountries(
              iso31661: "US",
              name: "United States of America",
            ),
          ],
          releaseDate: "2022-10-19",
          revenue: 384571691,
          runtime: 125,
          spokenLanguages: [
            SpokenLanguages(
              englishName: "English",
              iso6391: "en",
              name: "English",
            ),
          ],
          status: "Released",
          tagline: "The world needed a hero. It got Black Adam.",
          title: "Purple Adam",
          video: false,
          voteAverage: 7.308,
          voteCount: 2725,
        ),
        MovieModel(
          adult: false,
          backdropPath: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
          belongsToCollection: null,
          budget: 200000000,
          genres: [
            GenreModel(id: 28, name: "Action"),
            GenreModel(id: 14, name: "Fantasy"),
            GenreModel(id: 878, name: "Science Fiction"),
          ],
          homepage: "https://www.dc.com/BlackAdam",
          id: 436270,
          imdbId: "tt6443346",
          originalLanguage: "en",
          originalTitle: "Cyan Adam",
          overview:
              "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
          popularity: 6580.238,
          posterPath: "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
          productionCompanies: [
            ProductionCompanies(
              id: 12,
              logoPath: "/iaYpEp3LQmb8AfAtmTvpqd4149c.png",
              name: "New Line Cinema",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 34081,
              logoPath: null,
              name: "Flynn Picture Company",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 73669,
              logoPath: "/7tmSGstK3KwgcDIuBYLTAayjit9.png",
              name: "Seven Bucks Productions",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 128064,
              logoPath: "/13F3Jf7EFAcREU0xzZqJnVnyGXu.png",
              name: "DC Films",
              originCountry: "US",
            ),
          ],
          productionCountries: [
            ProductionCountries(
              iso31661: "US",
              name: "United States of America",
            ),
          ],
          releaseDate: "2022-10-19",
          revenue: 384571691,
          runtime: 125,
          spokenLanguages: [
            SpokenLanguages(
              englishName: "English",
              iso6391: "en",
              name: "English",
            ),
          ],
          status: "Released",
          tagline: "The world needed a hero. It got Black Adam.",
          title: "Cyan Adam",
          video: false,
          voteAverage: 7.308,
          voteCount: 2725,
        ),
        MovieModel(
          adult: false,
          backdropPath: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
          belongsToCollection: null,
          budget: 200000000,
          genres: [
            GenreModel(id: 28, name: "Action"),
            GenreModel(id: 14, name: "Fantasy"),
            GenreModel(id: 878, name: "Science Fiction"),
          ],
          homepage: "https://www.dc.com/BlackAdam",
          id: 436270,
          imdbId: "tt6443346",
          originalLanguage: "en",
          originalTitle: "Crimson Adam",
          overview:
              "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
          popularity: 6580.238,
          posterPath: "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
          productionCompanies: [
            ProductionCompanies(
              id: 12,
              logoPath: "/iaYpEp3LQmb8AfAtmTvpqd4149c.png",
              name: "New Line Cinema",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 34081,
              logoPath: null,
              name: "Flynn Picture Company",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 73669,
              logoPath: "/7tmSGstK3KwgcDIuBYLTAayjit9.png",
              name: "Seven Bucks Productions",
              originCountry: "US",
            ),
            ProductionCompanies(
              id: 128064,
              logoPath: "/13F3Jf7EFAcREU0xzZqJnVnyGXu.png",
              name: "DC Films",
              originCountry: "US",
            ),
          ],
          productionCountries: [
            ProductionCountries(
              iso31661: "US",
              name: "United States of America",
            ),
          ],
          releaseDate: "2022-10-19",
          revenue: 384571691,
          runtime: 125,
          spokenLanguages: [
            SpokenLanguages(
              englishName: "English",
              iso6391: "en",
              name: "English",
            ),
          ],
          status: "Released",
          tagline: "The world needed a hero. It got Black Adam.",
          title: "Crimson Adam",
          video: false,
          voteAverage: 7.308,
          voteCount: 2725,
        ),
      ];
      return moviesList;
    } else {
      throw Exception("Failed to fetch data.");
    }
  }

  Future<MovieModel> fetchMovieDetail(int id) async {
    MovieModel movie = MovieModel();
    var randomBool = Random().nextBool();
    debugPrint("bool: $randomBool");
    await Future.delayed(const Duration(seconds: 1));
    if (randomBool) {
      movie = MovieModel(
        adult: false,
        backdropPath: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
        belongsToCollection: null,
        budget: 200000000,
        genres: [
          GenreModel(id: 28, name: "Action"),
          GenreModel(id: 14, name: "Fantasy"),
          GenreModel(id: 878, name: "Science Fiction"),
        ],
        homepage: "https://www.dc.com/BlackAdam",
        id: 436270,
        imdbId: "tt6443346",
        originalLanguage: "en",
        originalTitle: "White Adam",
        overview:
            "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
        popularity: 6580.238,
        posterPath: "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
        productionCompanies: [
          ProductionCompanies(
            id: 12,
            logoPath: "/iaYpEp3LQmb8AfAtmTvpqd4149c.png",
            name: "New Line Cinema",
            originCountry: "US",
          ),
          ProductionCompanies(
            id: 34081,
            logoPath: null,
            name: "Flynn Picture Company",
            originCountry: "US",
          ),
          ProductionCompanies(
            id: 73669,
            logoPath: "/7tmSGstK3KwgcDIuBYLTAayjit9.png",
            name: "Seven Bucks Productions",
            originCountry: "US",
          ),
          ProductionCompanies(
            id: 128064,
            logoPath: "/13F3Jf7EFAcREU0xzZqJnVnyGXu.png",
            name: "DC Films",
            originCountry: "US",
          ),
        ],
        productionCountries: [
          ProductionCountries(
            iso31661: "US",
            name: "United States of America",
          ),
        ],
        releaseDate: "2022-10-19",
        revenue: 384571691,
        runtime: 125,
        spokenLanguages: [
          SpokenLanguages(
            englishName: "English",
            iso6391: "en",
            name: "English",
          ),
        ],
        status: "Released",
        tagline: "The world needed a hero. It got Black Adam.",
        title: "Black Adam",
        video: false,
        voteAverage: 7.308,
        voteCount: 2725,
      );
      return movie;
    } else {
      throw Exception("Failed to fetch data.");
    }
  }

  List<MovieModel> filterMoviesList(
    String keyword,
    List<MovieModel> moviesList,
  ) {
    debugPrint("moviesLength: ${moviesList.length}");
    if (keyword.isEmpty) {
      return [];
    } else {
      return moviesList
          .where((movie) => movie.title!.toLowerCase().contains(keyword))
          .toList();
    }
  }

  List<GenreModel> filterGenresList(
    String keyword,
    List<GenreModel> genresList,
  ) {
    debugPrint("genresLength: ${genresList.length}");
    if (keyword.isEmpty) {
      return [];
    } else {
      return genresList
          .where((genre) => genre.name!.toLowerCase().contains(keyword))
          .toList();
    }
  }
}
