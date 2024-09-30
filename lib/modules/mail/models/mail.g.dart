// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mail _$MailFromJson(Map<String, dynamic> json) => Mail(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String?,
      email: json['email'] as String,
      read: json['read'] as bool,
      subject: json['subject'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$MailToJson(Mail instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'read': instance.read,
      'subject': instance.subject,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
