import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopBarWidgets extends StatelessWidget {
  late int indexMenu;
  final List listOfMenu;
  final Function onTapMenu;

  TopBarWidgets({
    super.key,
    required this.indexMenu,
    required this.listOfMenu,
    required this.onTapMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int index = 0; index < listOfMenu.length; index++) ...[
              Row(
                children: [
                  InkWell(
                    onTap: () => onTapMenu(index),
                    child: Column(
                      children: [
                        Image.asset(
                          index == indexMenu
                              ? listOfMenu[index]['imgUrlActive']
                              : listOfMenu[index]['imgUrlInActive'],
                          width: 50,
                        ),
                        Text(
                          listOfMenu[index]['title'],
                          style: TextStyle(
                            color: index == indexMenu
                                ? const Color(0xFF2787BD)
                                : const Color(0xFF2787BD).withOpacity(0.3),
                            fontWeight: FontWeight.bold,
                          ),
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
    );
  }
}
