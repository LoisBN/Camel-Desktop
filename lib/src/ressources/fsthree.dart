import 'dart:io';

class FsThree {
  final String root;
  List<FileSystemEntity> childs = [];
  FsThree(this.root);

  void getChilds() {
    Directory(root).list(recursive: false).listen((fs) {
      childs.add(fs);
    });
  }
}
