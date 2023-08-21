class LoginResponse {
  final bool success;
  final String message;

  LoginResponse({required this.success, required this.message});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
      message: json['message'],
    );
  }
}

class OTPResponse {
  final bool success;
  final String token;

  OTPResponse({required this.success, required this.token});

  factory OTPResponse.fromJson(Map<String, dynamic> json) {
    return OTPResponse(
      success: json['success'],
      token: json['token'],
    );
  }
}


class Person {
  final String id;
  final String name;
  final String phoneNumber;
  final List<dynamic> documents;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Person({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.documents,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['_id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      documents: json['documents'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class PersonsResponse {
  final bool success;
  final List<Person> data;
  final int count;

  PersonsResponse({
    required this.success,
    required this.data,
    required this.count,
  });

  factory PersonsResponse.fromJson(Map<String, dynamic> json) {
    return PersonsResponse(
      success: json['success'],
      data: (json['data'] as List)
          .map((personJson) => Person.fromJson(personJson))
          .toList(),
      count: json['count'],
    );
  }
}
