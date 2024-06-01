import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukabbir/application/main_config/routes/route_path.dart';
import 'package:mukabbir/constant/app_strings.dart';
import 'package:mukabbir/constant/style.dart';
import 'package:mukabbir/controller/post_controller.dart';
import 'package:mukabbir/domain/entities/post_entity.dart';
import 'package:mukabbir/ui/base/base_widget.dart';
import 'package:mukabbir/widgets/app_bar.dart';
import 'package:mukabbir/widgets/base_scaffold.dart';

class ChangePasswordScreen extends BaseStateLessWidget {
  final String userId;
  ChangePasswordScreen({super.key, required this.userId}) {
    final PostController postController = Get.put(PostController());
    postController.fetchPost(PostEntity(email: userId));
  }

  @override
  Widget build(BuildContext context) {
    final PostController postController = Get.find<PostController>();
    return BaseScaffoldWithBaseContainer(
      scroll: true,
      padding: const EdgeInsets.all(20),
      appBar: AppBarWidget(
        title: AppStrings.post,
        leading: IconButton(onPressed: () => navigator?.pop(), icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.blue,
          ));
        }

        if (postController.errorMessage.isNotEmpty) {
          return Center(child: Text(postController.errorMessage.value));
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              shrinkWrap: true,
              primary: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: postController.postData.length,
              itemBuilder: (context, index) {
                final user = postController.postData[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutePath.profileScreen, arguments: user);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100.0,
                        color: Colors.transparent,
                        child: Container(
                            padding: const EdgeInsets.all(18.0),
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
                                  Radius.circular(10.0),
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Title: ", style: TextStyle(color: Style.whiteColor)),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        user.title ?? 'No Data',
                                        style: const TextStyle(color: Style.whiteColor),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Body: ", style: TextStyle(color: Style.whiteColor)),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        user.body ?? 'No Data',
                                        style: const TextStyle(color: Style.whiteColor),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
            )
          ],
        );
      }),
    );
  }
}
