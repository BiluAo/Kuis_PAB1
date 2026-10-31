import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'poster_image.dart';
import 'rating_stars.dart';
import 'review_tile.dart';

class MovieDetailSheet extends StatefulWidget {
  final Movie movie;
  final VoidCallback onChanged; // dipanggil setelah review baru ditambahkan

  const MovieDetailSheet({
    super.key,
    required this.movie,
    required this.onChanged,
  });

  static Future<void> show(
      BuildContext context, Movie movie, VoidCallback onChanged) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: MovieDetailSheet(movie: movie, onChanged: onChanged),
      ),
    );
  }

  @override
  State<MovieDetailSheet> createState() => _MovieDetailSheetState();
}

class _MovieDetailSheetState extends State<MovieDetailSheet> {
  final _commentController = TextEditingController();
  final _nameController = TextEditingController();
  int _rating = 0;

  @override
  void dispose() {
    _commentController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_rating == 0) return;
    final name = _nameController.text.trim();
    setState(() {
      widget.movie.reviews.add(Review(
        author: name.isEmpty ? 'Kamu' : name,
        rating: _rating,
        comment: _commentController.text.trim(),
      ));
      _rating = 0;
      _commentController.clear();
    });
    widget.onChanged();
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;
    final avg = movie.averageRating;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PosterImage(movie: movie, width: 100, height: 145),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('${movie.genre} • ${movie.year} • ${movie.duration} menit',
                        style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        RatingStars(rating: avg, size: 22),
                        const SizedBox(width: 8),
                        Text(avg == 0 ? '-' : avg.toStringAsFixed(1),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Text('${movie.reviews.length} review',
                        style: const TextStyle(color: Colors.grey)),
                    if (movie.isRecommended)
                      const Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text('🔥 Direkomendasikan'),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(movie.synopsis),
          const Divider(height: 28),
          Text('Review (${movie.reviews.length})',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          if (movie.reviews.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text('Belum ada review. Jadilah yang pertama!'),
            ),
          // review terbaru tampil paling atas
          for (final r in movie.reviews.reversed) ReviewTile(review: r),
          const Divider(height: 28),
          const Text('Tulis review kamu',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          RatingStars(
            rating: _rating.toDouble(),
            size: 36,
            onChanged: (v) => setState(() => _rating = v),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Nama (opsional)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _commentController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Komentar (opsional)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _rating == 0 ? null : _submit,
              icon: const Icon(Icons.send),
              label: Text(_rating == 0 ? 'Pilih bintang dulu' : 'Kirim Review'),
            ),
          ),
        ],
      ),
    );
  }
}