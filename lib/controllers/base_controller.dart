import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final isLoading = false.obs;

  void navigateBack(int? id, bool goback) {
    var action = id! > 0 ? "Added" : "Edited";
    Get.snackbar("Information", '$action successfully');
    if (goback) {
      Get.back();
    }
  }

  void showSavedSuccessfullyDialog(int? id, bool goback) {
    var action = id! > 0 ? "Added" : "Edited";
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.defaultDialog(
        title: "Information",
        content: Text('$action successfully'),
        confirm: ElevatedButton(
          onPressed: () {
            if (goback) {
              Get.back();
            }
          },
          child: const Text('OK'),
        ),
      );
    });
  }
}
