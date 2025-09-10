import 'package:flutter/material.dart';
import 'package:places/models/places.dart';

class PlacesList extends StatelessWidget {
  const PlacesList ({super.key, required this.place});

  final List<Places>place;

  @override
  Widget build(BuildContext context) {
  

    return ListView.builder(
      itemCount: place.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(place[index].title),
          
        );
      },
    );
  }
}