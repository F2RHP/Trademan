import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final isLoading = false.obs;

void navigateBack() {
    Get.back();
  }

  void showSavedSuccessfullyDialog(int? id) {
    var action = id! > 0 ? "Added" : "Edited";
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.defaultDialog(
        title: "Information",
        content: Text('$action successfully'),
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
            Get.back();
          },
          child: const Text('OK'),
        ),
      );
    });
  }
}
