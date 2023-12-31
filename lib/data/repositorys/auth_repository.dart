import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:test_auth/data/models/auth.dart';

class AuthRepository {
  http.Client httpClient = http.Client();

  String? token;

  decodeJWT(String jwt) {
    String tokenData = jwt.split('.')[1];

    if (tokenData.length % 4 > 0) {
      tokenData +=
          '=' * (4 - tokenData.length % 4); // as suggested by Albert221
    }
    Uint8List bytes = base64.decode(tokenData);

    final data = utf8.decode(bytes, allowMalformed: true);
    final decoded = jsonDecode(data);

    return decoded;
  }

  logIn(
    String email,
    String password,
  ) async {
    final response = await httpClient.post(
      Uri.parse('http://45.10.110.181:8080/api/v1/auth/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json);
      AutogeneratedModel autogenerated = AutogeneratedModel.fromJson(json);
      token = autogenerated.tokens!.accessToken.toString();
      this.token = token;
      return autogenerated;
    } else {
      return response.statusCode;
    }
  }
}
