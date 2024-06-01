import 'package:get/get.dart';
import 'package:mukabbir/application/core/usecases/usecase.dart';
import 'package:mukabbir/application/network/error_handler/error_handler.dart';
import 'package:mukabbir/common/logger/log.dart';
import 'package:mukabbir/data/models/user/user_model.dart';
import 'package:mukabbir/data/models/user/user_post_data.dart';
import 'package:mukabbir/di/di.dart';
import 'package:mukabbir/domain/entities/post_entity.dart';
import 'package:mukabbir/domain/interfaces/homepage/user_repo.dart';
import 'package:mukabbir/domain/use_cases/home_page/all_product_usecase.dart';
import 'package:mukabbir/ui/base/base_state.dart';

class UserController extends GetxController {
  // var users = <User>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  late IUserRepo allProductRepo;
  var data = <UserDetail>[].obs;
  var postData = <UserPostData>[].obs;

  UserController() {
    allProductRepo = inject<IUserRepo>();
  }

  BaseLoadingState _loadingState = BaseLoadingState.none;

  set loadingState(BaseLoadingState value) {
    _loadingState = value;
    // setState();
  }

  BaseLoadingState get loadingState => _loadingState;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  // void fetchUsers() async {
  //   try {
  //     isLoading(true);
  //     var fetchedUsers = await ApiService().fetchUsers();
  //     users(fetchedUsers);
  //   } catch (e) {
  //     errorMessage('Failed to fetch users');
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  Future<bool> fetchUsers() async {
    loadingState = BaseLoadingState.loading;
    // setState();
    GetUserDetailUseCase getUserDetailUseCase = GetUserDetailUseCase(allProductRepo);
    final allProduct = await getUserDetailUseCase(NoParams());
    allProduct.fold((error) {
      isLoading(true);
      loadingState = BaseLoadingState.error;
      d(ErrorMessage.fromError(error));
      return false;
    }, (response) {
      // d(response);
      // data = ;
      isLoading(false);
      data(response.data ?? []);
      d(data.first.id ?? '');
      // _allProductModel = response;
      // _galleryData = response.data ?? [];
      loadingState = BaseLoadingState.succeed;
      return true;
    });
    return false;
  }

  Future<bool> getPostData(PostEntity params) async {
    loadingState = BaseLoadingState.loading;
    // setState();
    GetPostDataUseCase getUserDetailUseCase = GetPostDataUseCase(allProductRepo);
    final allProduct = await getUserDetailUseCase(params);
    allProduct.fold((error) {
      loadingState = BaseLoadingState.error;
      d(ErrorMessage.fromError(error));
      return false;
    }, (response) {
      d(response);
      postData(response.data ?? []);

      // d(data.first.id ?? '');
      // _allProductModel = response;
      // _galleryData = response.data ?? [];
      loadingState = BaseLoadingState.succeed;
      return true;
    });
    return false;
  }
}
