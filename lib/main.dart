import 'package:flutter/material.dart';
import 'package:jti_test/widgets/home_screen.dart';
import 'package:jti_test/widgets/top_bar_widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF2787BD),
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
            TopBarWidgets(
              indexMenu: _index,
              listOfMenu: _listOfMenu,
              onTapMenu: onTapMenu,
            ),
            if (_index == 0) const HomeScreen(),
            if (_index == 1)
              const Center(
                child: Text(
                  'Screen Transaksi',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            if (_index == 2)
              const Center(
                child: Text(
                  'Screen Laporan',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            if (_index == 3)
              const Center(
                child: Text(
                  'Screen Tools',
                  style: TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
