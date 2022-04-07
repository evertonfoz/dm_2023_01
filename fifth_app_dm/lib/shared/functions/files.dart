import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> getFilePath() async {
  Directory appDocumentsDirectory =
      await getApplicationDocumentsDirectory(); // 1
  // String appDocumentsPath = appDocumentsDirectory.path; // 2
  // String filePath = '$appDocumentsPath/demoTextFile.txt'; // 3

  return appDocumentsDirectory.path;
}

Future<String> saveFile(
    {required File sourceFile, required String fileName}) async {
  final String _appPath = await getFilePath(); // 1
  final File localImage = await sourceFile.copy('$_appPath/$fileName');

  return localImage.path;
}
