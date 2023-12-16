import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:itr_app/model/api_model.dart';

class AuthService {

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

  Future<UserProfile> myProfile(String token) async {
    final response = await http.get(
      Uri.parse('http://ec2-3-7-45-69.ap-south-1.compute.amazonaws.com:4000/api/user/profile/my-profile'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
    );

    if (response.statusCode == 200) {
      return UserProfile.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception("Failed to fetch profile");
    }
  }

  Future<bool> updateName(String name, String token) async {
    final response = await http.put(
      Uri.parse('http://ec2-3-7-45-69.ap-south-1.compute.amazonaws.com:4000/api/auth/update-name'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token,
      },
      body: jsonEncode({"name": name}),
    );

    if (response.statusCode == 200) {
      return true;
    }
    else {
      throw Exception("Failed to update Name");
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

  Future<bool> deletePerson(String id, String token) async {
    final response = await http.delete(
      Uri.parse('http://ec2-3-7-45-69.ap-south-1.compute.amazonaws.com:4000/api/user/person/$id'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      final responseData = json.decode(response.body);
      if (responseData['errors'] != null) {
        throw Exception(responseData['errors']['message'] ?? "Failed to delete person");
      } else {
        throw Exception("Failed to delete person");
      }
    }
  }

  Future<bool> updatePerson(String id,String token,String name, String number) async {
    final response = await http.put(
      Uri.parse('http://ec2-3-7-45-69.ap-south-1.compute.amazonaws.com:4000/api/user/person/$id'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
      body: jsonEncode({
        "name": name,
        "panCardNumber": number
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to update user');
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

  Future<SinglePersonResponse> getSinglePerson(String token,String personId) async {
    final response = await http.get(
      Uri.parse('http://ec2-3-7-45-69.ap-south-1.compute.amazonaws.com:4000/api/user/person/$personId'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
    );

    if (response.statusCode == 200) {
      return SinglePersonResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to fetch persons");
    }
  }

  Future<bool> uploadDocuments(List<File> documents, String personId, String token) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://ec2-3-7-45-69.ap-south-1.compute.amazonaws.com:4000/api/user/person/upload-doc'),
    );

    request.headers.addAll({
      "Authorization": token,
    });

    request.fields.addAll({
      'person_id': personId
    });


    for (int i = 0; i < documents.length; i++) {
      request.files.add(await http.MultipartFile.fromPath('files', documents[i].path));
    }


    var response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      // print(response.statusCode);
      throw Exception("Failed to upload documents");
    }
  }

  Future<OrderResponse> createOrder(String personId, String token) async {
    final response = await http.post(
      Uri.parse('http://ec2-3-7-45-69.ap-south-1.compute.amazonaws.com:4000/api/user/order/create-order'),
      body: json.encode({
        "person_id": personId,
        "amount": 599,
      }),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
    );

    if (response.statusCode == 200) {
      return OrderResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to create order");
    }
  }

  Future<PaymentHistoriesResponse>fetchPaymentHistory(String token) async {

    final response = await http.get(
        Uri.parse("http://ec2-3-7-45-69.ap-south-1.compute.amazonaws.com:4000/api/user/payment/payment-history"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
    );

    if (response.statusCode == 200) {
      return PaymentHistoriesResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch payment history');
    }
  }

  Future<PaymentHistoriesResponse> fetchPaymentHistoryForPerson(String personId, String token) async {

    final response = await http.get(
        Uri.parse("http://ec2-3-7-45-69.ap-south-1.compute.amazonaws.com:4000/api/user/payment/payment-history/$personId"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
    );

    if (response.statusCode == 200) {
      return PaymentHistoriesResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch payment history');
    }
  }

  Future<OrderForDashboardResponse> fetchOrdersForDashboard(String token) async {
    final response = await http.get(
      Uri.parse(
          "http://ec2-3-7-45-69.ap-south-1.compute.amazonaws.com:4000/api/user/order/orders-for-dashboard"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
    );

    if (response.statusCode == 200) {
      return OrderForDashboardResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch orders for dashboard');
    }
  }

  Future<OrderForDashboardResponse> fetchOrdersForSinglePerson(String token,String personId) async {
    final response = await http.get(
      Uri.parse(
          "http://ec2-3-7-45-69.ap-south-1.compute.amazonaws.com:4000/api/user/order/ordersOfOnePerson/$personId"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
    );

    if (response.statusCode == 200) {
      return OrderForDashboardResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch orders');
    }
  }



}
