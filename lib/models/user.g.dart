// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..userName = json['userName'] as String
    ..userLastName = json['userLastName'] as String
    ..userTc = json['userTc'] as num
    ..isStudent = json['isStudent'] as bool
    ..phone = (json['phone'] as List)
        ?.map(
            (e) => e == null ? null : Phone.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..adres = json['adres'] == null
        ? null
        : Adres.fromJson(json['adres'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userName': instance.userName,
      'userLastName': instance.userLastName,
      'userTc': instance.userTc,
      'isStudent': instance.isStudent,
      'phone': instance.phone,
      'adres': instance.adres
    };
