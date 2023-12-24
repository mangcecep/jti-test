import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jti_test/constant/service_constants.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List _data = [];
  double _width = 80;
  Color _color = Color(0xFFC1DDED);
  final int _duration = 1;

  late bool _isClose = false;

  @override
  void initState() {
    super.initState();
    getInitHome();
  }

  Future getInitHome() async {
    try {
      var url = Uri.parse(ServiceConstans.home);
      final response = await http.get(url);
      var code = response.statusCode;
      var jsonData = await json.decode(response.body);

      if (code == 200) {
        setState(() {
          _data = jsonData['data']['cur_tipe'];
        });
        print('JSON DATA: $_data');
      }
      // if (code == 401) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     backgroundColor: Colors.red,
      //     content: Text(jsonData['message'].toString()),
      //     action: SnackBarAction(
      //       label: 'Opps!',
      //       onPressed: () {},
      //     ),
      //   ));
      // }
    } catch (e) {
      String message = e.toString();
      // String isConnectionFail =
      //     message.contains('ClientException with SocketException')
      //         ? "No Internet Connection!"
      //         : message;
      print(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
          child: Column(
            children: [
              const Text(
                'Nama Outlet',
                textAlign: TextAlign.left,
                style: TextStyle(color: Color(0xFF2787BD)),
              ),
              if (_data.isNotEmpty)
                for (int index = 0; index < _data.length; index++) ...[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        _data[index]['ct_nama'] == 'IDR'
                            ? Image.asset('images/Icon Rupiah.png')
                            : _data[index]['ct_nama'] == 'EUR'
                                ? Image.asset('images/Icon Euro.png')
                                : _data[index]['ct_nama'] == 'USD'
                                    ? Image.asset('images/Icon Dollar.png')
                                    : Image.asset(
                                        'images/Icon Dollar Singapore.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          _data[index]['ct_nama'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          " -------------------------- ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2787BD),
                          ),
                        ),
                        _data[index]['ct_nama'] == 'IDR'
                            ? const Text(
                                '500.000',
                                style: TextStyle(
                                    color: Color(0xFF2787BD),
                                    fontWeight: FontWeight.bold),
                              )
                            : _data[index]['ct_nama'] == 'EUR'
                                ? const Text(
                                    '20.000',
                                    style: TextStyle(
                                        color: Color(0xFF2787BD),
                                        fontWeight: FontWeight.bold),
                                  )
                                : _data[index]['ct_nama'] == 'USD'
                                    ? const Text(
                                        '0',
                                        style: TextStyle(
                                            color: Color(0xFF2787BD),
                                            fontWeight: FontWeight.bold),
                                      )
                                    : const Text(
                                        '6000',
                                        style: TextStyle(
                                            color: Color(0xFF2787BD),
                                            fontWeight: FontWeight.bold),
                                      ),
                      ],
                    ),
                  )
                ],
            ],
          ),
        ),
        AnimatedPositioned(
          top: 0,
          right: 0,
          width: _width,
          duration: Duration(seconds: _duration),
          child: Container(
            decoration: BoxDecoration(
                color: _color,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _isClose = !_isClose;
                    });
                    if (_isClose) {
                      setState(() {
                        _width = 350;
                      });
                      return;
                    }
                    setState(() {
                      _width = 80;
                    });
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 100.0, horizontal: 8),
                      child: _isClose
                          ? Image.asset(
                              'images/Button Close Slide.png',
                              width: 30,
                            )
                          : Image.asset(
                              'images/Button Open Slide.png',
                              width: 30,
                            ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _width == 350,
                  child: Expanded(
                    flex: 1,
                    child: Container(
                      color: _color,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'images/Button Input Masuk.png',
                                        width: 25,
                                      ),
                                      const Text(
                                        'MASUK',
                                        style: TextStyle(
                                          color: Color(0xFF2787BD),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'images/Button Input Keluar.png',
                                        width: 20,
                                      ),
                                      const Text(
                                        'KELUAR',
                                        style: TextStyle(
                                          color: Color(0xFF2787BD),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'images/Button Input Pindah.png',
                                        width: 25,
                                      ),
                                      const Text(
                                        'PINDAH',
                                        style: TextStyle(
                                          color: Color(0xFF2787BD),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'images/Button Input Mutasi.png',
                                        width: 25,
                                      ),
                                      const Text(
                                        'MUTASI',
                                        style: TextStyle(
                                          color: Color(0xFF2787BD),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'images/Button Input Kurs.png',
                                        width: 25,
                                      ),
                                      const Text(
                                        'KURS',
                                        style: TextStyle(
                                          color: Color(0xFF2787BD),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Card(
                              child: Column(children: [
                                const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Jumlah Barang',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '16',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                if (_data.isNotEmpty)
                                  for (int index = 0;
                                      index < _data.length;
                                      index++) ...[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Total ${_data[index]['ct_nama']}',
                                            style: const TextStyle(
                                              color: Color(0xFF2787BD),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          _data[index]['ct_nama'] == 'IDR'
                                              ? Text(
                                                  '${_data[index]['ct_logo']} 1.000.000.000',
                                                  style: const TextStyle(
                                                    color: Color(0xFF2787BD),
                                                  ),
                                                )
                                              : _data[index]['ct_nama'] == 'EUR'
                                                  ? Text(
                                                      '${_data[index]['ct_logo']} 200',
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xFF2787BD),
                                                      ),
                                                    )
                                                  : _data[index]['ct_nama'] ==
                                                          'USD'
                                                      ? Text(
                                                          '${_data[index]['ct_logo']} 2.000',
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xFF2787BD),
                                                          ),
                                                        )
                                                      : Text(
                                                          '${_data[index]['ct_logo']} 6000',
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xFF2787BD),
                                                          ),
                                                        ),
                                        ],
                                      ),
                                    )
                                  ],
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}