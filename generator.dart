import 'dart:io';

import 'generator_helper.dart';
import 'generator_module.dart';

String rootPath = "lib/";
String modulesPath = "${rootPath}features/";

void main(List arguments) {
  print(
    '\n----------------------Choose--------------------------\n'
    '0. Membuat Fitur (BLoC)\n'
    '------------------------------------------------------\n',
  );

  print('Masukkan Index : ');
  String resInput = InputUser.input();
  if (['0'].contains(resInput) == false) {
    print('Index yang kamu inputkan salah!');
    return;
  }

  switch (resInput) {
    case '0':
      Generate.createFeature();
      break;
    default:
  }

  return;
}

class Generate {
  static void createFeature() async {
    print('Inputkan Nama Fitur : (Format UpperCamelCase Contoh: Todo, User)');
    String? featureName = stdin.readLineSync();
    if (featureName == null || featureName.isEmpty) {
      print('Nama Fitur tidak boleh kosong!');
      return;
    }

    String snake = DataConverter.camelCaseToSnakeCase(featureName);

    // FEATURE-LOCAL STRUCTURE
    String featureRoot = '${modulesPath}${snake}/';

    // DOMAIN
    String domainEntities = '${featureRoot}domain/entities/';
    String domainRepositories = '${featureRoot}domain/repositories/';
    String domainUsecases = '${featureRoot}domain/usecases/';

    await file(
      name: '${domainEntities}${snake}.dart',
      content: GeneratorModuleData.entity(nameFeature: featureName),
    );
    await file(
      name: '${domainRepositories}${snake}_repository.dart',
      content: GeneratorModuleData.repositoryInterface(nameFeature: featureName),
    );
    await file(
      name: '${domainUsecases}get_all_${snake}.dart',
      content: GeneratorModuleData.usecaseGetAll(nameFeature: featureName),
    );
    await file(
      name: '${domainUsecases}create_${snake}.dart',
      content: GeneratorModuleData.usecaseCreate(nameFeature: featureName),
    );
    await file(
      name: '${domainUsecases}update_${snake}.dart',
      content: GeneratorModuleData.usecaseUpdate(nameFeature: featureName),
    );
    await file(
      name: '${domainUsecases}delete_${snake}.dart',
      content: GeneratorModuleData.usecaseDelete(nameFeature: featureName),
    );

    // DATA
    String dataDatasources = '${featureRoot}data/datasources/';
    String dataRepositories = '${featureRoot}data/repositories/';

    await file(
      name: '${dataDatasources}${snake}_data_source.dart',
      content: GeneratorModuleData.dataSource(nameFeature: featureName),
    );
    await file(
      name: '${dataRepositories}${snake}_repository_impl.dart',
      content: GeneratorModuleData.repositoryImpl(nameFeature: featureName),
    );

    // PRESENTATION (BLoC)
    String presentationBloc = '${featureRoot}presentation/bloc/';
    String presentationScreens = '${featureRoot}presentation/screens/';

    await file(
      name: '${presentationBloc}${snake}_event.dart',
      content: GeneratorModuleData.blocEvent(nameFeature: featureName),
    );
    await file(
      name: '${presentationBloc}${snake}_state.dart',
      content: GeneratorModuleData.blocState(nameFeature: featureName),
    );
    await file(
      name: '${presentationBloc}${snake}_bloc.dart',
      content: GeneratorModuleData.bloc(nameFeature: featureName),
    );
    await file(
      name: '${presentationScreens}${snake}_screen.dart',
      content: GeneratorModuleData.screen(nameFeature: featureName),
    );

    print(
      'Feature ${featureName} berhasil dibuat (BLoC) di folder lib/features/${snake}. Tambahkan registrasi DI di lib/core/di/injection_container.dart',
    );
  }

  static Future<Directory> folder(String name) async {
    return await Directory(name).create(recursive: true);
  }

  static Future<void> file({required String name, String content = ''}) async {
    var temp = File(name);
    temp.createSync(recursive: true);
    if (content.isEmpty) return;
    temp.writeAsStringSync(content);
  }
}

class InputUser {
  static String input() {
    String? result = stdin.readLineSync();
    if (result == null || result.isEmpty) {
      print('Inputan Tidak Boleh Kosong');
    }
    return result ?? '';
  }
}
