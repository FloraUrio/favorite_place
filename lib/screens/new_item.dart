import 'package:flutter/material.dart';

import 'package:places/models/favorities.dart';


class AddPlaces extends StatefulWidget {
  const AddPlaces({super.key,  });

 
  @override
  State<AddPlaces> createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {
  final countryName = TextEditingController();
  final nameTitle = TextEditingController();

  void saveitem(){
    setState(() {
      Navigator.of(context).pop(
        Favorities(
          country: countryName.text,
         name: nameTitle.text )
      );
    });
  }


 @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('add new place'),
      ),
      body:Padding (
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
           children: [
            TextField(
              maxLength: 25,
              controller: countryName,
              decoration: InputDecoration(
                label: Text('your picture country')
              ),
               ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: (){},
                 child: Text('reset')),

                ElevatedButton(
                  onPressed: saveitem,
                 child: Text('submit'))
              ],
            )
           ],
          ),
      ),
    );
  }
}