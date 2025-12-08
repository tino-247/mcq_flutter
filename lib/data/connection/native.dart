import 'dart:io';
import 'dart:ffi';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/open.dart';

LazyDatabase connect() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'mcq_database.sqlite'));

    if (Platform.isWindows) {
      open.overrideFor(OperatingSystem.windows, _openOnWindows);
    } else if (Platform.isAndroid) {
      // Android workaround handled by sqlite3_flutter_libs, but explicit load is safe
      try {
        DynamicLibrary.open('libsqlite3.so');
      } catch (_) {}
      // await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    return NativeDatabase.createInBackground(file);
  });
}

DynamicLibrary _openOnWindows() {
  try {
    final scriptDir = File(Platform.script.toFilePath()).parent;
    final libraryNextToScript = File('${scriptDir.path}/sqlite3.dll');
    return DynamicLibrary.open(libraryNextToScript.path);
  } catch (e) {
    return DynamicLibrary.open('sqlite3.dll');
  }
}