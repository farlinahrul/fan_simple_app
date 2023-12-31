import '../../../model/user.dart';

abstract class ModelFactory {
  factory ModelFactory.fromJson(Type type, Map<String, dynamic> json) {
    var strType = type.toString().replaceAll("?", "");
    if (strType == (User).toString()) {
      return User.fromJson(json);
    }
    // if not implemented
    else {
      throw UnimplementedError('`$type` factory unimplemented.');
    }
  }
}
