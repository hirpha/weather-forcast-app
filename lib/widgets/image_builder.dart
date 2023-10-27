import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ImageBuilder extends StatelessWidget {
  final String image;
  const ImageBuilder({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .1, left: 10, right: 10),
        alignment: Alignment.center,
        child: Image.asset(image));
  }
}
