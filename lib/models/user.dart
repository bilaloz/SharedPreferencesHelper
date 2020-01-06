import 'package:json_annotation/json_annotation.dart';
import "phone.dart";
import "adres.dart";
part 'user.g.dart';

@JsonSerializable()
class User {
    User();

    String userName;
    String userLastName;
    num userTc;
    bool isStudent;
    List<Phone> phone;
    Adres adres;
    
    factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
    Map<String, dynamic> toJson() => _$UserToJson(this);
}
