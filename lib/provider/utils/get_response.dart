import 'package:dio/dio.dart';
import 'package:seneca/widgets/class/user.dart';

class GetResponse {
  final _dio = Dio();

  Future<List<UserProvider>> getResponse() async {
    final response = await _dio.get(
        "https://script.googleusercontent.com/a/macros/g.educaand.es/echo?user_content_key=WbBKG6QvWis7kX81Enw5yrUlbqVn6raCXx1i4XmEbdOIuMbhHL4eVDWTMykgDOzxLIOSrUmwKjJD6F2_Nkb8F0Vvg-ixR_u7OJmA1Yb3SEsKFZqtv3DaNYcMrmhZHmUMi80zadyHLKAUKE7B4g-fT_vZNoUciZTzS4chwneYR2sdj41wao2CHMYpeQjObkHTmaF8KmvAEIHXczJzzpwqI93bcAzufe2WxwAAMmxV1AebTcb_j7LEGgNgzVhE9Lh6k8CSXbX_svbzwIdf1f3q_AMnpl-F9eiu3H8wP4HeQKqsadw0s2WjvmIFWY7ff3EcbKwsWTVCzfCRfOy2zUMqG-W7w3QAJ7tp5nw719D090o&lib=M3NbBbsXCsCUZ17O6j8g_h_PP-cdau5RC");

    return userFromJson(response.data);
  }
}
