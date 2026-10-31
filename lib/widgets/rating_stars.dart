import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating; // 0-5 (boleh desimal untuk tampilan rata-rata)
  final ValueChanged<int>? onChanged; // null = hanya tampil
  final double size;

  const RatingStars({
    super.key,
    required this.rating,
    this.onChanged,
    this.size = 18,
  });

  IconData _iconFor(int i) {
    if (rating >= i + 1) return Icons.star_rounded;
    if (rating >= i + 0.5) return Icons.star_half_rounded;
    return Icons.star_outline_rounded;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        final star = Icon(
          _iconFor(i),
          size: size,
          color: rating >= i + 0.5 ? Colors.amber : Colors.grey,
        );
        if (onChanged == null) return star;
        return GestureDetector(onTap: () => onChanged!(i + 1), child: star);
      }),
    );
  }
}