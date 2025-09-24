import 'package:dartz/dartz.dart';
import '../../domain/entities/reimbursement.dart';
import '../../domain/repositories/reimbursement_repository.dart';
import '../datasources/reimbursement_data_source.dart';

class ReimbursementRepositoryImpl implements ReimbursementRepository {
  final ReimbursementDataSource dataSource;
  ReimbursementRepositoryImpl(this.dataSource);

  @override
  Future<Either<String, Reimbursement>> create(Reimbursement item) async {
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
  Future<Either<String, List<Reimbursement>>> getAll() async {
    try {
      final items = await dataSource.getAll();
      return Right(items);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Reimbursement>> getById(String id) async {
    try {
      final item = await dataSource.getById(id);
      if (item == null) return const Left('Not found');
      return Right(item);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Reimbursement>> update(Reimbursement item) async {
    try {
      await dataSource.update(item);
      return Right(item);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
