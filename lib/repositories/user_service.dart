import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm_model/models/user.dart';
import 'package:mvvm_model/repositories/api_status.dart';
import 'package:mvvm_model/utils/constants.dart';

class UserService {
  static Future<Object> getUser() async {
    try {
      var response = await http.get(Uri.parse(USER_LIST));
      // final url = Uri.parse(USER_LIST);
      // final response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(response: usersListModelFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERRORS, errorResponse: 'Unknown error');
    }
  }
}
