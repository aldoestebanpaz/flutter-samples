import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Files {
  static Future<String> getDbFilePath() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    return appDocDir.path + 'todos.db';
  }
}
