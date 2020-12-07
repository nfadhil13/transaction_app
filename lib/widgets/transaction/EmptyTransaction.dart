import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  final String message;
  final String emptyImage;
  final double imageHeight;

  EmptyList({this.message, this.emptyImage, this.imageHeight = 200});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          message,
          textAlign: TextAlign.center,
        ),
        Container(
          height: imageHeight,
          child: Image.asset(
            emptyImage,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
