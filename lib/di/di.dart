import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:mukabbir/application/network/external_values/ExternalValues.dart';
import 'package:mukabbir/application/network/external_values/iExternalValue.dart';
import 'package:mukabbir/application/network/remote_client/api_service.dart';
import 'package:mukabbir/application/network/remote_client/iApService.dart';
import 'package:mukabbir/constant/constants.dart';
import 'package:mukabbir/data/local_data_source/db/db.dart';
import 'package:mukabbir/data/local_data_source/db/i_db.dart';
import 'package:mukabbir/data/local_data_source/jwt/jwt_local_access_token.dart';
import 'package:mukabbir/data/local_data_source/preference/i_pref_helper.dart';
import 'package:mukabbir/data/local_data_source/preference/pref_helper.dart';
import 'package:mukabbir/data/remote_data_source/home_page_api/all_product_api.dart';
import 'package:mukabbir/data/remote_data_source/home_page_api/i_all_product_api.dart';
import 'package:mukabbir/data/remote_data_source/jwt_remote_access_token.dart';
import 'package:mukabbir/data/repo/homepage/allproduct.dart';
import 'package:mukabbir/data/repo/jwt_access_repo.dart';
import 'package:mukabbir/domain/interfaces/homepage/user_repo.dart';
import 'package:mukabbir/services/cache_manager_service/cache_manager_service.dart';
import 'package:mukabbir/services/cache_manager_service/i_cache_manager_service.dart';
import 'package:mukabbir/services/navService/i_navigation_service.dart';
import 'package:mukabbir/services/navService/nav_service.dart';
import 'package:mukabbir/ui/utils/overlay_helper.dart';
import 'package:mukabbir/ui/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

final inject = GetIt.instance;

Future<void> setupLocator() async {
  inject.registerSingletonAsync(() => SharedPreferences.getInstance());
  inject.registerLazySingleton<IDb>(() => Db());
  // inject.registerLazySingleton<FlutterTts>(() => FlutterTts());
  // inject.registerLazySingleton<ITTSService>(() => TTSService(inject()));
  inject.registerLazySingleton<JwtLocalAccessToken>(() => JwtLocalAccessToken());
  inject.registerLazySingleton<JwtRemoteAccessToken>(() => JwtRemoteAccessToken(externalValues: ExternalValues()));
  inject.registerLazySingleton<JwtAccessRepo>(() => JwtAccessRepo(jwtLocalAccessToken: inject(), jwtRemoteAccessToken: inject()));
  inject.registerLazySingleton<IApiService>(() => ApiService.create(
        externalValues: ExternalValues(),
        jwtAccessRepo: inject(),
      ));
  inject.registerLazySingleton<IExternalValues>(() => ExternalValues());

  inject.registerLazySingleton<IAuthApi>(() => AuthApi(inject()));
  inject.registerLazySingleton<IUserRepo>(() => AuthRepo(api: inject()));

  // inject.registerLazySingleton<IProfileApi>(() => ProfileApi(inject()));
  // inject.registerLazySingleton<IProfileRepo>(() => ProfileRepo(api: inject()));

  inject.registerLazySingleton<Px>(() => Px());
  inject.registerLazySingleton<Utils>(() => Utils());
  inject.registerLazySingleton<INavigationService>(() => NavigationService());
  inject.registerLazySingleton<ICacheManagerService>(() => CacheManagerService(DefaultCacheManager()));
  inject.registerLazySingleton<IPrefHelper>(() => PrefHelper(inject()));

  if (Platform.isIOS) {
    inject.registerLazySingleton<OverlayEntryHelper>(() => OverlayEntryHelper());
  }
}
