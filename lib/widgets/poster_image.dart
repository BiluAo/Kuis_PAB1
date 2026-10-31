import 'package:flutter/material.dart';
import '../models/movie.dart';

class PosterImage extends StatelessWidget {
  final Movie movie;
  final double width;
  final double height;
  final double radius;

  const PosterImage({
    super.key,
    required this.movie,
    this.width = 90,
    this.height = 130,
    this.radius = 12,
  });

  @override
  Widget build(BuildContext context) {
    // Jika gambar tidak ada / gagal dimuat, tampil gradasi warna + ikon.
    final fallback = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [movie.color, movie.color.withAlpha(130)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Icon(movie.icon, size: width * 0.45, color: Colors.white),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        width: width,
        height: height,
        child: movie.posterAsset == null
            ? fallback
            : Image.asset(
                movie.posterAsset!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => fallback,
              ),
      ),
    );
  }
}