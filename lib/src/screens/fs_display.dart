import 'dart:io';

import 'package:camel/src/ressources/fsthree.dart';
import 'package:flutter/material.dart';

class FsDisplay extends StatefulWidget {
  final FsThree three;
  FsDisplay(this.three);
  @override
  _FsDisplayState createState() {
    return _FsDisplayState();
  }
}

class _FsDisplayState extends State<FsDisplay> {
  List<FileSystemEntity> childs;
  @override
  void initState() {
    widget.three.getChilds();
    childs = widget.three.childs;
    super.initState();
  }

  List<FileSystemEntity> getChilds(String path) {
    var result = <FileSystemEntity>[];
    Directory(path).list().listen((event) {
      result.add(event);
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 80, left: 80, bottom: 40),
            child: Text(
              "Camel Files",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
            ),
          ),
          Divider(),
          SizedBox(height: 10,),
          ...childs
              .map((fsEntity) => ExpansionTile(
                    leading: Icon(
                        fsEntity is Directory ? Icons.folder : Icons.file_copy),
                    title: Text(fsEntity.path),
                    subtitle:
                        Text(fsEntity is Directory ? "dossier" : "fichier"),
                    children: getChilds(fsEntity.path)
                        .map((e) => ListTile(
                              title: Text(e.path),
                              subtitle: Text(fsEntity is Directory
                                  ? "dossier"
                                  : "fichier"),
                              leading: Icon(fsEntity is Directory
                                  ? Icons.folder
                                  : Icons.file_copy),
                            ))
                        .toList(),
                  ))
              .toList()
        ],
      ),
    );
  }
}
