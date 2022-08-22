import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {


  final Color mycolor;
  final Widget? cardChild;
  final void Function()? onPress;

  const ReusableCard(
      {Key? key,
      required this.mycolor, this.cardChild, this.onPress})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: mycolor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
