import 'package:json_annotation/json_annotation.dart';

part 'adres.g.dart';

@JsonSerializable()
class Adres {
    Adres();

    String adress;
    num code;
    
    factory Adres.fromJson(Map<String,dynamic> json) => _$AdresFromJson(json);
    Map<String, dynamic> toJson() => _$AdresToJson(this);
}
