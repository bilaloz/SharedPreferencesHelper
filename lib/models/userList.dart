import 'package:json_annotation/json_annotation.dart';
import "user.dart";
part 'userList.g.dart';

@JsonSerializable()
class UserList {
    UserList();

    List<User> userList;
    
    factory UserList.fromJson(Map<String,dynamic> json) => _$UserListFromJson(json);
    Map<String, dynamic> toJson() => _$UserListToJson(this);
}
