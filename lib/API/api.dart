import 'package:dio/dio.dart';
import 'package:e_finder/model/userModel.dart';

const baseUrl = "https://efinder.cognitiveitsolutions.ca/public/api";
const registerUrl = "$baseUrl/login/social-response";

class API {
  static Future<UserModel> registerUser(String name, String email, String provider, String providerId) async {

    final dio = Dio();

    try {
      print("==== Send Request to server ====");
      final response = await dio.post(registerUrl, data: {
        'name': name,
        'email': email,
        'provider': provider,
        'provider_id': providerId,
      });

      print("==== Response Code : ${response.statusCode} ====");
      if (response.statusCode == 201 || response.statusCode == 200) {
        // Parse the response JSON
        print("==== Response Successful ====");
        final responseData = response.data;

        // Check if the response contains the 'data' key
        if (responseData.containsKey('data')) {
          return UserModel.fromJson(responseData);
        } else {
          print("==== Response fail : Invalid response format ====");
          throw Exception('Invalid response format');
        }
      } else {
        print("==== Response fail :Failed to register user ====");
        throw Exception('Failed to register user');
      }
    } catch (e) {
      print("==== Response fail : $e ====");
      throw Exception('Error: $e');
    }
  }

}