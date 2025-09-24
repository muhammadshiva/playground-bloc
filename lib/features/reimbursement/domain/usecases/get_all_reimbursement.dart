import 'package:dartz/dartz.dart';
import '../repositories/reimbursement_repository.dart';
import '../entities/reimbursement.dart';

class GetAllReimbursement {
  final ReimbursementRepository repository;
  GetAllReimbursement(this.repository);
  Future<Either<String, List<Reimbursement>>> call() => repository.getAll();
}
