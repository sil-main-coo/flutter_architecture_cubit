// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    json['access_token'] as String?,
  )
    ..refreshToken = json['refresh_token'] as String?
    ..refreshExpiresIn = json['refresh_expires_in'] as int?;
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'refresh_expires_in': instance.refreshExpiresIn,
    };
