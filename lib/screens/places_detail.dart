import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:places/provider/user_places.dart';
import 'package:places/widgets/image_input.dart';
import 'package:places/widgets/location_input.dart';

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
    
    if(selectedImage == null || enteredTitle.isEmpty){
      return;
      
    }
    ref.read(userPlacesProvider.notifier).addNewPlace(enteredTitle, selectedImage!);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('add new place')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              maxLength: 25,
              controller: titleController,
              decoration: InputDecoration(label: Text('place name')),
            ),
                
            SizedBox(height: 8,),
            ImageInput(
              onPickedImage: (image) {
                selectedImage = image;
              },
            ),
                
            SizedBox(height: 8,),
            LocationInput(),
                
            SizedBox(height: 8,),
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
