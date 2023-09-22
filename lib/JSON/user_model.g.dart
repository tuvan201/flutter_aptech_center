// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['name'] as String?,
      $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      DateTime.parse(json['dateofbirth'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'gender': _$GenderEnumMap[instance.gender],
      'name': instance.name,
      'dateofbirth': instance.dob.toIso8601String(),
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      (json['results'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'results': instance.results,
    };
