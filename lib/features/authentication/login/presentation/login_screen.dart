import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ verification/presentation/verification_screen.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/utils/email_validator.dart';
import '../../../../core/utils/utils.dart';
import '../../../../generated/l10n.dart';
import '../data/models/login_dto.dart';
import 'controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    Get.lazyPut<LoginController>(getIt);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CircleAvatar(
                    maxRadius: 35,
                    child: Icon(
                      Icons.login,
                      size: 35,
                    )),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                    controller: controller.emailController,
                    validator: (final value) {
                      if (Utils.isNullOrEmpty(value)) {
                        return 'this Filed is Required';
                      } else {
                        if (!EmailValidator.validate(value!)) {
                          return 'Please enter the valid email';
                        }
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        label: Text(S.of(context).email),
                        border: const OutlineInputBorder())),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: controller.passwordController,
                    validator: (final value) {
                      if (Utils.isNullOrEmpty(value)) {
                        return 'this Filed is Required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        label: Text(S.of(context).password),
                        border: const OutlineInputBorder())),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: controller.confirmController,
                    validator: (final value) {
                      if (Utils.isNullOrEmpty(value)) {
                        return 'this Filed is Required';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        label: Text(S.of(context).confirmPassword),
                        border: const OutlineInputBorder())),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () async {
                          final dto = LoginDto(
                              email: controller.emailController.text,
                              password: controller.passwordController.text,
                              confirm: controller.confirmController.text);

                          if (controller.formKey.currentState!.validate() &&
                              controller.validateLoginDto(dto: dto)) {
                            await controller.login(
                                dto: dto,
                                callback: () {
                                  Get.to(const VerificationScreen());
                                });
                          }
                        },
                        child: Obx(() => controller.showLoading.value
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(color: Colors.white,))
                            : const Text('Login'))))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
