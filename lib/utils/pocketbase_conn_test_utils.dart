import 'package:pocketbase/pocketbase.dart';

class PocketBaseTestUtils {
  static final PocketBase _pb = PocketBase('http://127.0.0.1:8090/');

  static PocketBase get pocketBaseTestInstance => _pb;
}
