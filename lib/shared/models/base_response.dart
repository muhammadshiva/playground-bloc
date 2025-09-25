import 'package:flutter/foundation.dart';
import 'package:playground_bloc/features/reimbursement/presentation/utils/functions/dio_error_converter.dart';
import 'package:venturo_api_manager/venturo_api_manager.dart';

@immutable
class BaseResponseV2<T> {
  final T? data;
  final String? message;
  final String? status;
  final int? code;
  final int? statusCode;
  final Map<String, dynamic>? errors;
  final Map<String, dynamic>? meta;

  const BaseResponseV2({
    this.data,
    this.message,
    this.status,
    this.code,
    this.statusCode,
    this.errors,
    this.meta,
  });

  /// Factory constructor untuk parsing dari JSON response
  /// Mendukung baik Object? maupun Map<String, dynamic> berdasarkan function signature
  factory BaseResponseV2.fromJson(Map<String, dynamic> json) {
    return BaseResponseV2<T>(
      data: json['data'],
      message: json['message'] as String?,
      status: _parseStatus(json['status']) ?? _parseStatus(json['success']),
      code: json['code'] as int?,
      statusCode: json['status_code'] as int? ?? json['statusCode'] as int?,
      errors: json['errors'] as Map<String, dynamic>?,
      meta: json['meta'] as Map<String, dynamic>?,
    );
  }

  /// Factory constructor untuk handling DioError
  ///
  /// Parameters:
  /// - [error]: DioException yang akan dihandle
  /// - [useCustomConverter]: Jika true, akan menggunakan DioErrorConverter untuk mendapatkan
  ///   error message yang user-friendly. Jika false, akan menggunakan message dari BE langsung.
  /// - [errorDictionary]: Dictionary untuk mapping error message dari BE ke message yang
  ///   ingin ditampilkan ke user (hanya berlaku jika useCustomConverter = true)
  ///
  /// Contoh penggunaan:
  /// ```dart
  /// // Menggunakan message dari BE langsung
  /// BaseResponseV2.fromDioError(dioError);
  ///
  /// // Menggunakan DioErrorConverter dengan dictionary custom
  /// BaseResponseV2.fromDioError(
  ///   dioError,
  ///   useCustomConverter: true,
  ///   errorDictionary: {
  ///     'invalid pin validation!': 'Pin yang anda masukkan salah',
  ///   }
  /// );
  ///
  /// // Menggunakan DioErrorConverter dengan GlobalErrorDictionary
  /// BaseResponseV2.fromDioError(dioError, useCustomConverter: true);
  /// ```
  factory BaseResponseV2.fromDioError(
    DioException error, {
    bool useCustomConverter = false,
    Map<String, String> errorDictionary = const {},
  }) {
    String? errorMessage;
    int? statusCode;
    Map<String, dynamic>? errors;

    // Ambil status code dari response
    statusCode = error.response?.statusCode;

    if (useCustomConverter) {
      // Gunakan DioErrorConverter untuk mendapatkan error message yang user-friendly
      String? sourceMessageError;

      // Ambil source message error dari response body
      if (error.response?.data != null) {
        final responseData = error.response!.data;

        if (responseData is Map<String, dynamic>) {
          sourceMessageError =
              responseData['message'] as String? ??
              responseData['error'] as String? ??
              responseData['detail'] as String?;
          errors = responseData['errors'] as Map<String, dynamic>?;
        } else if (responseData is String) {
          sourceMessageError = responseData;
        }
      }

      // Gunakan DioErrorConverter untuk mendapatkan error message
      errorMessage = DioErrorConverter.fromDioError(
        error,
        sourceMessageError: sourceMessageError,
        errorDictionary: errorDictionary,
      );
    } else {
      // Gunakan message dari BE langsung
      if (error.response?.data != null) {
        final responseData = error.response!.data;

        if (responseData is Map<String, dynamic>) {
          errorMessage =
              responseData['message'] as String? ??
              responseData['error'] as String? ??
              responseData['detail'] as String?;
          errors = responseData['errors'] as Map<String, dynamic>?;
        } else if (responseData is String) {
          errorMessage = responseData;
        }
      }

      // Fallback ke error message atau status message
      errorMessage ??=
          error.message ??
          error.response?.statusMessage ??
          'Terjadi kesalahan yang tidak diketahui';
    }

    return BaseResponseV2<T>(
      data: null,
      message: errorMessage,
      status: null,
      code: statusCode,
      statusCode: statusCode,
      errors: errors,
      meta: null,
    );
  }

  /// Factory constructor untuk handling DioError dengan DioErrorConverter
  /// Shorthand untuk BaseResponseV2.fromDioError(error, useCustomConverter: true)
  factory BaseResponseV2.fromDioErrorWithConverter(
    DioException error, {
    Map<String, String> errorDictionary = const {},
  }) {
    return BaseResponseV2.fromDioError(
      error,
      useCustomConverter: true,
      errorDictionary: errorDictionary,
    );
  }

  /// Factory constructor untuk handling error dari string
  factory BaseResponseV2.fromString(String error) {
    return BaseResponseV2<T>(
      data: null,
      message: error.isNotEmpty ? error : 'Terjadi kesalahan yang tidak diketahui',
      status: null,
      code: null,
      statusCode: null,
      errors: null,
      meta: null,
    );
  }

  /// Factory constructor untuk handling error dari unknown
  factory BaseResponseV2.fromUnknownError(Object error) {
    return BaseResponseV2<T>(
      data: null,
      message: DioErrorConverter.handleStatusCode(0),
      status: null,
      code: null,
      statusCode: null,
      errors: null,
      meta: null,
    );
  }

  /// Factory constructor untuk success response tanpa data
  factory BaseResponseV2.success({T? data, String? message, int? code, int? statusCode}) {
    return BaseResponseV2<T>(
      data: data,
      message: message ?? 'Berhasil',
      status: 'success',
      code: code ?? 200,
      statusCode: statusCode ?? 200,
      errors: null,
      meta: null,
    );
  }

  /// Factory constructor untuk error response
  factory BaseResponseV2.error({
    String? message,
    int? code,
    int? statusCode,
    Map<String, dynamic>? errors,
  }) {
    return BaseResponseV2<T>(
      data: null,
      message: message ?? 'Terjadi kesalahan',
      status: 'error',
      code: code,
      statusCode: statusCode,
      errors: errors,
      meta: null,
    );
  }

  /// Method untuk serialize ke JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'message': message,
      'status': status,
      'code': code,
      'status_code': statusCode,
      if (errors != null) 'errors': errors,
      if (meta != null) 'meta': meta,
    };
  }

  /// Getter untuk mengecek apakah response berhasil
  bool get isSuccess {
    if (status == null) return false;
    return status == 'success' || status == 'true' || status == '1';
  }

  /// Getter untuk mengecek apakah response gagal
  bool get isError {
    if (status == null) return true;
    return status == 'error' || status == 'false' || status == '0';
  }

  /// Getter untuk mendapatkan error message yang user-friendly
  String get errorMessage {
    if (message?.isNotEmpty == true) {
      return message!;
    }

    if (errors?.isNotEmpty == true) {
      // Ambil error pertama dari validation errors
      final firstError = errors!.values.first;
      if (firstError is List && firstError.isNotEmpty) {
        return firstError.first.toString();
      } else if (firstError is String) {
        return firstError;
      }
    }

    return 'Terjadi kesalahan yang tidak diketahui';
  }

  /// Copy with method untuk immutability
  BaseResponseV2<T> copyWith({
    T? data,
    String? message,
    String? status,
    int? code,
    int? statusCode,
    Map<String, dynamic>? errors,
    Map<String, dynamic>? meta,
  }) {
    return BaseResponseV2<T>(
      data: data ?? this.data,
      message: message ?? this.message,
      status: status ?? this.status,
      code: code ?? this.code,
      statusCode: statusCode ?? this.statusCode,
      errors: errors ?? this.errors,
      meta: meta ?? this.meta,
    );
  }

  @override
  String toString() {
    return 'BaseResponseV2<$T>(data: $data, message: $message, status: $status, code: $code, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseResponseV2<T> &&
        other.data == data &&
        other.message == message &&
        other.status == status &&
        other.code == code &&
        other.statusCode == statusCode &&
        mapEquals(other.errors, errors) &&
        mapEquals(other.meta, meta);
  }

  @override
  int get hashCode {
    return Object.hash(data, message, status, code, statusCode, errors, meta);
  }

  /// Helper method untuk parsing status yang bisa berupa String atau int
  /// Mengkonversi ke String untuk konsistensi
  static String? _parseStatus(dynamic value) {
    if (value == null) return null;

    if (value is String) {
      return value;
    } else if (value is int) {
      // Konversi int ke string dengan mapping umum
      switch (value) {
        case 1:
          return 'success';
        case 0:
          return 'error';
        case 200:
          return 'success';
        case 201:
          return 'success';
        default:
          return value.toString();
      }
    } else if (value is bool) {
      // Handle boolean values
      return value ? 'success' : 'error';
    }

    // Fallback untuk tipe lain
    return value.toString();
  }
}
