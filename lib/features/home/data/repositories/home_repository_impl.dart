import 'package:dartz/dartz.dart';
import '../../domain/entities/home.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;
  HomeRepositoryImpl(this.dataSource);

  @override
  Future<Either<String, Home>> create(Home item) async {
    try {
      await dataSource.create(item);
      return Right(item);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> delete(String id) async {
    try {
      await dataSource.delete(id);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Home>>> getAll() async {
    try {
      final items = await dataSource.getAll();
      return Right(items);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Home>> getById(String id) async {
    try {
      final item = await dataSource.getById(id);
      if (item == null) return const Left('Not found');
      return Right(item);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Home>> update(Home item) async {
    try {
      await dataSource.update(item);
      return Right(item);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
