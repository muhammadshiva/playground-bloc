import 'package:dartz/dartz.dart';
import 'package:playground_bloc/features/reimbursement/domain/entities/reimbursement.dart';

abstract class ReimbursementRepository {
  Future<Either<String, List<Reimbursement>>> getAll();
  Future<Either<String, Reimbursement>> getById(String id);
  Future<Either<String, Reimbursement>> create(Reimbursement item);
  Future<Either<String, Reimbursement>> update(Reimbursement item);
  Future<Either<String, void>> delete(String id);
}
