import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:itr_app/model/api_model.dart';

class AuthService {
  static const baseUrl = 'YOUR_BASE_API_URL';

  Future<LoginResponse> login(String phoneNumber) async {
    final response = await http.post(
      Uri.parse('http://ec2-3-7-45-69.ap-south-1.compute.amazonaws.com:4000/api/auth/login'),
      body: json.encode({
        "phone_number": phoneNumber,
      }),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to login");
    }
  }


  Future<OTPResponse> verifyOTP(String phoneNumber, String otp) async {
    final response = await http.post(
      Uri.parse('http://ec2-3-7-45-69.ap-south-1.compute.amazonaws.com:4000/api/auth/varify-otp'),
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

  Future<bool> addPerson(String name, String phoneNumber,String token) async {
    final response = await http.post(
      Uri.parse('http://ec2-3-7-45-69.ap-south-1.compute.amazonaws.com:4000/api/user/person/addPerson'),
      body: json.encode({
        "name": name,
        "phone_number": phoneNumber,
      }),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      final responseData = json.decode(response.body);
      if (responseData['errors'] != null && responseData['errors']['message'] == "Already added person with this phone number") {
        throw Exception(responseData['errors']['message']);
      } else {
        throw Exception("Failed to add person");
      }
    }
  }


  Future<PersonsResponse> getPersons(String token) async {
    final response = await http.get(
      Uri.parse('http://ec2-3-7-45-69.ap-south-1.compute.amazonaws.com:4000/api/user/person/'),
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
