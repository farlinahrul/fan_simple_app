import 'package:fan_simple_app/feature/home/home_controller.dart';
import 'package:fan_simple_app/utils/helper/constant.dart';
import 'package:fan_simple_app/utils/widget/primary_button.dart';
import 'package:fan_simple_app/utils/widget/text/text_inter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInter(
                text:
                    "Home ${controller.authController.currentUser.value?.emailVerified} : ${controller.mData?.name}",
                size: 14,
                fontWeight: Weightenum.bold,
              ),
              PrimaryButton(
                title: "Logout",
                onPressed: () {
                  controller.logout();
                },
              )
            ],
          );
        },
      ),
    );
  }
}
