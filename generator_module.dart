import 'dart:io';

import 'generator_helper.dart';

class GeneratorModuleData {
  static String getImportCurPackage() {
    var package = Directory.current;
    String namePackage = (package.path).split('/').last;
    return "import 'package:$namePackage";
  }

  // DOMAIN
  static String entity({required String nameFeature}) {
    return """
import 'package:freezed_annotation/freezed_annotation.dart';

part '${DataConverter.camelCaseToSnakeCase(nameFeature)}.freezed.dart';

@freezed
class ${nameFeature} with _\$${nameFeature} {
  const factory ${nameFeature}({
    required String id,
    String? name,
  }) = _${nameFeature};
}
""";
  }

  static String repositoryInterface({required String nameFeature}) {
    return """
import 'package:dartz/dartz.dart';
import '../../entities/${DataConverter.camelCaseToSnakeCase(nameFeature)}.dart';

abstract class ${nameFeature}Repository {
  Future<Either<String, List<${nameFeature}>>> getAll();
  Future<Either<String, ${nameFeature}>> getById(String id);
  Future<Either<String, ${nameFeature}>> create(${nameFeature} item);
  Future<Either<String, ${nameFeature}>> update(${nameFeature} item);
  Future<Either<String, void>> delete(String id);
}
""";
  }

  // USECASES
  static String usecaseGetAll({required String nameFeature}) {
    return """
import 'package:dartz/dartz.dart';
import '../repositories/${DataConverter.camelCaseToSnakeCase(nameFeature)}_repository.dart';
import '../entities/${DataConverter.camelCaseToSnakeCase(nameFeature)}.dart';

class GetAll${nameFeature} {
  final ${nameFeature}Repository repository;
  GetAll${nameFeature}(this.repository);
  Future<Either<String, List<${nameFeature}>>> call() => repository.getAll();
}
""";
  }

  static String usecaseCreate({required String nameFeature}) {
    return """
import 'package:dartz/dartz.dart';
import '../repositories/${DataConverter.camelCaseToSnakeCase(nameFeature)}_repository.dart';
import '../entities/${DataConverter.camelCaseToSnakeCase(nameFeature)}.dart';

class Create${nameFeature} {
  final ${nameFeature}Repository repository;
  Create${nameFeature}(this.repository);
  Future<Either<String, ${nameFeature}>> call(${nameFeature} item) => repository.create(item);
}
""";
  }

  static String usecaseUpdate({required String nameFeature}) {
    return """
import 'package:dartz/dartz.dart';
import '../repositories/${DataConverter.camelCaseToSnakeCase(nameFeature)}_repository.dart';
import '../entities/${DataConverter.camelCaseToSnakeCase(nameFeature)}.dart';

class Update${nameFeature} {
  final ${nameFeature}Repository repository;
  Update${nameFeature}(this.repository);
  Future<Either<String, ${nameFeature}>> call(${nameFeature} item) => repository.update(item);
}
""";
  }

  static String usecaseDelete({required String nameFeature}) {
    return """
import 'package:dartz/dartz.dart';
import '../repositories/${DataConverter.camelCaseToSnakeCase(nameFeature)}_repository.dart';

class Delete${nameFeature} {
  final ${nameFeature}Repository repository;
  Delete${nameFeature}(this.repository);
  Future<Either<String, void>> call(String id) => repository.delete(id);
}
""";
  }

  // DATA
  static String dataSource({required String nameFeature}) {
    return """
import '../../domain/entities/${DataConverter.camelCaseToSnakeCase(nameFeature)}.dart';

class ${nameFeature}DataSource {
  Future<List<${nameFeature}>> getAll() async => [];
  Future<${nameFeature}?> getById(String id) async => null;
  Future<void> create(${nameFeature} item) async {}
  Future<void> update(${nameFeature} item) async {}
  Future<void> delete(String id) async {}
}
""";
  }

  static String repositoryImpl({required String nameFeature}) {
    final snake = DataConverter.camelCaseToSnakeCase(nameFeature);
    return """
import 'package:dartz/dartz.dart';
import '../../domain/entities/${snake}.dart';
import '../../domain/repositories/${snake}_repository.dart';
import '../datasources/${snake}_data_source.dart';

class ${nameFeature}RepositoryImpl implements ${nameFeature}Repository {
  final ${nameFeature}DataSource dataSource;
  ${nameFeature}RepositoryImpl(this.dataSource);

  @override
  Future<Either<String, ${nameFeature}>> create(${nameFeature} item) async {
    try {
      await dataSource.create(item);
      return Right(item);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> delete(String id) async {
    try {
      await dataSource.delete(id);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<${nameFeature}>>> getAll() async {
    try {
      final items = await dataSource.getAll();
      return Right(items);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ${nameFeature}>> getById(String id) async {
    try {
      final item = await dataSource.getById(id);
      if (item == null) return const Left('Not found');
      return Right(item);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ${nameFeature}>> update(${nameFeature} item) async {
    try {
      await dataSource.update(item);
      return Right(item);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
""";
  }

  // PRESENTATION - BLoC
  static String blocEvent({required String nameFeature}) {
    final snake = DataConverter.camelCaseToSnakeCase(nameFeature);
    return """
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/${snake}.dart';

part '${snake}_event.freezed.dart';

@freezed
sealed class ${nameFeature}Event with _\$${nameFeature}Event {
  const factory ${nameFeature}Event.started() = ${nameFeature}Started;
  const factory ${nameFeature}Event.create(${nameFeature} item) = ${nameFeature}Create;
  const factory ${nameFeature}Event.update(${nameFeature} item) = ${nameFeature}Update;
  const factory ${nameFeature}Event.delete(String id) = ${nameFeature}Delete;
}
""";
  }

  static String blocState({required String nameFeature}) {
    final snake = DataConverter.camelCaseToSnakeCase(nameFeature);
    return """
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/${snake}.dart';

part '${snake}_state.freezed.dart';

@freezed
sealed class ${nameFeature}State with _\$${nameFeature}State {
  const factory ${nameFeature}State.initial() = ${nameFeature}Initial;
  const factory ${nameFeature}State.loading() = ${nameFeature}Loading;
  const factory ${nameFeature}State.loaded(List<${nameFeature}> items) = ${nameFeature}Loaded;
  const factory ${nameFeature}State.error(String message) = ${nameFeature}Error;
  const factory ${nameFeature}State.success(String message) = ${nameFeature}Success;
}
""";
  }

  static String bloc({required String nameFeature}) {
    final snake = DataConverter.camelCaseToSnakeCase(nameFeature);
    return """
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../domain/usecases/get_all_${snake}.dart';
import '../../domain/usecases/create_${snake}.dart';
import '../../domain/usecases/update_${snake}.dart';
import '../../domain/usecases/delete_${snake}.dart';
import '${snake}_event.dart';
import '${snake}_state.dart';

class ${nameFeature}Bloc extends Bloc<${nameFeature}Event, ${nameFeature}State> {
  final GetAll${nameFeature} getAll${nameFeature};
  final Create${nameFeature} create${nameFeature};
  final Update${nameFeature} update${nameFeature};
  final Delete${nameFeature} delete${nameFeature};

  ${nameFeature}Bloc({
    required this.getAll${nameFeature},
    required this.create${nameFeature},
    required this.update${nameFeature},
    required this.delete${nameFeature},
  }) : super(const ${nameFeature}State.initial()) {
    on<${nameFeature}Started>((event, emit) async {
      emit(const ${nameFeature}State.loading());
      final result = await getAll${nameFeature}();
      result.fold(
        (failure) => emit(${nameFeature}State.error(failure)),
        (items) => emit(${nameFeature}State.loaded(items)),
      );
    });

    on<${nameFeature}Create>((event, emit) async {
      emit(const ${nameFeature}State.loading());
      final result = await create${nameFeature}(event.item);
      result.fold(
        (failure) => emit(${nameFeature}State.error(failure)),
        (_) async {
          final refreshed = await getAll${nameFeature}();
          refreshed.fold(
            (f) => emit(${nameFeature}State.error(f)),
            (items) => emit(${nameFeature}State.loaded(items)),
          );
        },
      );
    });

    on<${nameFeature}Update>((event, emit) async {
      emit(const ${nameFeature}State.loading());
      final result = await update${nameFeature}(event.item);
      result.fold(
        (failure) => emit(${nameFeature}State.error(failure)),
        (_) async {
          final refreshed = await getAll${nameFeature}();
          refreshed.fold(
            (f) => emit(${nameFeature}State.error(f)),
            (items) => emit(${nameFeature}State.loaded(items)),
          );
        },
      );
    });

    on<${nameFeature}Delete>((event, emit) async {
      emit(const ${nameFeature}State.loading());
      final result = await delete${nameFeature}(event.id);
      result.fold(
        (failure) => emit(${nameFeature}State.error(failure)),
        (_) async {
          final refreshed = await getAll${nameFeature}();
          refreshed.fold(
            (f) => emit(${nameFeature}State.error(f)),
            (items) => emit(${nameFeature}State.loaded(items)),
          );
        },
      );
    });
  }
}
""";
  }

  static String screen({required String nameFeature}) {
    final snake = DataConverter.camelCaseToSnakeCase(nameFeature);
    final importBloc =
        "${getImportCurPackage()}/lib/features/${snake}/presentation/bloc/${snake}_bloc.dart"
            .replaceAll('/lib/', '/');
    final importState =
        "${getImportCurPackage()}/lib/features/${snake}/presentation/bloc/${snake}_state.dart"
            .replaceAll('/lib/', '/');
    return """
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
$importBloc';
$importState';

class ${nameFeature}Screen extends StatelessWidget {
  const ${nameFeature}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('${nameFeature}')),
      body: BlocBuilder<${nameFeature}Bloc, ${nameFeature}State>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Initial')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (items) => ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => ListTile(title: Text(items[index].toString())),
            ),
            error: (message) => Center(child: Text(message)),
            success: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}
""";
  }
}
