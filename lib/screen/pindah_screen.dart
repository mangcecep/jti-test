import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class PindahScreen extends StatefulWidget {
  final List outletSub;
  final List currency;

  const PindahScreen({
    super.key,
    required this.outletSub,
    required this.currency,
  });

  @override
  State<PindahScreen> createState() => _PindahScreenState();
}

class _PindahScreenState extends State<PindahScreen> {
  String dropdownValue = '';
  String _selected = '';
  List item = <String>[];
  List selectCurrencyItem = [];

  final TextEditingController _tanggal = TextEditingController();
  final TextEditingController _input = TextEditingController();
  String date = DateFormat('dd/MM/yyyy').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _input.text = '0';
    _tanggal.text = date;
    for (int idx = 0; idx < widget.outletSub.length; idx++) {
      item.add(widget.outletSub[idx]['outlet_name'].toString());
    }

    for (int idx = 0; idx < widget.currency.length; idx++) {
      selectCurrencyItem.add(
        {
          'id': widget.currency[idx]['ct_id'].toString(),
          'image': widget.currency[idx]['ct_nama'] == 'IDR'
              ? 'images/Icon Rupiah.png'
              : widget.currency[idx]['ct_nama'] == 'EUR'
                  ? 'images/Icon Euro.png'
                  : widget.currency[idx]['ct_nama'] == 'USD'
                      ? 'images/Icon Dollar.png'
                      : 'images/Icon Dollar Singapore.png',
          'nama': widget.currency[idx]['ct_nama']
        },
      );
    }
    setState(() {
      dropdownValue = item.first;
      _selected = selectCurrencyItem[0]['nama'].toString();
    });
  }

  @override
  void dispose() {
    _tanggal.dispose();
    _input.dispose();
    super.dispose();
  }

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    if (picked != null) {
      setState(() {
        _tanggal.text = DateFormat('dd/MM/yyyy').format(picked);
        date = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Pindah',
          style: TextStyle(
            color: Color(0xFF2787BD),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            item.isNotEmpty
                ? Container(
                    color: Colors.white,
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Text(
                                  'Dari',
                                  style: TextStyle(
                                    color: Color(0xFF2787BD),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(blurRadius: 3)
                                      ],
                                      color: const Color(0xFFC1DDED),
                                      border: Border.all(
                                          color: const Color(0xFFC1DDED)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 0),
                                    child: DropdownButton<String>(
                                      dropdownColor: const Color(0xFFC1DDED),
                                      value: dropdownValue,
                                      // style: const TextStyle(color: Colors.deepPurple),
                                      onChanged: (value) {
                                        setState(() {
                                          dropdownValue = value!;
                                        });
                                      },
                                      items: item.map((value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                              color: Color(0xFF2787BD),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Text(
                                  'Ke',
                                  style: TextStyle(
                                    color: Color(0xFF2787BD),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(blurRadius: 3)
                                      ],
                                      color: const Color(0xFFC1DDED),
                                      border: Border.all(
                                          color: const Color(0xFFC1DDED)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 0),
                                    child: DropdownButton<String>(
                                      dropdownColor: const Color(0xFFC1DDED),
                                      value: dropdownValue,
                                      // style: const TextStyle(color: Colors.deepPurple),
                                      onChanged: (value) {
                                        setState(() {
                                          dropdownValue = value!;
                                        });
                                      },
                                      items: item.map((value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                              color: Color(0xFF2787BD),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const Text('LOADING...'),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Start Date',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textAlign: TextAlign.center,
                readOnly: true,
                controller: _tanggal,
                enableSuggestions: false,
                // obscureText: isObscureText,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // prefixIcon: icons,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Tanggal',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onTap: () async {
                  _selectDate();
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Input',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        readOnly: false,
                        textAlign: TextAlign.right,
                        controller: _input,
                        enableSuggestions: false,
                        // obscureText: isObscureText,
                        autocorrect: false,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          // prefixIcon: icons,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Tanggal',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                          // border: OutlineInputBorder(
                          //     borderSide:
                          //         const BorderSide(color: Colors.blueAccent),
                          //     borderRadius: BorderRadius.circular(20.0)),
                        ),
                      ),
                    ),
                    ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        value: _selected,
                        hint: const Text('Select'),
                        onChanged: (newValue) {
                          setState(() {
                            _selected = newValue!;
                          });
                        },
                        items: selectCurrencyItem.map((item) {
                          return DropdownMenuItem<String>(
                              value: item['nama'],
                              child: Row(
                                children: [
                                  Image.asset(
                                    item['image'],
                                    width: 25,
                                  ),
                                  Text(' ${item['nama']}'),
                                ],
                              ));
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Photo',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  // color: Colors.white,
                  child: Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Image.asset('images/Add Photo.png'))
                    ],
                  ),
                )),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Keterangan',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                readOnly: false,
                // controller: controller,
                enableSuggestions: false,
                // obscureText: isObscureText,
                autocorrect: false,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  // prefixIcon: icons,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          child: const Text('Submit'),
          onPressed: () {},
        ),
      ),
    );
  }
}
