import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukabbir/application/main_config/routes/route_path.dart';
import 'package:mukabbir/constant/app_strings.dart';
import 'package:mukabbir/constant/style.dart';
import 'package:mukabbir/controller/user_controller.dart';
import 'package:mukabbir/ui/base/base_widget.dart';
import 'package:mukabbir/widgets/app_bar.dart';
import 'package:mukabbir/widgets/base_scaffold.dart';

class UserScreen extends BaseStateLessWidget {
  final UserController userController = Get.put(UserController());

  UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWithBaseContainer(
      // bodyColor: Style.bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      scroll: true,
      appBar: AppBarWidget(
        title: AppStrings.userDetail,
      ),
      body: Obx(
        () {
          if (userController.isLoading.value) {
            return const Center(child: CircularProgressIndicator(color: Colors.blue));
          }

          if (userController.errorMessage.isNotEmpty) {
            return Center(child: Text(userController.errorMessage.value));
          }

          return Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                primary: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: userController.data.length,
                itemBuilder: (context, index) {
                  final user = userController.data[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutePath.changePasswordScreen, arguments: user.id.toString());
                    },
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        Container(
                          height: 66.0,
                          color: Colors.transparent,
                          child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 24.0),
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: [
                                      Color(0xFF0E589B),
                                      Color(0xFF0287E4),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(60.0),
                                  )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 40.0),
                                        child: Text("Name: ", style: TextStyle(color: Style.whiteColor)),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(user.name ?? 'HAMOOD-UR-REHAMAN', style: const TextStyle(color: Style.whiteColor)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 40.0),
                                        child: Text("Email: ", style: TextStyle(color: Style.whiteColor)),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(user.email ?? 'HAMOOD-UR-REHAMAN', style: const TextStyle(color: Style.whiteColor)),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                        Image.asset(
                          'assets/images/circle_father_name.png',
                          width: 56,
                          height: 56,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
              )
            ],
          );
        },
      ),
    );
  }
}
