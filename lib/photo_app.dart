import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';

class PhotoApp extends StatefulWidget {
  back(BuildContext context) {
      context.pop('/');
    }
  @override
  _PhotoAppState createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  XFile? _image;

  Future getImage(bool isTakephoto) async {
    var image = await ImagePicker().pickImage(
        source: isTakephoto ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void back(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('How to launch other app'),
          leading: GestureDetector(
            onTap: () {
              back(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          
        ),
        body: Center(
          child: _image == null
              ? Text('No image selected.')
              : Image.file(File(_image!.path)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _pickImage,
          tooltip: 'Choose a photo',
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }

  void _pickImage() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 160,
          child: Column(
            children: [
              _item('Shot a photo', true),
              _item('Select from gallery', false),
            ],
          ),
        );
      },
    );
  }

  Widget _item(String title, bool isTakephoto) {
    return GestureDetector(
      child: ListTile(
        leading:
            Icon(isTakephoto ? Icons.camera_alt : Icons.photo_library),
        title: Text(title),
        onTap: () => getImage(isTakephoto),
      ),
    );
  }
}