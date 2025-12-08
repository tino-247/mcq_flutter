// This file automatically picks the right import based on the platform
export 'native.dart' if (dart.library.html) 'web.dart';