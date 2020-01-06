// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adres.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Adres _$AdresFromJson(Map<String, dynamic> json) {
  return Adres()
    ..adress = json['adress'] as String
    ..code = json['code'] as num;
}

Map<String, dynamic> _$AdresToJson(Adres instance) =>
    <String, dynamic>{'adress': instance.adress, 'code': instance.code};
