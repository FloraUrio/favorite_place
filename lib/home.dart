import 'package:flutter/material.dart';
import 'package:places/models/favorities.dart';
import 'package:places/screens/new_item.dart';


class PlacesScreen extends StatefulWidget {
  const  PlacesScreen({super.key,
   
   });



  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {

    final  List<Favorities> favPlaces = [];

  void addNewPlace()async{
    
    final resultItem= await Navigator.of(context).push<Favorities>(MaterialPageRoute(builder: (context){
        return  AddPlaces();
      }));
      
      if(resultItem == null){
        return;
      }
     setState(() {
       favPlaces.add(resultItem);
     });  
    }
  

  
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('your places'),
        actions: [
          IconButton(onPressed: addNewPlace, 
          icon: Icon(Icons.add))
        ],
      ),

      body: ListView.builder(
        itemCount: favPlaces.length,
        itemBuilder:(context, index){
           return ListTile(
            title: Text(favPlaces[index].country),
           );
      } )
    );
  }
}