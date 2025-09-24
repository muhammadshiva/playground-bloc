import 'package:dartz/dartz.dart';
import '../repositories/home_repository.dart';
import '../entities/home.dart';

class UpdateHome {
  final HomeRepository repository;
  UpdateHome(this.repository);
  Future<Either<String, Home>> call(Home item) => repository.update(item);
}
