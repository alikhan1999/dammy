import 'package:flutter/material.dart';
import 'package:mukabbir/constant/style.dart';
import 'package:mukabbir/data/models/user/user_post_data.dart';
import 'package:mukabbir/ui/base/base_widget.dart';
import 'package:mukabbir/widgets/app_bar.dart';
import 'package:mukabbir/widgets/base_scaffold.dart';

class ProfileScreen extends BaseStateLessWidget {
  ProfileScreen({super.key, required this.post});
  final UserPostData post;

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWithBaseContainer(
      padding: const EdgeInsets.all(20),
      scroll: false,
      appBar: AppBarWidget(
        title: post.title ?? "Post Details",
        leading: IconButton(onPressed: () => navigator.pop(), icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 100),
          Container(
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Title: ", style: TextStyle(color: Style.whiteColor)),
                        Expanded(
                          flex: 1,
                          child: Text(
                            post.title ?? 'No Data',
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
                            post.body ?? 'No Data',
                            style: const TextStyle(color: Style.whiteColor),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 20,
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
  }
}
