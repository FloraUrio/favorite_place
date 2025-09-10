import 'dart:io';

import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Places {
  String id;
  String title;
  File image;

  Places({
    required this.image,
     required this.title,
     }):id = uuid.v4();
}