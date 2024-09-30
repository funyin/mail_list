import 'package:json_annotation/json_annotation.dart';

part 'mail.g.dart';

@JsonSerializable()
class Mail {
  final int id;
  final String firstName;
  final String? lastName;
  final String email;
  final bool read;
  final String subject;
  final String description;
  final String? imageUrl;

  const Mail({
    required this.id,
    required this.firstName,
    this.lastName,
    required this.email,
    required this.read,
    required this.subject,
    required this.description,
    this.imageUrl,
  });

  factory Mail.fromJson(Map<String, dynamic> json) => _$MailFromJson(json);
}
