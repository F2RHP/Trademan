import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/models/customer_model/add_kpr_customer.dart';
import 'package:trader_app/models/customer_model/list_customer_model.dart';

import '../../models/customer_model/CustomerDTO_UPD.dart';
import '../../services/customerservice.dart';
import 'list_customers_ctrl.dart';

class AddKPRCustomerController extends GetxController {
  late CustomerService service;

  CustomerDTO_UPD? kprCustomer;
  final action = "".obs;

  List<String> genderList = ['Male', 'Female', 'Other'].obs;
  final genderDropdownvalue = 'Male'.obs;
  var saveBtnText="SAVE".obs;

  int? customerId=0;
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
    if (nameController.text.isEmpty ||
        nickNameController.text.isEmpty ||
        fatherNameController.text.isEmpty ||
        villageNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        contactNumberController.text.isEmpty ||
        address1Controller.text.isEmpty ||
        address2Controller.text.isEmpty ||
        pinCodeController.text.isEmpty ||
        customerNotesController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please Fill all the required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } 
    return true;
  }

  @override
  void onInit() {
    service = CustomerService();
    customerId=0;
    saveBtnText="SAVE".obs;
  }

  @override
  void onClose() {
    clearController();
    super.onClose();
  }

  void clearController() {
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

  //defiles
  void updateCustomerDefiles(CustomersList m) {
    customerId=m.customeRId;
    nameController.text = m.customeRName!;
    nickNameController.text = m.customeRNickname!;
    fatherNameController.text = m.fatheRName!;
    address1Controller.text = m.adrresS1!;
    address2Controller.text = m.addresS2!;
    villageNameController.text = m.villagename!;
    pinCodeController.text = m.pincode!;
    contactNumberController.text = m.contactnumber!;
    emailController.text = m.email!;
    genderController.text = m.gender!;
    dOBController.text = m.dob!; //m.dob;
    customerNotesController.text = m.customeRNotes!;

    saveBtnText="EDIT".obs;
  }

  CustomerDTO_UPD createCustomerObject() {
    final customeRId = customerId; // Replace with the actual value
    final customerName = nameController.text;
    final customerNickname = nickNameController.text;
    final fatherName = fatherNameController.text;
    final address1 = address1Controller.text;
    final address2 = address2Controller.text;
    final villageName = villageNameController.text;
    final pincode = pinCodeController.text;
    final contactNumber = contactNumberController.text;
    final email = emailController.text;
    final gender = genderDropdownvalue.value;
    final dob = DateTime.parse(dOBController
        .text); // Assumes the date format is in 'yyyy-MM-dd' format
    //final profilePictureUrl = profilePictureController.text;
    final profilePictureUrl = "";
    final customerNotes = customerNotesController.text;
    final branchId = 1; // Replace with the actual value

    return CustomerDTO_UPD(
      customerId: customeRId,
      customerName: customerName,
      customerNickname: customerNickname,
      fatherName: fatherName,
      address1: address1,
      address2: address2,
      villageName: villageName,
      pincode: pincode,
      contactNumber: contactNumber,
      email: email,
      gender: gender,
      dob: dob,
      profilePictureUrl: profilePictureUrl,
      customerNotes: customerNotes,
      branchId: branchId,
    );
  }

  savecustomer() async {
    var customer = createCustomerObject();
    var isInserted = await service.addCustomer(customer);
    var action=customer.customerId!>0?"Added":"Edited";
    if (isInserted) {
      Get.showSnackbar(
        GetSnackBar(
          title: "Inforamation",
          message:'User $action Successfully',
          icon: const Icon(Icons.refresh),
          duration: const Duration(seconds: 3),
        ),
      );
      bool isRegistered = GetInstance().isRegistered<ListCustomersCtrl>();
      if (isRegistered) {
        var listCustomerCtrl = Get.find<ListCustomersCtrl>();
        listCustomerCtrl.getAllListCustomersList();
        clearController();
      }
    }
  }
}
