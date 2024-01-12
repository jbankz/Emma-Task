import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  @HiveType(typeId: 0, adapterName: 'UserAdapter')
  factory User(
      {@HiveField(0) String? firstName,
      @HiveField(1) String? lastName,
      @HiveField(2) String? email,
      @HiveField(3) String? phoneNumber,
      @HiveField(4) String? password,
      @HiveField(5) String? profileImage}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
