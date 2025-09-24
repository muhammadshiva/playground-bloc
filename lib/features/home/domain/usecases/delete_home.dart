import 'package:dartz/dartz.dart';
import '../repositories/home_repository.dart';

class DeleteHome {
  final HomeRepository repository;
  DeleteHome(this.repository);
  Future<Either<String, void>> call(String id) => repository.delete(id);
}
