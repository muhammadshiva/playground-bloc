import 'package:dartz/dartz.dart';
import '../repositories/home_repository.dart';
import '../entities/home.dart';

class CreateHome {
  final HomeRepository repository;
  CreateHome(this.repository);
  Future<Either<String, Home>> call(Home item) => repository.create(item);
}
