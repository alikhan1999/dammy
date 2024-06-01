import 'package:dartz/dartz.dart';
import 'package:mukabbir/application/core/failure/failure.dart';
import 'package:mukabbir/application/network/error_handler/error_handler.dart';
import 'package:mukabbir/data/models/user/user_model.dart';
import 'package:mukabbir/data/models/user/user_post_data.dart';
import 'package:mukabbir/data/remote_data_source/home_page_api/i_all_product_api.dart';
import 'package:mukabbir/domain/entities/post_entity.dart';
import 'package:mukabbir/domain/interfaces/homepage/user_repo.dart';

class AuthRepo implements IUserRepo {
  AuthRepo({required this.api});
  IAuthApi api;

  @override
  Future<Either<Failure, UserModel>> getUserDetails() async {
    try {
      final result = await api.fetchUser();
      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }
  }

  @override
  Future<Either<Failure, UserPostModel>> getPostData(PostEntity params) async {
    try {
      final result = await api.fetchPost(params);
      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }
  }
}
