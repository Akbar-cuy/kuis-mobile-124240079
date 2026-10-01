import 'package:flutter/material.dart';
import 'package:LatihanKuis/models/data.dart';

class DetailScreen extends StatefulWidget {
  final Menu menu;
  const DetailScreen({super.key, required this.menu});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.menu.name),
        // TAMBAHAN: Tombol Favorit
        actions: [
          IconButton(
            icon: Icon(
              (widget.menu.isFavorite)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: (widget.menu.isFavorite ) ? Colors.red : null,
            ),
            onPressed: () {
              setState(() {
                widget.menu.isFavorite = !(widget.menu.isFavorite);
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // Memastikan seluruh elemen di dalam Column utama rata kiri
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Utama
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.menu.image,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Informasi Nama, Kategori, dan Harga
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.menu.name,
                    style: const TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.menu.category,
                    style: const TextStyle(
                      fontSize: 18, 
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.menu.price,
                    style: const TextStyle(
                      fontSize: 20, 
                      color: Color.fromARGB(255, 14, 161, 46),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Bagian Judul "Deskripsi" dan Isinya
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tulisan "Deskripsi" yang dicetak tebal
                  const Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Isi Deskripsi
                  Text(
                    widget.menu.description,
                    style: const TextStyle(fontSize: 15, height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:LatihanKuis/models/data.dart';
// class DetailScreen extends StatelessWidget {
//   final Menu menu;
//   const DetailScreen({super.key, required this.menu});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(menu.name),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           // Memastikan seluruh elemen di dalam Column utama rata kiri
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Gambar Utama
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8.0),
//                 child: Image.network(
//                   menu.image,
//                   width: double.infinity,
//                   height: 300,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             // Informasi Nama, Kategori, dan Harga
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 14.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     menu.name,
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     menu.category,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     menu.price,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       color: Color.fromARGB(255, 14, 161, 46),
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Bagian Judul "Deskripsi" dan Isinya
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Tulisan "Deskripsi" yang dicetak tebal
//                   const Text(
//                     'Deskripsi',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 6),
//                   // Isi Deskripsi
//                   Text(
//                     menu.description,
//                     style: const TextStyle(fontSize: 15, height: 1.4),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );
//   }
// }