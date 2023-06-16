import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trader_app/Ui/Customer/customer_list.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/controllers/customers/add_kpr_customer_controller.dart';
import 'package:trader_app/screens/shared_widgets/custom_btn.dart';
import 'package:trader_app/screens/shared_widgets/custom_text.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';
import 'package:trader_app/screens/shared_widgets/title_with_text_form_field.dart';
import '../Common_Codes/common_codes.dart';

class CustomerRegistration extends StatefulWidget {
  const CustomerRegistration({Key? key}) : super(key: key);

  @override
  State<CustomerRegistration> createState() => _CustomerRegistrationState();
}

class _CustomerRegistrationState extends State<CustomerRegistration> {
  final AddKPRCustomerController ctrl = Get.find<AddKPRCustomerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 40.0,
              color: AppColors.kSecondaryColor,
            ),
          ),
        ),
        centerTitle: true,
        title: Obx(() => Text(
              ctrl.action.value,
              style: TextStyle(
                color: AppColors.kSecondaryColor,
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildInputSection(),
              // Save Button
              Center(
                child: CustomBtn(
                  action: () => {ctrl.savecustomer()},
                  label: 'Save',
                  width: 300.0,
                  height: 45.0,
                  textColor: AppColors.kSecondaryColor,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title product name
        TitleWithTextFormField(
          controller: ctrl.nameController,
          titleText: AppStrings.Customer_Name,
          hintText: AppStrings.Customer_Name,
        ),
        TitleWithTextFormField(
          controller: ctrl.nickNameController,
          titleText: AppStrings.Nick_Name,
          hintText: AppStrings.Nick_Name,
        ),
        TitleWithTextFormField(
          controller: ctrl.fatherNameController,
          titleText: AppStrings.Father_Name,
          hintText: AppStrings.Father_Name,
        ),
        // Title product ID
        const CustomText(text: AppStrings.Gender),
        AppSizedBox.sizedBoxH10,
        Obx(() => DropdownButtonFormField(
              value: ctrl.genderDropdownvalue.value,
              items: ctrl.genderList
                  .map((label) => DropdownMenuItem(
                        value: label,
                        child: Text(label.toString()),
                      ))
                  .toList(),
              hint: const Text(AppStrings.Gender),
              onChanged: (value) {
                setState(() {
                  ctrl.genderDropdownvalue.value = value.toString();
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: CustomBorderRadius.borderRadius8,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: CustomBorderRadius.borderRadius8,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: CustomBorderRadius.borderRadius8,
                  borderSide: BorderSide(
                    color: AppColors.grey,
                  ),
                ),
                fillColor: AppColors.kSecondaryColor,
                filled: true,
              ),
            )),
        AppSizedBox.sizedBoxH20,
        // Title Quantity type
        TitleWithTextFormField(
          controller: ctrl.emailController,
          titleText: AppStrings.Customer_Email,
          hintText: AppStrings.Customer_Email,
        ),
        // Title SELLING_COST
        TitleWithTextFormField(
          titleText: AppStrings.Address1,
          hintText: AppStrings.Address1,
          controller: ctrl.address1Controller,
        ),
        TitleWithTextFormField(
          titleText: AppStrings.Address2,
          hintText: AppStrings.Address2,
          controller: ctrl.address2Controller,
        ),
        TitleWithTextFormField(
          titleText: AppStrings.Village_Name,
          hintText: AppStrings.Village_Name,
          controller: ctrl.villageNameController,
        ),
        TitleWithTextFormField(
          titleText: AppStrings.Contact_Number,
          hintText: AppStrings.Contact_Number,
          controller: ctrl.contactNumberController,
        ),
        TitleWithTextFormField(
          titleText: AppStrings.Pin_Code,
          hintText: AppStrings.Pin_Code,
          controller: ctrl.pinCodeController,
        ),
        TitleWithTextFormField(
          // readOnly: true,
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1950),
              lastDate: DateTime.now(),
            ).then(
              (value) {
                ctrl.dOBController.text =  DateFormat('yyyy-MM-hh').format(value!);
              }
            );
          },
          titleText: AppStrings.Data_Birth,
          hintText: AppStrings.Data_Birth,
          controller: ctrl.dOBController,
        ),
        TitleWithTextFormField(
          titleText: AppStrings.Customer_Notes,
          hintText: AppStrings.Customer_Notes,
          maxLines: 3,
          controller: ctrl.customerNotesController,
        ),
      ],
    );
  }
}
