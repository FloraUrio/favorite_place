import 'package:flutter/material.dart';
import 'package:places/models/places.dart';

class PlaceDetais extends StatelessWidget {
  const PlaceDetais({super.key, required this.place});

  final Places place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),

      body: Center(
        child:Image.file(place.image),
      ),
    );
  }
}