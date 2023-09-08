import 'package:fan_simple_app/feature/home/home_controller.dart';
import 'package:fan_simple_app/resources/resources.dart';
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
          if (controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Resources.color.colorPrimary,
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextInter(
                  text: "Name: ${controller.mData?.name}",
                  size: 14,
                  fontWeight: Weightenum.bold,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextInter(
                      text: "Status: ",
                      size: 14,
                      fontWeight: Weightenum.bold,
                    ),
                    TextInter(
                      text: (controller.authController.currentUser.value
                                  ?.emailVerified ??
                              false)
                          ? "Email verified"
                          : "Email isn't verified",
                      size: 14,
                      fontWeight: Weightenum.bold,
                      color: (controller.authController.currentUser.value
                                  ?.emailVerified ??
                              false)
                          ? Resources.color.successMain
                          : Resources.color.dangerMain,
                    ),
                    if (controller.authController.currentUser.value
                                ?.emailVerified ==
                            false &&
                        !controller.isSendingEmail)
                      GestureDetector(
                        onTap: () {
                          controller.sendEmail();
                        },
                        child: const TextInter(
                          text: " (Send Email)",
                          size: 12,
                          fontWeight: Weightenum.semibold,
                        ),
                      )
                  ],
                ),
                const SizedBox(height: 48),
                PrimaryButton(
                  title: "Logout",
                  onPressed: () {
                    controller.logout();
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
