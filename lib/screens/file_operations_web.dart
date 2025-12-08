import 'package:flutter/material.dart';

class FileOps {
  static Future<void> exportDb(BuildContext context) async {
    // Web SQLite (WASM) stores data in browser cache (IndexedDB).
    // Extracting it requires specific OPFS handling which is complex.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("DB Export is not supported on Web yet.")),
    );
  }

  static Future<void> importDb(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("DB Import is not supported on Web yet.")),
    );
  }
}