import 'dart:developer';
import 'package:venturo_api_manager/venturo_api_manager.dart';
import '../../domain/entities/reimbursement.dart';
import '../../../../constants/common/api.dart';

class ReimbursementDataSource {
  Future<List<Reimbursement>> getAll() async {
    try {
      log('Fetching reimbursements from API', name: 'ReimbursementDataSource');

      final response = await VenturoApiManager.api.get(
        '${ApiConstant.baseUrl}${ApiConstant.reimbursement}',
      );

      log('Reimbursement API response status: ${response.statusCode}');
      log('Reimbursement API raw response: ${response.data}');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data as List<dynamic>;
        final reimbursements = responseData
            .map((json) => Reimbursement.fromJson(json as Map<String, dynamic>))
            .toList();

        log('Successfully parsed ${reimbursements.length} reimbursements');
        return reimbursements;
      } else {
        log('Failed to fetch reimbursements. Status: ${response.statusCode}');
        throw Exception('Failed to fetch reimbursements');
      }
    } on DioException catch (e) {
      log(
        'DioException while fetching reimbursements: ${e.message}',
        name: 'ReimbursementDataSource',
      );
      throw Exception(e.response?.statusMessage ?? e.message ?? "Terjadi kesalahan");
    } catch (e) {
      log('Exception while fetching reimbursements: $e', name: 'ReimbursementDataSource');
      throw Exception("Terjadi kesalahan yang tidak terduga");
    }
  }

  Future<Reimbursement?> getById(String id) async {
    try {
      log('Fetching reimbursement by ID: $id', name: 'ReimbursementDataSource');

      final response = await VenturoApiManager.api.get(
        '${ApiConstant.baseUrl}${ApiConstant.reimbursement}/$id',
      );

      log('Reimbursement API response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        final reimbursement = Reimbursement.fromJson(responseData);
        log('Successfully fetched reimbursement: ${reimbursement.id}');
        return reimbursement;
      } else {
        log('Failed to fetch reimbursement. Status: ${response.statusCode}');
        return null;
      }
    } on DioException catch (e) {
      log(
        'DioException while fetching reimbursement: ${e.message}',
        name: 'ReimbursementDataSource',
      );
      throw Exception(e.response?.statusMessage ?? e.message ?? "Terjadi kesalahan");
    } catch (e) {
      log('Exception while fetching reimbursement: $e', name: 'ReimbursementDataSource');
      throw Exception("Terjadi kesalahan yang tidak terduga");
    }
  }

  Future<Reimbursement> create(Reimbursement item) async {
    try {
      log('Creating reimbursement: ${item.id}', name: 'ReimbursementDataSource');

      final response = await VenturoApiManager.api.post(
        '${ApiConstant.baseUrl}${ApiConstant.reimbursement}',
        data: item.toJson(),
      );

      log('Create reimbursement API response status: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = response.data as Map<String, dynamic>;
        final createdReimbursement = Reimbursement.fromJson(responseData);
        log('Successfully created reimbursement: ${createdReimbursement.id}');
        return createdReimbursement;
      } else {
        log('Failed to create reimbursement. Status: ${response.statusCode}');
        throw Exception('Failed to create reimbursement');
      }
    } on DioException catch (e) {
      log(
        'DioException while creating reimbursement: ${e.message}',
        name: 'ReimbursementDataSource',
      );
      throw Exception(e.response?.statusMessage ?? e.message ?? "Terjadi kesalahan");
    } catch (e) {
      log('Exception while creating reimbursement: $e', name: 'ReimbursementDataSource');
      throw Exception("Terjadi kesalahan yang tidak terduga");
    }
  }

  Future<Reimbursement> update(Reimbursement item) async {
    try {
      log('Updating reimbursement: ${item.id}', name: 'ReimbursementDataSource');

      final response = await VenturoApiManager.api.put(
        '${ApiConstant.baseUrl}${ApiConstant.reimbursement}/${item.id}',
        data: item.toJson(),
      );

      log('Update reimbursement API response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        final updatedReimbursement = Reimbursement.fromJson(responseData);
        log('Successfully updated reimbursement: ${updatedReimbursement.id}');
        return updatedReimbursement;
      } else {
        log('Failed to update reimbursement. Status: ${response.statusCode}');
        throw Exception('Failed to update reimbursement');
      }
    } on DioException catch (e) {
      log(
        'DioException while updating reimbursement: ${e.message}',
        name: 'ReimbursementDataSource',
      );
      throw Exception(e.response?.statusMessage ?? e.message ?? "Terjadi kesalahan");
    } catch (e) {
      log('Exception while updating reimbursement: $e', name: 'ReimbursementDataSource');
      throw Exception("Terjadi kesalahan yang tidak terduga");
    }
  }

  Future<void> delete(String id) async {
    try {
      log('Deleting reimbursement: $id', name: 'ReimbursementDataSource');

      final response = await VenturoApiManager.api.delete(
        '${ApiConstant.baseUrl}${ApiConstant.reimbursement}/$id',
      );

      log('Delete reimbursement API response status: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 204) {
        log('Successfully deleted reimbursement: $id');
      } else {
        log('Failed to delete reimbursement. Status: ${response.statusCode}');
        throw Exception('Failed to delete reimbursement');
      }
    } on DioException catch (e) {
      log(
        'DioException while deleting reimbursement: ${e.message}',
        name: 'ReimbursementDataSource',
      );
      throw Exception(e.response?.statusMessage ?? e.message ?? "Terjadi kesalahan");
    } catch (e) {
      log('Exception while deleting reimbursement: $e', name: 'ReimbursementDataSource');
      throw Exception("Terjadi kesalahan yang tidak terduga");
    }
  }
}
