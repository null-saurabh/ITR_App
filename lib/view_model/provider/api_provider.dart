import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:itr_app/model/api_model.dart';
import 'package:itr_app/view_model/services/api_service.dart';

class ApiProvider with ChangeNotifier {
  String? _token;
  String? get token => _token;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  late bool _isNameSaved;
  bool get isNamedSaved => _isNameSaved;

  List<OrderForDashboard>? _ordersForDashboard;
  List<OrderForDashboard>? get ordersForDashboard => _ordersForDashboard;

  UserProfile? _userProfile;
  UserProfile? get userProfile {
    if (_userProfile == null) {
      fetchMyProfile();
    }
    return _userProfile;
  }

  final AuthService _authService = AuthService();
  final storage = const FlutterSecureStorage();


  ApiProvider() {
    loadTokenFromStorage();
  }

  Future<void> loadTokenFromStorage() async {
    String? storedToken = await storage.read(key: 'token');
    if (storedToken != null) {
      _token = storedToken;
      _isLoggedIn = true;
      notifyListeners();
    }
  }

  Future<bool> login(String phoneNumber) async {
    try {
      final response = await _authService.login(phoneNumber);
      if (response.success) {
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message;
        notifyListeners();
        return false;
      }
    } catch (error) {
      _errorMessage = 'Internet Error';
      notifyListeners();
      return false;
    }
  }

  Future<void> fetchMyProfile() async {
    try {
      _userProfile = await _authService.myProfile(_token!);
      notifyListeners();
    } catch (error) {
      _errorMessage = 'Failed to fetch profile';
      notifyListeners();
      rethrow;
    }
  }

  Future<OrderResponse> createOrder(String personId) async {
    if (_token == null) {
      _errorMessage = 'Not authenticated';
      notifyListeners();
      throw Exception('Not authenticated');
    }

    try {
      OrderResponse orderResponse = await _authService.createOrder(personId, _token!);
      updateOrdersForDashboard();
      return orderResponse;

    } catch (error) {
      _errorMessage = 'Failed to create order';
      notifyListeners();
      rethrow;
    }
  }

  Future<void> deletePerson(String personId) async {
    try {
      await _authService.deletePerson(personId, _token!);
      notifyListeners();
    } catch (error) {
      _errorMessage = 'Failed to delete person';
      notifyListeners();
      rethrow;
    }
  }

  Future<void> updatePerson(String personId,String name, String number) async {
    try {
      await _authService.updatePerson(personId, _token!,name,number);
      notifyListeners();
    } catch (error) {
      _errorMessage = 'Failed to delete person';
      notifyListeners();
      rethrow;
    }
  }

  Future<bool> verifyOTP(String phoneNumber, String otp) async {
    try {
      final response = await _authService.
      verifyOTP(phoneNumber, otp);
      if (response.success) {
        _token = response.token;
        _isLoggedIn = true;
        _isNameSaved = response.isNameSaved;

        await storage.write(key: 'token', value: _token!);
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Failed to verify OTP';
        notifyListeners();
        return false;
      }
    } catch (error) {
      _errorMessage = 'Failed to verify OTP';
      notifyListeners();
      return false;
    }
  }

  Future<List<Person>> getPersons() async {
    if (_token == null) {
      _errorMessage = 'Not authenticated';
      notifyListeners();
      throw Exception('Not authenticated');
    }

    try {
      final response = await _authService.getPersons(_token!);
      if (response.success) {
        return response.data;
      } else {
        _errorMessage = 'Failed to fetch data';
        notifyListeners();
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      _errorMessage = 'Failed to fetch data';
      notifyListeners();
      rethrow;
    }
  }

  Future<Person> getSinglePerson(String personId) async {
    if (_token == null) {
      _errorMessage = 'Not authenticated';
      notifyListeners();
      throw Exception('Not authenticated');
    }

    try {
      final response = await _authService.getSinglePerson(_token!,personId);
      if (response.success) {
        return response.data;
      } else {
        _errorMessage = 'Failed to fetch data';
        notifyListeners();
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      _errorMessage = 'Failed to fetch data';
      notifyListeners();
      rethrow;
    }
  }

  Future<List<PaymentHistory>> getPaymentHistory() async {
    if (_token == null) {
      _errorMessage = 'Not authenticated';
      notifyListeners();
      throw Exception('Not authenticated');
    }

    try {
      final response = await _authService.fetchPaymentHistory(_token!);
      if (response.success) {
        return response.data;
      } else {
        _errorMessage = 'Failed to fetch data';
        notifyListeners();
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      _errorMessage = 'Failed to fetch data';
      notifyListeners();
      rethrow;
    }
  }

  Future<List<OrderForDashboard>> getOrdersForDashboard() async {
    try {
      final response = await _authService.fetchOrdersForDashboard(_token!);
      if(response.success){
        return response.data;
      }
      else {
        _errorMessage = 'Failed to fetch data';
        notifyListeners();
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      _errorMessage = 'Failed to fetch data';
      notifyListeners();
      rethrow;
    }
  }

  Future<void> updateOrdersForDashboard() async {
    try {
      final orders = await getOrdersForDashboard();
      _ordersForDashboard = orders;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<List<PaymentHistory>> getPaymentHistoryForPerson(String personId) async {
    if (_token == null) {
      _errorMessage = 'Not authenticated';
      notifyListeners();
      throw Exception('Not authenticated');
    }
    try {
      final response = await _authService.fetchPaymentHistoryForPerson(personId,_token!);
      if (response.success) {
        return response.data;
      } else {
        _errorMessage = 'Failed to fetch data';
        notifyListeners();
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      _errorMessage = 'Failed to fetch data';
      notifyListeners();
      rethrow;
    }
  }

  Future<bool> addPerson(String name, String phoneNumber) async {
    try {
      return await _authService.addPerson(name, phoneNumber,_token!);
    } catch (error) {
      _errorMessage = 'Failed to add person';
      notifyListeners();
      rethrow;
    }
  }

  Future<bool> updateUserName(String name) async {
    try {
      return await _authService.updateName(name,_token!);
    }
    catch(error) {
      _errorMessage = 'Failed to update Name';
      notifyListeners();
      rethrow;
    }
  }

  Future<bool> uploadDocuments(List<File> documents, String personId) async {
    if (_token == null) {
      _errorMessage = 'Not authenticated';
      notifyListeners();
      throw Exception('Not authenticated');
    }

    try {
      await _authService.uploadDocuments(documents, personId, _token!);
      return true;
    } catch (error) {
      _errorMessage = 'Failed to upload documents';
      notifyListeners();
      rethrow;
    }
  }

  void logout() {
    _token = null;
    _isLoggedIn = false;
    storage.delete(key: 'token');  // Delete token securely
    notifyListeners();
  }
}
