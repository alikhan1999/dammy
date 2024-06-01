import 'package:mukabbir/application/network/external_values/iExternalValue.dart';

class ExternalValues implements IExternalValues {
  @override
  String getBaseUrlV1() {
    return 'https://jsonplaceholder.typicode.com/';
  }

  @override
  String countriesBaseUrl() {
    return "https://countriesnow.space";
  }

  @override
  String getBaseUrl() {
    return 'https://jsonplaceholder.typicode.com/';
  }
}
