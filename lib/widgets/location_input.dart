import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});
  

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
Location? isPickedLocation;
var isGettingLocation = false;


Future<void> addLocation() async {
  Location location = Location();

bool serviceEnabled;
PermissionStatus permissionGranted;
LocationData locationData;

serviceEnabled = await location.serviceEnabled();
if (!serviceEnabled) {
  serviceEnabled = await location.requestService();
  if (!serviceEnabled) {
    return;
  }
}

permissionGranted = await location.hasPermission();
if (permissionGranted == PermissionStatus.denied) {
  permissionGranted = await location.requestPermission();
  if (permissionGranted != PermissionStatus.granted) {
    return;
  }
}

setState(() {
    isGettingLocation = true;
  });

locationData = await location.getLocation();


setState(() {
    isGettingLocation = false;
  });
}

  @override
  Widget build(BuildContext context) {
    Widget previewContent =  Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 170,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1
            )
          ),
          child: Text(
            'no updated location'
          ),
        ) ;

        if(isGettingLocation){
          previewContent = CircularProgressIndicator();
        }

    return Column(
       children: [
       previewContent,
       
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('location'),
              onPressed: addLocation ,
             ),
    
             TextButton.icon(
              icon: Icon(Icons.map),
              label: Text('map'),
              onPressed: (){},
             ),
          ],
        )
      ],
    );
  }
}

