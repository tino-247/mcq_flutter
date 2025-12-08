import 'package:drift/drift.dart';
import 'package:drift/web.dart';

LazyDatabase connect() {
  return LazyDatabase(() async {
    // This uses the older, more compatible Web implementation (sql.js/IndexedDB)
    // It is much easier to get running than the pure WASM version because
    // it doesn't require specific server headers.
    return WebDatabase('mcq_app_db', logStatements: true);
  });
}