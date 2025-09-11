import 'package:flutter/material.dart';
import 'package:places/models/places.dart';
import 'package:places/screens/place_detais.dart';

class PlacesList extends StatelessWidget {
  const PlacesList ({super.key, required this.place});

  final List<Places>place;

  @override
  Widget build(BuildContext context) {
  

    return ListView.builder(
      
      itemCount: place.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: FileImage(place[index].image),
          ),
          title: Text(place[index].title),
          
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context){
                return PlaceDetais(place: place[index]);
              })
            );
          },
        );
      },  
    );

    
  }
}