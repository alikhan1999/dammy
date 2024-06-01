import 'package:dartz/dartz.dart';
import 'package:mukabbir/application/core/failure/failure.dart';
import 'package:mukabbir/data/models/user/user_model.dart';
import 'package:mukabbir/data/models/user/user_post_data.dart';
import 'package:mukabbir/domain/entities/post_entity.dart';

abstract class IUserRepo {
  Future<Either<Failure, UserModel>> getUserDetails();
  Future<Either<Failure, UserPostModel>> getPostData(PostEntity params);
}
