import 'package:dio/dio.dart';
import 'package:mukabbir/application/core/exception/exception.dart';
import 'package:mukabbir/application/network/error_handler/error_handler.dart';
import 'package:mukabbir/application/network/remote_client/iApService.dart';
import 'package:mukabbir/data/models/user/user_model.dart';
import 'package:mukabbir/data/models/user/user_post_data.dart';
import 'package:mukabbir/data/remote_data_source/home_page_api/i_all_product_api.dart';
import 'package:mukabbir/domain/entities/post_entity.dart';

class AuthApi implements IAuthApi {
  AuthApi(IApiService api) {
    api.setIsTokenRequired(true);
    _dio = api.get();
  }

  @override
  Future<UserModel> fetchUser() async {
    try {
      final res = await _dio.get('users');
      return UserModel.fromJson(res.data);
    } on DioError catch (e) {
      final exception = getException(e);
      throw exception;
    } catch (e) {
      throw ResponseException(msg: e.toString());
    }
  }

  @override
  Future<UserPostModel> fetchPost(PostEntity params) async {
    try {
      final res = await _dio.get('posts?userId=${params.email}');
      return UserPostModel.fromJson(res.data);
    } on DioError catch (e) {
      final exception = getException(e);
      throw exception;
    } catch (e) {
      throw ResponseException(msg: e.toString());
    }
  }

  late Dio _dio;
}
