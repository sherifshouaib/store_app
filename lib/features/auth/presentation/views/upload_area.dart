import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadArea extends StatefulWidget {
  const UploadArea({
    super.key,
   // required this.selectedFile,
  });
  //final FilePickerResult selectedFile;

  @override
  State<UploadArea> createState() => _UploadAreaState();
}

class _UploadAreaState extends State<UploadArea> {
  @override
  Widget build(BuildContext context) {
    final selectedFile =
        ModalRoute.of(context)!.settings.arguments as FilePickerResult;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Area'),
      ),
      body: Column(
        children: [
          TextFormField(
            readOnly: true,
            initialValue: selectedFile.files.first.name,
            decoration: const InputDecoration(
              label: Text('Name'),
            ),
          ),
          TextFormField(
            readOnly: true,
            initialValue: selectedFile.files.first.extension,
            decoration: const InputDecoration(
              label: Text('Extension'),
            ),
          ),
          TextFormField(
            readOnly: true,
            initialValue: "${selectedFile.files.first.size} bytes",
            decoration: const InputDecoration(
              label: Text('size'),
            ),
          )
        ],
      ),
    );
  }
}
