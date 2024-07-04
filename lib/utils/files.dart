import 'dart:io';

Future<List<String>> readLinesFromFile(String path) async {
  try {
    return await File(path).readAsLines();
  } on FileSystemException {
    return [];
  }
}
