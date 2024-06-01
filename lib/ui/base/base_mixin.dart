import 'package:mukabbir/constant/constants.dart';
import 'package:mukabbir/di/di.dart';
import 'package:mukabbir/services/navService/i_navigation_service.dart';
import 'package:mukabbir/ui/utils/utils.dart';

import '../../data/local_data_source/preference/i_pref_helper.dart';

mixin BaseMixin {
  final INavigationService _navigator = inject<INavigationService>();
  final Px _dimens = inject<Px>();
  final Utils _utils = inject<Utils>();
  Utils get utils => _utils;
  final IPrefHelper iPrefHelper = inject<IPrefHelper>();
  INavigationService get navigator => _navigator;
  Px get dimens => _dimens;
}
