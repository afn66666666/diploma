import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MediaLoader extends StatefulWidget {
  MediaLoader({super.key});

  @override
  State<StatefulWidget> createState() => _MediaLoaderState();
}

class _MediaLoaderState extends State<MediaLoader> {
  @override
  final ImagePicker imgPicker = ImagePicker();
  List<File> _selectedImages = [];
  Widget build(BuildContext context) {
    log('resources slot builded!');
    return Row(children: [
      Row(
          children: _selectedImages.map((value) {
        return Row(children: [
          Stack(
            children: [
              Image.file(
                value,
                fit: BoxFit.cover,
                width: 80,
                height: 100,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                    color: Colors.black
                        .withOpacity(0.5), // Полупрозрачный черный цвет
                  ),
                ),
              ),
              Positioned(
                top: -15,
                right: -15,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey.shade400,
                  ),
                  onPressed: () {
                    setState(() {
                    _removeImage(_selectedImages.indexOf(value));
                      
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          )
        ]);
      }).toList()),
      Row(children: [
        SizedBox(
            width: 80,
            child: PopupMenuButton<ImageSource>(
                position: PopupMenuPosition.over,
                child: const Icon(size: 40, Icons.add),
                itemBuilder: (context) {
                  return <PopupMenuEntry<ImageSource>>[
                    const PopupMenuItem<ImageSource>(
                        value: ImageSource.camera,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.camera_alt),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Сделать снимок')
                            ])),
                    const PopupMenuItem<ImageSource>(
                        value: ImageSource.gallery,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.image_outlined),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Загрузить из галереи')
                            ]))
                  ];
                },
                onSelected: (source) async {
                  final pickedFile = await imgPicker.pickImage(source: source);
                  if (pickedFile != null) {
                    setState(() {
                      File f = File(pickedFile.path);
                      _addImage(f);
                    });
                  }
                }))
      ]),
    ]);
  }

  void _addImage(File image) {
    _selectedImages.add(image);
  }

  void _removeImage(int index) {
    _selectedImages.removeAt(index);
  }
}
