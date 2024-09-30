import 'package:dio/dio.dart';
import 'package:mail_list/modules/mail/models/mail.dart';
import 'package:retrofit/retrofit.dart';
part 'mail_api.g.dart';

@RestApi()
abstract class MailApi {
  factory MailApi(Dio dio, {String baseUrl}) = _MailApi;

  @GET("v1/743e73d5-c8ce-4311-8930-c35d702c8308")
  Future<List<Mail>> mails();
}
