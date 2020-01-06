// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Phone _$PhoneFromJson(Map<String, dynamic> json) {
  return Phone()
    ..phoneNumber = json['phoneNumber'] as num
    ..phoneGSM = json['phoneGSM'] as String;
}

Map<String, dynamic> _$PhoneToJson(Phone instance) => <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'phoneGSM': instance.phoneGSM
    };
