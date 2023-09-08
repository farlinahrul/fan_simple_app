import '../data/remote/wrapper/model_factory.dart';

class User implements ModelFactory {
  User({
    this.name,
  });

  String? name;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
