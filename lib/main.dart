import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Terang Bulan 45', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Menu> menuList = [
    Menu(
      namaMenu: 'Terang Bulan Keju Susu',
      harga: 'Rp 25.000',
      deskripsi: 'Terang Bulan original dengan topping keju dan susu',
      rating: 5,
      fotoUrl:
          'https://cdn.idntimes.com/content-images/post/20191119/74531929-162580558189003-156976451209379112-n-fe48d95fde8e699936200bb96c3b9aed.jpg',
    ),
    Menu(
        namaMenu: 'Terang Bulan Cokelat Oreo',
        harga: 'Rp 27.000',
        deskripsi: 'Terang Bulan Original dengan topping cokelat dan oreo',
        rating: 5,
        fotoUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCx37kQW_c8IFuQmOe4afrs2C-QPkj6VO4UDH6KoggJcaRRHt_KKbiaguhz7Eeb_7tzGM&usqp=CAU'),
    Menu(
        namaMenu: 'Terang Bulan Kacang Cokelat Keju',
        harga: 'Rp 27.000',
        deskripsi:
            'Terang Bulan Original dengan topping kacang, cokelat dan keju',
        rating: 5,
        fotoUrl:
            'https://www.jagel.id/api/listimage/v/Terang-Bulan-Keju-Coklat-Kacang-0-664612e4f3ff2ac2.jpg'),
    Menu(
        namaMenu: 'Terang Bulan Pandan Cokelat',
        harga: 'Rp 27.000',
        deskripsi: 'Terang Bulan Pandan dengan topping cokelat',
        rating: 4.5,
        fotoUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCx37kQW_c8IFuQmOe4afrs2C-QPkj6VO4UDH6KoggJcaRRHt_KKbiaguhz7Eeb_7tzGM&usqp=CAU'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
              'Martabak & Terang Bulan',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Poppins', fontSize: 20),
            ),
            centerTitle: true,
            backgroundColor: Colors.lightBlue),
        body: ListView.builder(
          itemCount: menuList.length,
          itemBuilder: (context, index) {
            return _buildMenuItem(menuList[index]);
          },
        ),
      ),
    );
  }

  Widget _buildMenuItem(Menu menu) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(16.0),
      color: Colors.blue[40],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                flex: 1, child: Image.network(menu.fotoUrl, fit: BoxFit.cover)),
            const SizedBox(width: 16.0),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menu.namaMenu,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    menu.harga,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    menu.deskripsi,
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      for (int i = 0; i < menu.rating; i++)
                        Icon(
                          Icons.star,
                          color: Colors.yellow[600],
                          size: 16.0,
                        ),
                      if (menu.rating >
                          menu.rating.floor()) // If rating has a decimal part
                        Icon(
                          Icons.star_half, // Use the half-filled star icon
                          color: Colors.yellow[600],
                          size: 16.0,
                        ),
                    ],
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

class Menu {
  String namaMenu;
  String harga;
  String deskripsi;
  double rating;
  String fotoUrl;

  Menu({
    required this.namaMenu,
    required this.harga,
    required this.deskripsi,
    required this.rating,
    required this.fotoUrl,
  });
}
