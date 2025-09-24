import 'package:dartz/dartz.dart';
import '../repositories/reimbursement_repository.dart';

class DeleteReimbursement {
  final ReimbursementRepository repository;
  DeleteReimbursement(this.repository);
  Future<Either<String, void>> call(String id) => repository.delete(id);
}
