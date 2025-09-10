import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/models/places.dart';

final userPlacesProvider = StateNotifierProvider<UserPlacesNotifier, List<Places>>((ref)
{
 return UserPlacesNotifier();
}
);

class UserPlacesNotifier extends StateNotifier< List<Places>>{
    UserPlacesNotifier():super(const []);

    void addNewPlace(String title, File image){
      final newPlace = Places(title: title, image: image);
      state = [newPlace, ...state];
    }
}