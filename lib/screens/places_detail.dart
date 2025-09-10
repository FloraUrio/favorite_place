import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:places/provider/user_places.dart';
import 'package:places/widgets/image_input.dart';

class AddPlaces extends ConsumerStatefulWidget {
  const AddPlaces({super.key});

  @override
  ConsumerState<AddPlaces> createState() => _AddPlacesState();
}

class _AddPlacesState extends ConsumerState<AddPlaces> {
  final titleController = TextEditingController();
  File? selectedImage;

  void saveitem(){
    final enteredTitle = titleController.text;
    // ignore: unrelated_type_equality_checks
    if(enteredTitle == Null || enteredTitle.isEmpty){
      return;
    }
    ref.read(userPlacesProvider.notifier).addNewPlace(enteredTitle, selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('add new place')),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          children: [
            TextField(
              maxLength: 25,
              controller: titleController,
              decoration: InputDecoration(label: Text('place name')),
            ),
            ImageInput(
              onPickedImage: (image) {
                selectedImage = image;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                onPressed: saveitem,
                 label: Text('Add place'),
                 icon: Icon(Icons.add),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
