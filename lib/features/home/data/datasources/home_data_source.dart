import '../../domain/entities/home.dart';

class HomeDataSource {
  Future<List<Home>> getAll() async => [];
  Future<Home?> getById(String id) async => null;
  Future<void> create(Home item) async {}
  Future<void> update(Home item) async {}
  Future<void> delete(String id) async {}
}
