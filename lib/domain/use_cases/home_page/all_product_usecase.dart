import 'package:dartz/dartz.dart';
import 'package:mukabbir/application/core/failure/failure.dart';
import 'package:mukabbir/application/core/usecases/usecase.dart';
import 'package:mukabbir/data/models/user/user_model.dart';
import 'package:mukabbir/data/models/user/user_post_data.dart';
import 'package:mukabbir/domain/entities/post_entity.dart';
import 'package:mukabbir/domain/interfaces/homepage/user_repo.dart';

class GetUserDetailUseCase implements UseCase<UserModel, NoParams> {
  GetUserDetailUseCase(this.repository);
  final IUserRepo repository;

  @override
  Future<Either<Failure, UserModel>> call(NoParams params) async {
    return repository.getUserDetails();
  }
}

class GetPostDataUseCase implements UseCase<UserPostModel, PostEntity> {
  GetPostDataUseCase(this.repository);
  final IUserRepo repository;

  @override
  Future<Either<Failure, UserPostModel>> call(PostEntity params) async {
    return repository.getPostData(params);
  }
}
