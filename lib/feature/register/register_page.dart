import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/resources.dart';
import '../../utils/helper/constant.dart';
import '../../utils/helper/validator.dart';
import '../../utils/widget/form/form_input_field_with_label.dart';
import '../../utils/widget/primary_button.dart';
import '../../utils/widget/text/text_inter.dart';
import 'register_controller.dart';

class RegisterPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: GetBuilder<RegisterController>(
                init: RegisterController(),
                builder: (controller) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: const Icon(Icons.arrow_back_ios_new_rounded),
                            iconSize: 24,
                            onPressed: () {
                              Get.back();
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48.0),
                        child: TextInter(
                            size: 18,
                            color: Resources.color.textHeadLine,
                            fontWeight: Weightenum.semibold,
                            text: "Sign Up",
                            align: TextAlign.center),
                      ),
                      const SizedBox(height: 14.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48.0),
                        child: TextInter(
                            size: 14,
                            color: Resources.color.paragraphBody,
                            fontWeight: Weightenum.regular,
                            maxLines: 2,
                            text:
                                "Please enter name, email, and password below to continue",
                            align: TextAlign.center),
                      ),
                      const SizedBox(height: 40.0),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: controller.nameController.text != ""
                            ? Visibility(
                                visible: controller.nameController.text != "",
                                child: Column(children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextInter(
                                        size: 12,
                                        color: Resources.color.paragraphBody,
                                        fontWeight: Weightenum.regular,
                                        text: 'txt_name'.tr),
                                  ),
                                  const SizedBox(height: 8.0),
                                ]),
                              )
                            : const SizedBox.shrink(),
                      ),
                      FormInputFieldWithLabel(
                        enabled: !controller.isLoading,
                        controller: controller.nameController,
                        iconSuffix: null,
                        labelText: 'txt_name'.tr,
                        errorText: null,
                        validator: Validator().name,
                        obscureText: false,
                        onChanged: (value) => controller.update(),
                        onSaved: (value) =>
                            controller.emailController.text = value!,
                        onTap: () {},
                        maxLines: 1,
                      ),
                      const SizedBox(height: 24),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: controller.emailController.text != ""
                            ? Visibility(
                                visible: controller.emailController.text != "",
                                child: Column(children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextInter(
                                        size: 12,
                                        color: Resources.color.paragraphBody,
                                        fontWeight: Weightenum.regular,
                                        text: 'txt_email'.tr),
                                  ),
                                  const SizedBox(height: 8.0),
                                ]),
                              )
                            : const SizedBox.shrink(),
                      ),
                      FormInputFieldWithLabel(
                        enabled: !controller.isLoading,
                        controller: controller.emailController,
                        iconSuffix: null,
                        labelText: 'txt_email'.tr,
                        errorText: null,
                        validator: Validator().email,
                        obscureText: false,
                        onChanged: (value) => controller.update(),
                        onSaved: (value) =>
                            controller.emailController.text = value!,
                        onTap: () {},
                        maxLines: 1,
                      ),
                      const SizedBox(height: 24),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: controller.passwordController.text != ""
                            ? Visibility(
                                visible:
                                    controller.passwordController.text != "",
                                child: Column(children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextInter(
                                        size: 12,
                                        color: Resources.color.paragraphBody,
                                        fontWeight: Weightenum.regular,
                                        text: 'txt_password'.tr),
                                  ),
                                  const SizedBox(height: 8.0),
                                ]),
                              )
                            : const SizedBox.shrink(),
                      ),
                      FormInputFieldWithLabel(
                        enabled: !controller.isLoading,
                        controller: controller.passwordController,
                        labelText: 'txt_password'.tr,
                        errorText: null,
                        validator: Validator().password,
                        onChanged: (value) => controller.update(),
                        onSaved: (value) =>
                            controller.passwordController.text = value!,
                        onTap: () {},
                        maxLines: 1,
                        iconSuffix: SizedBox(
                          height: 16,
                          width: 16,
                          child: IconButton(
                              color: Resources.color.textHeadLine,
                              padding: EdgeInsets.zero,
                              icon: controller.hidePassword
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onPressed: () => {
                                    controller.tooglePasswordVisibility(),
                                  }),
                        ),
                        obscureText: controller.hidePassword,
                      ),
                      const SizedBox(height: 24),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: controller.passwordConfirmationController.text !=
                                ""
                            ? Visibility(
                                visible: controller
                                        .passwordConfirmationController.text !=
                                    "",
                                child: Column(children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextInter(
                                        size: 12,
                                        color: Resources.color.paragraphBody,
                                        fontWeight: Weightenum.regular,
                                        text: 'txt_password_confirmation'.tr),
                                  ),
                                  const SizedBox(height: 8.0),
                                ]),
                              )
                            : const SizedBox.shrink(),
                      ),
                      FormInputFieldWithLabel(
                        enabled: !controller.isLoading,
                        controller: controller.passwordConfirmationController,
                        labelText: 'txt_password_confirmation'.tr,
                        errorText: null,
                        validator: (val) {
                          return controller.validatePasswordConfirmation();
                        },
                        iconSuffix: SizedBox(
                          height: 16,
                          width: 16,
                          child: IconButton(
                              color: Resources.color.textHeadLine,
                              padding: EdgeInsets.zero,
                              icon: controller.hidePasswordConfirmation
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onPressed: () => {
                                    controller
                                        .tooglePasswordConfirmationVisibility(),
                                  }),
                        ),
                        obscureText: controller.hidePasswordConfirmation,
                        onChanged: (value) => controller.update(),
                        onSaved: (value) => controller
                            .passwordConfirmationController.text = value!,
                        onTap: () {},
                        maxLines: 1,
                      ),
                      const SizedBox(height: 48),
                      controller.isLoading
                          ? const CircularProgressIndicator()
                          : Container(),
                      controller.isLoading
                          ? Container()
                          : PrimaryButton(
                              title: 'txt_button_register'.tr,
                              borderRadius: 8,
                              shadowed: false,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await controller.register();
                                }
                              }),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
