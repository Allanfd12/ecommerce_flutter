abstract class FailureCategory implements Exception {
  final String? message;

  FailureCategory(this.message);
}

class DatasourceError implements FailureCategory {
  @override
  String? message;

  DatasourceError({this.message});
}
