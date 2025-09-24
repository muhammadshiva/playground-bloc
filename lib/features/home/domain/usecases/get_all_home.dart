import 'package:dartz/dartz.dart';
import '../repositories/home_repository.dart';
import '../entities/home.dart';

class GetAllHome {
  final HomeRepository repository;
  GetAllHome(this.repository);
  Future<Either<String, List<Home>>> call() => repository.getAll();
}
