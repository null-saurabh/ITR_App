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

class SinglePersonResponse {
  final bool success;
  final Person data;

  SinglePersonResponse({
    required this.success,
    required this.data,
  });

  factory SinglePersonResponse.fromJson(Map<String, dynamic> json) {
    return SinglePersonResponse(
      success: json['success'],
      data: Person.fromJson(json['data']),
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
  final String id;
  final String dateTime;
  final int amount;
  final String transactionId;
  final String userId;
  final String personId;
  final String orderId;
  final String status;
  final String? comment;

  PaymentHistory({
    required this.id,
    required this.dateTime,
    required this.amount,
    required this.transactionId,
    required this.userId,
    required this.personId,
    required this.orderId,
    required this.status,
    this.comment,
  });

  factory PaymentHistory.fromJson(Map<String, dynamic> json) {
    return PaymentHistory(
      id: json['_id'],
      dateTime: json['dateTime'],
      amount: json['amount'],
      transactionId: json['transactionId'],
      userId: json['userId'],
      personId: json['personId'],
      orderId: json['orderId'],
      status: json['status'],
      comment: json['comment'],
    );
  }
}

class PaymentHistoriesResponse {
  final bool success;
  final List<PaymentHistory> data;
  final int count;

  PaymentHistoriesResponse({
    required this.success,
    required this.data,
    required this.count,
  });

  factory PaymentHistoriesResponse.fromJson(Map<String, dynamic> json) {
    return PaymentHistoriesResponse(
      success: json['success'],
      data: (json['data'] as List).map((i) => PaymentHistory.fromJson(i)).toList(),
      count: json['count'],
    );
  }
}

class UserProfile {
  final String? id;
  final String? phoneNumber;
  final String? otp;
  final String? role;
  final bool? activate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? name;

  UserProfile({
    this.id,
    this.phoneNumber,
    this.otp,
    this.role,
    this.activate,
    required this.createdAt,
    required this.updatedAt,
    this.name,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['_id'],
      phoneNumber: json['phoneNumber'],
      otp: json['otp'],
      role: json['role'],
      activate: json['activate'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      name: json['name'],
    );
  }
}

class OrderForDashboard {
  final String id;
  final String orderStatus;
  final String orderId;
  final int amount;
  final String personId;
  final String userId;
  final bool seen;
  final String createdAt;
  final String updatedAt;
  final Expert? expert;// Nullable field for orders with "assignExpert" status
  final Person? person;

  OrderForDashboard({
    required this.id,
    required this.orderStatus,
    required this.orderId,
    required this.amount,
    required this.personId,
    required this.userId,
    required this.seen,
    required this.createdAt,
    required this.updatedAt,
    this.expert,
    this.person,
  });

  factory OrderForDashboard.fromJson(Map<String, dynamic> json) {
    return OrderForDashboard(
      id: json['_id'] ?? '',
      orderStatus: json['orderStatus'] ?? '',
      orderId: json['orderId'] ?? '',
      amount: json['amount'] ?? 0,
      personId: json['personId'] ?? '',
      userId: json['userId'] ?? '',
      seen: json['seen'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      expert: json['expert'] != null ? Expert.fromJson(json['expert']) : null,
      person: json['person'] != null ? Person.fromJson(json['person'][0]) : null,
    );
  }
}

class Expert {
  final String id;
  final String name;

  Expert({
    required this.id,
    required this.name,
  });

  factory Expert.fromJson(Map<String, dynamic> json) {
    return Expert(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class OrderForDashboardResponse {
  final bool success;
  final List<OrderForDashboard> data;
  final int count;

  OrderForDashboardResponse({
    required this.success,
    required this.data,
    required this.count,
  });

  factory OrderForDashboardResponse.fromJson(Map<String, dynamic> json) {
    return OrderForDashboardResponse(
      success: json['success'] ?? false,
      data: (json['data'] as List).map((orderJson) => OrderForDashboard.fromJson(orderJson)).toList(),
      count: json['count'] ?? 0,
    );
  }
}



