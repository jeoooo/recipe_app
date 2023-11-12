import 'package:pocketbase/pocketbase.dart';

class PocketBaseUtils {
  static final PocketBase _pb = PocketBase('http://10.0.2.2:8090');

  static PocketBase get pocketBaseInstance => _pb;
}
