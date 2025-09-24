import 'package:dartz/dartz.dart';
import '../repositories/reimbursement_repository.dart';
import '../entities/reimbursement.dart';

class CreateReimbursement {
  final ReimbursementRepository repository;
  CreateReimbursement(this.repository);
  Future<Either<String, Reimbursement>> call(Reimbursement item) => repository.create(item);
}
