import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2787BD)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _index = 0;
  final List _listOfMenu = [
    {
      'imgUrlActive': 'images/Button Home Aktif.png',
      'imgUrlInActive': 'images/Button Home Tidak Aktif.png',
      'title': 'HOME',
    },
    {
      'imgUrlActive': 'images/Button Transaksi Aktif.png',
      'imgUrlInActive': 'images/Button Transaksi Tidak Aktif.png',
      'title': 'TRANSAKSI',
    },
    {
      'imgUrlActive': 'images/Button Laporan Aktif.png',
      'imgUrlInActive': 'images/Button Laporan Tidak Aktif.png',
      'title': 'LAPORAN',
    },
    {
      'imgUrlActive': 'images/Button Tools Aktif.png',
      'imgUrlInActive': 'images/Button Tools Tidak Aktif.png',
      'title': 'TOOLS'
    },
  ];

  void onTapMenu(int selected) {
    setState(() {
      _index = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'APP KEUANGAN',
          style: TextStyle(
            color: Color(0xFF2787BD),
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 0,
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: Image.asset(
              'images/Button Notifikasi.png',
              width: 40,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int index = 0; index < _listOfMenu.length; index++) ...[
                    Row(
                      children: [
                        InkWell(
                          onTap: () => onTapMenu(index),
                          child: Column(
                            children: [
                              Image.asset(
                                _index == index
                                    ? _listOfMenu[index]['imgUrlActive']
                                    : _listOfMenu[index]['imgUrlInActive'],
                                width: 50,
                              ),
                              Text(
                                _listOfMenu[index]['title'],
                                style: TextStyle(
                                    color: _index == index
                                        ? const Color(0xFF2787BD)
                                        : const Color(0xFF2787BD)
                                            .withOpacity(0.3)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
