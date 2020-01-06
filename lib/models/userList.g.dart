// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserList _$UserListFromJson(Map<String, dynamic> json) {
  return UserList()
    ..userList = (json['userList'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UserListToJson(UserList instance) =>
    <String, dynamic>{'userList': instance.userList};
