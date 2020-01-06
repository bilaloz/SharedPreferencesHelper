import 'package:json_annotation/json_annotation.dart';

part 'phone.g.dart';

@JsonSerializable()
class Phone {
    Phone();

    num phoneNumber;
    String phoneGSM;
    
    factory Phone.fromJson(Map<String,dynamic> json) => _$PhoneFromJson(json);
    Map<String, dynamic> toJson() => _$PhoneToJson(this);
}
