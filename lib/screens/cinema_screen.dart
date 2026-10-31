// ANGGOTA 7 - Widget 10: CinemaScreen (screen utama, menggabungkan semua widget)
import 'package:flutter/material.dart';
import '../data/movies.dart';
import '../models/movie.dart';
import '../widgets/cinema_header.dart';
import '../widgets/genre_filter.dart';
import '../widgets/movie_card.dart';
import '../widgets/movie_detail_sheet.dart';
import '../widgets/recommendation_carousel.dart';

class CinemaScreen extends StatefulWidget {
  const CinemaScreen({super.key});

  @override
  State<CinemaScreen> createState() => _CinemaScreenState();
}

class _CinemaScreenState extends State<CinemaScreen> {
  static const _all = 'Semua';

  final List<Movie> _movies = buildMovies();
  String _genre = _all;

  List<String> get _genres =>
      [_all, ..._movies.map((m) => m.genre).toSet()];

  int get _reviewCount =>
      _movies.fold<int>(0, (sum, m) => sum + m.reviews.length);

  // Rekomendasi: film dengan rata-rata rating >= 4.0, urut dari tertinggi
  List<Movie> get _recommended {
    final list = _movies.where((m) => m.isRecommended).toList()
      ..sort((a, b) => b.averageRating.compareTo(a.averageRating));
    return list.take(5).toList();
  }

  List<Movie> get _filtered => _genre == _all
      ? _movies
      : _movies.where((m) => m.genre == _genre).toList();

  void _openDetail(Movie movie) {
    // setState dipanggil saat review baru ditambah agar rating & rekomendasi ter-update
    MovieDetailSheet.show(context, movie, () => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final movies = _filtered;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CinemaHeader(
              movieCount: _movies.length,
              reviewCount: _reviewCount,
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 20),
                children: [
                  RecommendationCarousel(
                    movies: _recommended,
                    onTap: _openDetail,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 18, 20, 10),
                    child: Text('Semua Film',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  GenreFilter(
                    genres: _genres,
                    selected: _genre,
                    onChanged: (g) => setState(() => _genre = g),
                  ),
                  const SizedBox(height: 14),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        for (final m in movies)
                          MovieCard(movie: m, onTap: () => _openDetail(m)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}