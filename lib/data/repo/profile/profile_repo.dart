// class ProfileRepo implements IProfileRepo {
//   ProfileRepo({required this.api});
//   IProfileApi api;
//
//   @override
//   Future<Either<Failure, ProfileModel>> uploadPicProfile(FormData map) async {
//     try {
//       final result = await api.uploadPicProfile(map);
//       return Right(result);
//     } catch (error) {
//       return Left(getFailure(error as Exception));
//     }
//   }
// }
