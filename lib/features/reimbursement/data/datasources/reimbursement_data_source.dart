import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/entities/reimbursement.dart';

class ReimbursementDataSource {
  List<Reimbursement> _reimbursements = [];

  Future<List<Reimbursement>> getAll() async {
    if (_reimbursements.isEmpty) {
      await _loadReimbursementsFromJson();
    }
    return _reimbursements;
  }

  Future<Reimbursement?> getById(String id) async {
    if (_reimbursements.isEmpty) {
      await _loadReimbursementsFromJson();
    }
    try {
      return _reimbursements.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<void> create(Reimbursement item) async {
    _reimbursements.add(item);
  }

  Future<void> update(Reimbursement item) async {
    final index = _reimbursements.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      _reimbursements[index] = item;
    }
  }

  Future<void> delete(String id) async {
    print('Data source delete called for ID: $id');
    print('Items before deletion: ${_reimbursements.map((e) => e.id).toList()}');
    _reimbursements.removeWhere((item) => item.id == id);
    print('Items after deletion: ${_reimbursements.map((e) => e.id).toList()}');
    print('Remaining items count: ${_reimbursements.length}');
  }

  Future<void> _loadReimbursementsFromJson() async {
    try {
      print('Loading reimbursements from JSON...');
      final String jsonString = await rootBundle.loadString('assets/data/reimbursements.json');
      print('JSON loaded successfully, length: ${jsonString.length}');

      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> reimbursementsJson = jsonData['data']['reimbursements'] as List<dynamic>;
      print('Found ${reimbursementsJson.length} reimbursements in JSON');

      _reimbursements = reimbursementsJson
          .map((json) => Reimbursement.fromJson(json as Map<String, dynamic>))
          .toList();
      print('Successfully parsed ${_reimbursements.length} reimbursements');
    } catch (e) {
      print('Error loading reimbursements: $e');
      // Fallback to empty list if JSON loading fails
      _reimbursements = [];
    }
  }
}
