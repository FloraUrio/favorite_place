import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/provider/user_places.dart';
import 'package:places/screens/places_detail.dart';
import 'package:places/widgets/places_list.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
 final newPlace = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('your place'),
        actions: [
          IconButton(
          icon: Icon(Icons.add),
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder:(context) => AddPlaces(),)
            );
          }, 
         ) 
        ],
      ),

      body: PlacesList(place: newPlace),
    );
  }
}