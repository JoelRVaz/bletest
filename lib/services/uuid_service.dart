import 'package:uuid/uuid.dart';

class UuidService {
  Uuid uuid = const Uuid();

  String hello() {
    return uuid.v1().toString();
  }
}
