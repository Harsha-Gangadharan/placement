import 'package:flutter/material.dart';
import 'package:placement/apimachinetest/services/apiservice.dart';

class UserProvider extends ChangeNotifier {
  List<dynamic> _users = [];
  bool _isLoading = false;

  List<dynamic> get users => _users;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();

  // Fetch users and manage loading state
  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners(); // Notify listeners that loading has started

    try {
      _users = await _apiService.fetchUsers(); // Call fetchUsers method from ApiService
    } catch (e) {
      _users = [];
      debugPrint('Failed to load users: $e');
    }

    _isLoading = false;
    notifyListeners(); // Notify listeners that loading has ended
  }
}
