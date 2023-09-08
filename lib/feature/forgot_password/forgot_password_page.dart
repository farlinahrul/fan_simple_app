import 'package:fan_simple_app/routes/page_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/resources.dart';
import '../../utils/helper/constant.dart';
import '../../utils/helper/validator.dart';
import '../../utils/widget/form/form_input_field_with_label.dart';
import '../../utils/widget/primary_button.dart';
import '../../utils/widget/text/text_inter.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordPage extends StatelessWidget {
  // const ForgotPasswordPage({ Key? key }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              child: Container(
                child: GetBuilder<ForgotPasswordController>(
                  init: ForgotPasswordController(),
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
                              icon:
                                  const Icon(Icons.arrow_back_ios_new_rounded),
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
                              text: "Forgot Password",
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
                                  "Enter your email and we will send you a link to get back into your account",
                              align: TextAlign.center),
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
                          onTap: () => null,
                          maxLines: 1,
                        ),
                        SizedBox(height: 48),
                        controller.isLoading
                            ? const CircularProgressIndicator()
                            : Container(),
                        controller.isLoading
                            ? Container()
                            : PrimaryButton(
                                title: 'txt_button_confirm'.tr,
                                borderRadius: 8,
                                shadowed: false,
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await controller.postForgotPassword();
                                    Get.offNamed(PageName.login);
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
      ),
    );
  }
}
