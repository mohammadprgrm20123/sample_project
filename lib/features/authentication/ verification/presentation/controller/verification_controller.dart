import 'dart:async';

import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../../home/presentation/home_screen.dart';
import '../../data/model/verification_dto.dart';
import '../../domain/use_case/verification_use_case.dart';

@injectable
class VerificationController extends GetxController {

  String code = '';
  final RxInt duration = 120.obs;

  RxBool showLoading = false.obs;

  VerificationUseCase verifyUseCase;

  VerificationController(this.verifyUseCase);

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  Future<void> verify(final VerficationDto dto) async {
    showLoading.value = true;
    final result = await verifyUseCase.call(dto);

    result.fold((final l) {}, (final user) {
      Get.offAll(HomeScreen(userEntity: user));
    });

    showLoading.value = false;
  }


  void startTimer() =>
      Timer.periodic(const Duration(seconds: 1), (final timer) {
        print(timer.tick);
        if (timer.tick == 120) {
          duration.value = 0;
          timer.cancel();
        } else {
          decrementTime();
        }
      });

  void decrementTime() => duration.value--;

}
