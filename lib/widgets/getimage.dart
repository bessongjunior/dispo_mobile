// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:flutter/foundation.dart';
import'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  late File _imageFile;
  String _mlResult = '<no result>';
  final _picker = ImagePicker();

  Future<bool> _pickImage() async {
    setState(() => _imageFile = null);
    final File? imageFile = await showDialog<File>(
      context: context,
      builder: (ctx) => SimpleDialog(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take picture'),
            onTap: () async {
              final PickedFile? pickedFile =
              await _picker.getImage(source: ImageSource.camera);
              Navigator.pop(ctx, File(pickedFile.path));
            },
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Pick a video'),
            onTap: () async {
              try {
                final PickedFile? pickedFile =
                await _picker.getImage(source: ImageSource.gallery);
                Navigator.pop(ctx, File(pickedFile.path));
              } catch (e) {
                print(e);
                Navigator.pop(ctx, null);
              }
            },
          ),
        ],
      ),
    );
    if (imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please pick one image first.')),
      );
      return false;
    }
    setState(() => _imageFile = imageFile);
    if (kDebugMode) {
      print('picked image: $_imageFile');
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

