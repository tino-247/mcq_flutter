import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path/path.dart' as p;

class FileOps {
  static Future<void> exportDb(BuildContext context) async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'mcq_database.sqlite'));
    
    if (await file.exists()) {
      await Share.shareXFiles([XFile(file.path)], text: 'MCQ Database Backup');
    } else {
      if(context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No database found.")));
    }
  }

  static Future<void> importDb(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      try {
        File source = File(result.files.single.path!);
        final dbFolder = await getApplicationDocumentsDirectory();
        final target = File(p.join(dbFolder.path, 'mcq_database.sqlite'));
        
        await source.copy(target.path);
        
        if(context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("DB Imported. Please restart app.")));
        }
      } catch (e) {
        print("Import Error: $e");
      }
    }
  }
}