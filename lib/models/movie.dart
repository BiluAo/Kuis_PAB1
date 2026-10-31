import 'package:flutter/material.dart';

class Review {
  final String author;
  final int rating; // 1-5
  final String comment;

  const Review({
    required this.author,
    required this.rating,
    this.comment = '',
  });
}

class Movie {
  final String title;
  final String genre;
  final String synopsis;
  final int year;
  final int duration; // menit
  final Color color; // warna cadangan jika poster tidak ada
  final IconData icon;
  final String? posterAsset; // contoh: assets/images/poster.jpg
  final List<Review> reviews;

  Movie({
    required this.title,
    required this.genre,
    required this.synopsis,
    required this.year,
    required this.duration,
    required this.color,
    required this.icon,
    this.posterAsset,
    List<Review>? reviews,
  }) : reviews = reviews ?? [];

  double get averageRating {
    if (reviews.isEmpty) return 0;
    final total = reviews.fold<int>(0, (sum, r) => sum + r.rating);
    return total / reviews.length;
  }

  // Film direkomendasikan jika rata-rata rating >= 4.0
  bool get isRecommended => reviews.isNotEmpty && averageRating >= 4.0;
}
