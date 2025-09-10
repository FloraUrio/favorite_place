import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/screens/home.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 52, 80));
var kDarkScheme =  ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 46, 51, 65), 
   brightness: Brightness.dark
);
void main(){
  
  runApp(
  ProviderScope(
    child: MyApp())
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.onSecondaryContainer,
        )
       ),

       darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: kDarkScheme.onPrimaryContainer,
          foregroundColor: kDarkScheme.secondaryContainer,
        )       ),
        
        home:PlacesScreen() ,
    );
  }
}