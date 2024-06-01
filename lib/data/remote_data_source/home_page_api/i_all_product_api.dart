import 'package:mukabbir/data/models/user/user_model.dart';
import 'package:mukabbir/data/models/user/user_post_data.dart';
import 'package:mukabbir/domain/entities/post_entity.dart';

abstract class IAuthApi {
  Future<UserModel> fetchUser();
  Future<UserPostModel> fetchPost(PostEntity params);
}
