import 'package:flutter/material.dart';
import '../models/movie.dart';

List<Movie> buildMovies() => [
      Movie(
        title: 'Galaksi Terakhir',
        genre: 'Sci-Fi',
        year: 2025,
        duration: 128,
        synopsis:
            'Sekelompok astronot menjelajah galaksi terjauh untuk mencari rumah baru bagi umat manusia.',
        color: Colors.indigo,
        icon: Icons.rocket_launch,
        posterAsset: 'assets/images/galaksi.jpeg',
        reviews: [
          Review(author: 'Rina', rating: 5, comment: 'Visualnya memukau, ceritanya menyentuh!'),
          Review(author: 'Dimas', rating: 4, comment: 'Seru, ending-nya bikin penasaran.'),
        ],
      ),
      Movie(
        title: 'Misteri Hutan Larangan',
        genre: 'Horor',
        year: 2024,
        duration: 105,
        synopsis:
            'Lima sahabat tersesat di hutan yang konon tak pernah mengizinkan siapa pun pulang.',
        color: Colors.deepOrange,
        icon: Icons.forest,
        posterAsset: 'assets/images/hutan.jpeg',
        reviews: [
          Review(author: 'Andi', rating: 3, comment: 'Seram, tapi alurnya mudah ditebak.'),
          Review(author: 'Sari', rating: 4, comment: 'Atmosfernya dapet banget.'),
        ],
      ),
      Movie(
        title: 'Cinta di Tepi Musi',
        genre: 'Romantis',
        year: 2025,
        duration: 112,
        synopsis:
            'Dua insan dari latar berbeda bertemu di tepi Sungai Musi dan belajar arti bertahan.',
        color: Colors.pink,
        icon: Icons.favorite,
        posterAsset: 'assets/images/musi.jpeg',
        reviews: [
          Review(author: 'Maya', rating: 5, comment: 'Manis dan hangat, bikin baper.'),
          Review(author: 'Fajar', rating: 5, comment: 'Latar Palembang-nya indah.'),
          Review(author: 'Lia', rating: 4),
        ],
      ),
      Movie(
        title: 'Aksi Tengah Kota',
        genre: 'Action',
        year: 2023,
        duration: 120,
        synopsis:
            'Seorang mantan polisi harus menghentikan rencana pencurian besar di jantung ibu kota.',
        color: Colors.teal,
        icon: Icons.local_fire_department,
        posterAsset: 'assets/images/kota.jpeg',
        reviews: [
          Review(author: 'Bayu', rating: 4, comment: 'Adegan kejar-kejarannya keren.'),
          Review(author: 'Tika', rating: 3, comment: 'Seru tapi dialognya biasa saja.'),
        ],
      ),
      Movie(
        title: 'Petualangan Si Kancil',
        genre: 'Animasi',
        year: 2024,
        duration: 95,
        synopsis:
            'Si Kancil yang cerdik menolong teman-teman hutan menghadapi banjir besar.',
        color: Colors.amber.shade800,
        icon: Icons.pets,
        posterAsset: 'assets/images/kancil.jpeg',
        reviews: [
          Review(author: 'Nia', rating: 5, comment: 'Cocok ditonton bareng keluarga!'),
          Review(author: 'Rudi', rating: 4, comment: 'Animasinya lucu dan penuh pesan moral.'),
        ],
      ),
      Movie(
        title: 'Senja yang Hilang',
        genre: 'Drama',
        year: 2022,
        duration: 135,
        synopsis:
            'Kisah seorang ayah yang berjuang menyatukan kembali keluarganya setelah bertahun-tahun terpisah.',
        color: Colors.blueGrey,
        icon: Icons.wb_twilight,
        posterAsset: 'assets/images/senja.jpeg',
        reviews: [
          Review(author: 'Wati', rating: 3, comment: 'Bagus tapi agak lambat.'),
        ],
      ),
    ];
