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
  final bool isNameSaved;

  OTPResponse({required this.success, required this.token, required this.isNameSaved});

  factory OTPResponse.fromJson(Map<String, dynamic> json) {
    return OTPResponse(
      success: json['success'],
      token: json['token'],
      isNameSaved: json['isNameSaved']
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

class OrderResponse {
  final String id;
  final String entity;
  final int amount;
  final int amountPaid;
  final int amountDue;
  final String currency;
  final String receipt;
  final String? offerId;
  final String status;
  final int attempts;
  final List<dynamic> notes;
  final int createdAt;
  final String razorpayKeyId;

  OrderResponse({
    required this.id,
    required this.entity,
    required this.amount,
    required this.amountPaid,
    required this.amountDue,
    required this.currency,
    required this.receipt,
    required this.offerId,
    required this.status,
    required this.attempts,
    required this.notes,
    required this.createdAt,
    required this.razorpayKeyId,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      id: json['id'],
      entity: json['entity'],
      amount: json['amount'],
      amountPaid: json['amount_paid'],
      amountDue: json['amount_due'],
      currency: json['currency'],
      receipt: json['receipt'],
      offerId: json['offer_id'],
      status: json['status'],
      attempts: json['attempts'],
      notes: json['notes'],
      createdAt: json['created_at'],
      razorpayKeyId: json['razorpay_key_id'],
    );
  }
}

class PaymentHistory {
  final bool success;
  final List<PaymentData> data;
  final int count;

  PaymentHistory({
    required this.success,
    required this.data,
    required this.count,
  });

  factory PaymentHistory.fromJson(Map<String, dynamic> json) {
    return PaymentHistory(
      success: json['success'],
      data: (json['data'] as List)
          .map((paymentDataJson) => PaymentData.fromJson(paymentDataJson))
          .toList(),
      count: json['count'],
    );
  }
}

class PaymentData {
  final String id;
  final int amount;
  final String paymentId;
  final String userId;
  final String personId;
  final String orderId;
  final String status;
  final String? comment;
  final String dateTime;
  final DateTime createdAt;
  final DateTime updatedAt;

  PaymentData({
    required this.id,
    required this.amount,
    required this.paymentId,
    required this.userId,
    required this.personId,
    required this.orderId,
    required this.status,
    this.comment,
    required this.dateTime,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) {
    return PaymentData(
      id: json['_id'],
      amount: json['amount'],
      paymentId: json['paymentId'],
      userId: json['userId'],
      personId: json['personId'],
      orderId: json['orderId'],
      status: json['status'],
      comment: json['comment'],
      dateTime: json['dateTime'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

