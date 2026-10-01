import 'package:flutter/material.dart';
import 'package:LatihanKuis/models/data.dart';
import 'package:LatihanKuis/screens/detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter data berdasarkan input pencarian
    final filteredMenus = menus.where((menu) {
      return menu.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Column(
      children: [
        // Fitur Pencarian Tambahan
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Cari Menu',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        // Kode Asli Kamu
        Expanded(
          child: ListView.builder(
            itemCount: filteredMenus.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filteredMenus[index].name),
                subtitle: Text(filteredMenus[index].price),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    filteredMenus[index].image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Menampilkan indikator favorit jika aktif
                    if (filteredMenus[index].isFavorite)
                      const Icon(Icons.favorite, color: Colors.red),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(menu: filteredMenus[index]),
                    ),
                  ).then((value) {
                    // Update tampilan setelah kembali dari detail
                    setState(() {});
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:LatihanKuis/models/data.dart';
// import 'package:LatihanKuis/screens/detail.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: menus.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(menus[index].name),
//             subtitle: Text(menus[index].price),
//             leading: ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image.network(
//                 menus[index].image,
//                 width: 50,
//                 height: 50,
//                 fit: BoxFit.cover,
//               )
//             ),
//             trailing: Icon(Icons.arrow_forward_ios),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DetailScreen(menu: menus[index]),
//                 ),
//               );
//             },
//           );
//         },
//       );
//   }
// }