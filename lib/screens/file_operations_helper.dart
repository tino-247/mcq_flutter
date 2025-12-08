// This acts as a bridge. It automatically picks the right file.
export 'file_operations_io.dart' if (dart.library.html) 'file_operations_web.dart';