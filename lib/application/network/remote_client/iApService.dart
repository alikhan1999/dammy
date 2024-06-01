import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mukabbir/application/network/external_values/iExternalValue.dart';

abstract class IApiService {
  Dio get();
  void serviceGenerator(IExternalValues externalValues);
  BaseOptions getBaseOptions(IExternalValues externalValues);
  HttpClient httpClientCreate(HttpClient client);
  void setIsTokenRequired(bool value);
}
