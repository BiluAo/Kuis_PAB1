import 'package:flutter/material.dart';

class GenreFilter extends StatelessWidget {
  final List<String> genres; // sudah termasuk "Semua"
  final String selected;
  final ValueChanged<String> onChanged;

  const GenreFilter({
    super.key,
    required this.genres,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          for (final g in genres)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Text(g),
                selected: g == selected,
                onSelected: (_) => onChanged(g),
              ),
            ),
        ],
      ),
    );
  }
}