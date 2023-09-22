import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';
@JsonSerializable()
class User{
  final Gender? gender;
  final String? name;
  @JsonKey(name: 'dateofbirth')
  final DateTime dob;

  User(this.name,this.gender,this.dob);

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable()
class Result{
  final List<User> results;

  Result(this.results);

  factory Result.fromJson(Map<String,dynamic> json) => _$ResultFromJson(json);

  Map<String,dynamic> toJson() => _$ResultToJson(this);

}
  enum Gender{
    male,
    female,
    other
  }