import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/di/injection.dart';
import '../../authentication/ verification/domain/entity/user_entity.dart';
import 'controller/home_controller.dart';
import 'tabs/tab1.dart';
import 'tabs/tab2.dart';

class HomeScreen extends GetView<HomeController> {
  final UserEntity userEntity;

  const HomeScreen({required this.userEntity, super.key});

  @override
  Widget build(final BuildContext context) {
    Get.lazyPut<HomeController>(getIt);

    return Scaffold(
        bottomNavigationBar: Obx(() => BottomNavigationBar(
            onTap: (final index) {
              controller.currentIndex.value = index;
            },
            currentIndex: controller.currentIndex.value,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Tab1'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bubble_chart), label: 'Tab2')
            ],
          )),
        body: Obx(() =>
        controller.currentIndex == 0
            ? const Tab1()
            : const Tab2())
    );
  }
}
