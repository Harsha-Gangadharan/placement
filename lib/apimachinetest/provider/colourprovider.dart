import 'package:flutter/material.dart';
import 'package:placement/apimachinetest/services/apiservice.dart';

class ColorProvider extends ChangeNotifier {
  List<dynamic> _colors = [];
  bool _isLoading = false;

  List<dynamic> get colors => _colors;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();

  Future<void> fetchColors() async {
    _isLoading = true;
    notifyListeners(); // Notify listeners that loading has started

    try {
      _colors = await _apiService.fetchColors();
    } catch (e) {
      _colors = [];
      debugPrint('Failed to load colors: $e');
    }

    _isLoading = false;
    notifyListeners(); // Notify listeners that loading has ended
  }
}
