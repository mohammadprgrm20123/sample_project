import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/domain/failure_entity.dart';
import '../../data/models/login_dto.dart';
import '../../domain/use_case/login_use_case.dart';

@injectable
class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  LoginUseCase loginUseCase;

  RxBool showLoading = false.obs;

  LoginController(this.loginUseCase);

  Future<void> login(
      {required final LoginDto dto, required final Function() callback}) async {
    showLoading.value = true;
    final result = await loginUseCase.call(dto);

    result.fold((final l) {}, (final r) => callback.call());

    showLoading.value = false;
  }


  bool validateLoginDto({required final LoginDto dto}){
    if(dto.confirm!=dto.password){
      Get.snackbar('Error', 'Password is not same as Confirm',backgroundColor: Colors.red[100]);

      return false;
    }

    return true;

  }
}
