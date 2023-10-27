import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/utils/utils.dart';
import '../data/model/verification_dto.dart';
import 'controller/verification_controller.dart';

class VerificationScreen extends GetView<VerificationController> {
  const VerificationScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    Get.lazyPut<VerificationController>(getIt);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Validation Code',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            code(),
            Obx(() => controller.duration.value == 0
                ? TextButton(
                    onPressed: () {
                      controller.duration.value = 120;
                      controller.startTimer();
                    },
                    child: const Text('Re send Code'))
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(Utils.formatDuration(
                          Duration(seconds: controller.duration.value))),
                    ),
                  )),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {

                },
                child: Obx(() => controller.showLoading.value
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                    : const Text('Verify')))
          ],
        ),
      ),
    );
  }

  Widget code() => Obx(
        () => AbsorbPointer(
          absorbing: controller.showLoading.value,
          child: Center(
            child: VerificationCode(
              textStyle: const TextStyle(
                fontSize: 20.0,
              ),
              keyboardType: TextInputType.number,
              underlineColor: Colors.blue,
              length: 5,
              digitsOnly: true,
              cursorColor: Colors.blue,
              onCompleted: (final value) {
                if (controller.duration.value == 0) {
                  Get.snackbar('Error', 'OverTime');
                }else{
                  controller.verify(VerficationDto(
                      username: 'username', password: 'pass', code: value));
                }

              },
              onEditing: (final value) => controller.code = '',
            ),
          ),
        ),
      );
}
