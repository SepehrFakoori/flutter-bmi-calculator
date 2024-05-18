import 'package:flutter/material.dart';

class RightShape extends StatelessWidget {
  final double width;

  const RightShape({Key? key, this.width = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 40.0,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
