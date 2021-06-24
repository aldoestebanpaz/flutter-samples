import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageFromFile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ImageFromFileState();
}

class _ImageFromFileState extends State<ImageFromFile> {

  PermissionStatus _permissionStatus = PermissionStatus.denied;

  initState() {
    super.initState();

    () async {
      PermissionStatus permissionStatus = await Permission.storage.status;

      if (_permissionStatus != PermissionStatus.granted) {
        permissionStatus = await Permission.storage.request();
      }

      setState(() {
        _permissionStatus = permissionStatus;
      });
    } ();
  }

  @override
  Widget build(BuildContext context) {
    if (_permissionStatus != PermissionStatus.granted) {
      return Text('Permissions not granted');
    }

    return Image.file(
      File('/storage/emulated/0/Download/test.jpg'),
      width: 100,
      height: 100,
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        print(exception);
        print(stackTrace);
        return Container(
          color: Colors.grey,
          width: 100,
          height: 100,
          child: const Center(
            child: const Text('Error loading image', textAlign: TextAlign.center),
          ),
        );
      },
    );
  }
}
