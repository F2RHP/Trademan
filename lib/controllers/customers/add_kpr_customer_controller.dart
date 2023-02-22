import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/models/customer_model/add_kpr_customer.dart';

class AddKPRCustomerController extends GetxController {
  KPRCustomer? kprCustomer;
  TextEditingController nameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController villageNameController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController dOBController = TextEditingController();
  TextEditingController profilePictureController = TextEditingController();
  TextEditingController customerNotesController = TextEditingController();

  bool customerFormValidate() {
    if (
    nameController.text.isEmpty ||
        nickNameController.text.isEmpty ||
        fatherNameController.text.isEmpty ||
        villageNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        contactNumberController.text.isEmpty ||
        address1Controller.text.isEmpty ||
        address2Controller.text.isEmpty ||
        pinCodeController.text.isEmpty ||
        customerNotesController.text.isEmpty
    ) {
      Get.snackbar(
        "Error",
        "Please Fill all the required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else {
      kprCustomer = KPRCustomer(
        name: nameController.text,
        nickName: nickNameController.text,
        address1: address1Controller.text,
        address2: address2Controller.text,
        email: emailController.text,
        fatherName: fatherNameController.text,
        gender: genderController.text,
        villageName: villageNameController.text,
        pinCode: pinCodeController.text,
        contactNumber: contactNumberController.text,
        dateBirth: dOBController.text,
        profilePictureURL: profilePictureController.text,
        customerNotes: customerNotesController.text,
      );
      return true;
    }
  }

  @override
  void onClose() {
   if(kprCustomer!=null) {
      nameController.clear();
          nickNameController.clear();
          fatherNameController.clear();
          villageNameController.clear();
          emailController.clear();
          contactNumberController.clear();
          address1Controller.clear();
          address2Controller.clear();
          pinCodeController.clear();
          customerNotesController.clear();
    }
    super.onClose();
  }
}
