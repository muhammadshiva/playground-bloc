import 'package:dartz/dartz.dart';
import 'package:playground_bloc/features/home/domain/entities/home.dart';

abstract class HomeRepository {
  Future<Either<String, List<Home>>> getAll();
  Future<Either<String, Home>> getById(String id);
  Future<Either<String, Home>> create(Home item);
  Future<Either<String, Home>> update(Home item);
  Future<Either<String, void>> delete(String id);
}
