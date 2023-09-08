import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/resources.dart';
import '../../routes/page_names.dart';
import '../../utils/helper/constant.dart';
import '../../utils/helper/validator.dart';
import '../../utils/widget/colored_status_bar.dart';
import '../../utils/widget/form/form_input_field_with_label.dart';
import '../../utils/widget/primary_button.dart';
import '../../utils/widget/text/text_inter.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  // final AuthController authController = AuthController.find;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: ColoredStatusBar.light(
        child: Scaffold(
          body: SafeArea(
            top: true,
            bottom: true,
            child: Form(
              key: _formKey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 48),
                    child: GetBuilder<LoginController>(
                      init: LoginController(),
                      builder: (controller) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 48.0),
                              child: TextInter(
                                  size: 18,
                                  color: Resources.color.textHeadLine,
                                  fontWeight: Weightenum.semibold,
                                  text: "Login",
                                  align: TextAlign.center),
                            ),
                            const SizedBox(height: 14.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 48.0),
                              child: TextInter(
                                size: 14,
                                color: Resources.color.paragraphBody,
                                fontWeight: Weightenum.regular,
                                text:
                                    "Please enter email and password below to continue",
                                align: TextAlign.center,
                                maxLines: 3,
                              ),
                            ),
                            const SizedBox(height: 40.0),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 250),
                              child: controller.emailController.text != ""
                                  ? Visibility(
                                      visible:
                                          controller.emailController.text != "",
                                      child: Column(children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: TextInter(
                                              size: 12,
                                              color:
                                                  Resources.color.paragraphBody,
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
                              onTap: () => {},
                              maxLines: 1,
                            ),
                            const SizedBox(height: 24),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 250),
                              child: controller.passwordController.text != ""
                                  ? Visibility(
                                      visible:
                                          controller.passwordController.text !=
                                              "",
                                      child: Column(children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: TextInter(
                                              size: 12,
                                              color:
                                                  Resources.color.paragraphBody,
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
                              // iconSuffix: null,
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
                              labelText: 'txt_password'.tr,
                              errorText: null,
                              validator: Validator().password,
                              obscureText: controller.hidePassword,
                              onChanged: (value) => controller.update(),
                              onSaved: (value) =>
                                  controller.passwordController.text = value!,
                              onTap: () {},
                              maxLines: 1,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Get.toNamed(PageName.forgotPassword);
                                },
                                child: TextInter(
                                    size: 14,
                                    color: Resources.color.subBrand,
                                    fontWeight: Weightenum.semibold,
                                    text: 'txt_forgot_password'.tr),
                              ),
                            ),
                            const SizedBox(height: 48),
                            controller.isLoading
                                ? const CircularProgressIndicator()
                                : PrimaryButton(
                                    title: 'txt_button_login'.tr,
                                    borderRadius: 8,
                                    shadowed: false,
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        controller.signInWithEmailAndPassword();
                                      }
                                    }),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextInter(
                                  size: 14,
                                  color: Resources.color.textSecondary1,
                                  fontWeight: Weightenum.semibold,
                                  text: 'Don\'t have any account? ',
                                ),
                                TextButton(
                                  onPressed: () {
                                    
                                  },
                                  child: TextInter(
                                    size: 14,
                                    color: Resources.color.subBrand,
                                    fontWeight: Weightenum.semibold,
                                    text: 'Sign Up',
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
