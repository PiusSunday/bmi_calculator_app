import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CardChildWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const CardChildWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        const SizedBox(height: 15.0),
        Text(
          text,
          style: kTextStyle,
        ),
      ],
    );
  }
}