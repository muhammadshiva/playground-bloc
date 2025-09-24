import 'package:dartz/dartz.dart';
import '../repositories/reimbursement_repository.dart';
import '../entities/reimbursement.dart';

class UpdateReimbursement {
  final ReimbursementRepository repository;
  UpdateReimbursement(this.repository);
  Future<Either<String, Reimbursement>> call(Reimbursement item) => repository.update(item);
}
