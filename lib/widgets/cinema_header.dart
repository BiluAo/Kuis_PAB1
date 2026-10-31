import 'package:flutter/material.dart';

class CinemaHeader extends StatelessWidget {
  final int movieCount;
  final int reviewCount;

  const CinemaHeader({
    super.key,
    required this.movieCount,
    required this.reviewCount,
  });

  Widget _badge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.white),
          const SizedBox(width: 4),
          Text(text,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFB71C1C), Color(0xFF4A148C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.movie_filter, size: 36, color: Colors.white),
              SizedBox(width: 10),
              Text('Cinema Review',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
          const SizedBox(height: 6),
          Text('Baca review & temukan film rekomendasi',
              style: TextStyle(color: Colors.white.withAlpha(210))),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: [
              _badge(Icons.theaters, '$movieCount film'),
              _badge(Icons.rate_review, '$reviewCount review'),
            ],
          ),
        ],
      ),
    );
  }
}