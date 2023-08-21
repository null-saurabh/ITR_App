import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:itr_app/model/api_model.dart';

class AuthService {
  static const baseUrl = 'YOUR_BASE_API_URL';

  Future<LoginResponse> login(String phoneNumber) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://ec2-3-7-45-69.ap-south-1.compute.amazonaws.com:4000/api/auth/login'));
    request.body = json.encode({
      "phone_number": "9079857902"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return LoginResponse.fromJson(json.decode(response.stream.bytesToString()));
    }
    else {
      print(response.reasonPhrase);
    }


    // if (response.statusCode == 200) {
    //   return LoginResponse.fromJson(json.decode(response.body));
    // } else {
    //   throw Exception("Failed to login");
    }


  Future<OTPResponse> verifyOTP(String phoneNumber, String otp) async {
    final response = await http.post(
      Uri.parse('$baseUrl/verify-otp'),
      body: json.encode({
        "phone_number": phoneNumber,
        "otp": otp,
      }),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return OTPResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to verify OTP");
    }
  }

  Future<PersonsResponse> getPersons(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/persons'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
    );

    if (response.statusCode == 200) {
      return PersonsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to fetch persons");
    }
  }
}
