class DataConverter {
  DataConverter._();
  static String camelCaseToSnakeCase(String value) {
    final exp = RegExp('(?<=[a-z])[A-Z]');
    String result = value.replaceAllMapped(exp, (m) => '_${m.group(0)}').toLowerCase();
    return result;
  }

  static String camelCaseToPascalCase(String value) {
    String temp = value[0].toUpperCase();
    return value.replaceRange(0, 1, temp);
  }

  static String pascalCaseToCamelCase(String value) {
    String temp = value[0].toLowerCase();

    return value.replaceRange(0, 1, temp);
  }

  static String pascalCaseToSnakeCase(String value) {
    String temp = pascalCaseToCamelCase(value);
    return camelCaseToSnakeCase(temp);
  }

  static String snakeCaseToPascalCase(String value) {
    List temp = value.split('_');
    List temp2 = [];

    for (var element in temp) {
      temp2.add(camelCaseToPascalCase(element));
    }

    return temp2.join();
  }
}
