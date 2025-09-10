import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  const ImageInput( {super.key, required this.onPickedImage});

  final void Function(File image) onPickedImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

 File? selectedImage;

void takePicture() async {
 final imagePick = ImagePicker();
 final pickedImage = await imagePick.pickImage(source: ImageSource.camera, maxWidth: 600);

 if(pickedImage == null){
   return;
 }
setState(() {
  selectedImage = File(pickedImage.path);
});

widget.onPickedImage(selectedImage!);
}



  @override
  Widget build(BuildContext context) {
  Widget content = TextButton.icon(
        onPressed:takePicture,
         icon: Icon(Icons.camera),
         label: Text('take picture'),
         );

         if(selectedImage != null){
            content=
             GestureDetector(
              onTap: takePicture,
              child: Image.file(selectedImage!, fit: BoxFit.cover,));
         }

         

    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all()
      ),
      child: content,
    );
  }
}