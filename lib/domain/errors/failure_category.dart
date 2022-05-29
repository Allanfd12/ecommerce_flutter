abstract class FailureCategory implements Exception {}

class DatasourceError implements FailureCategory {
  final String? menssage;

  DatasourceError({this.menssage});
}
