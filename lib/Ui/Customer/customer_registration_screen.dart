import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/Ui/Customer/customer_list.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/screens/shared_widgets/custom_btn.dart';
import 'package:trader_app/screens/shared_widgets/custom_text.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';
import 'package:trader_app/screens/shared_widgets/title_with_text_form_field.dart';
import '../../controllers/customers/add_kpr_customer_controller.dart';
import '../Common_Codes/common_codes.dart';

class CustomerRegistration extends StatefulWidget {
  const CustomerRegistration({Key? key}) : super(key: key);

  @override
  State<CustomerRegistration> createState() => _CustomerRegistrationState();
}

class _CustomerRegistrationState extends State<CustomerRegistration> {
  final AddKPRCustomerController crtl = Get.find<AddKPRCustomerController>();

  List<String> list = ['1', '2', '3', '4'];
  var dropDownValue;
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
              crtl.action.value,
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
                  action: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomersList(),
                      )),
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
          // controller: ,
          titleText: AppStrings.Customer_Name,
          hintText: AppStrings.Customer_Name,
          controller: crtl.nameController,
        ),
        TitleWithTextFormField(
          titleText: AppStrings.Nick_Name,
          hintText: AppStrings.Nick_Name,
          controller: crtl.nickNameController,
        ),
        TitleWithTextFormField(
          titleText: AppStrings.Father_Name,
          hintText: AppStrings.Father_Name,
          controller: crtl.fatherNameController,
        ),
        // Title product ID
        const CustomText(text: AppStrings.Gender),
        AppSizedBox.sizedBoxH10,
        DropdownButtonFormField(
          value: dropDownValue,
          items: list
              .map((label) => DropdownMenuItem(
                    value: label,
                    child: Text(label.toString()),
                  ))
              .toList(),
          hint: const Text(AppStrings.Gender),
          onChanged: (value) {
            setState(() {
              dropDownValue = value;
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
        ),
        AppSizedBox.sizedBoxH20,
        // Title Quantity type
        TitleWithTextFormField(
          titleText: AppStrings.Customer_Email,
          hintText: AppStrings.Customer_Email,
          controller: crtl.emailController,
        ),
        // Title SELLING_COST
        TitleWithTextFormField(
          titleText: AppStrings.Address1,
          hintText: AppStrings.Address1,
          controller: crtl.address1Controller,
        ),
        TitleWithTextFormField(
          titleText: AppStrings.Address2,
          hintText: AppStrings.Address2,
          controller: crtl.address2Controller,
        ),
        TitleWithTextFormField(
          titleText: AppStrings.Village_Name,
          hintText: AppStrings.Village_Name,
          controller: crtl.villageNameController,
        ),
        TitleWithTextFormField(
          titleText: AppStrings.Contact_Number,
          hintText: AppStrings.Contact_Number,
          controller: crtl.contactNumberController,
        ),
        TitleWithTextFormField(
          titleText: AppStrings.Pin_Code,
          hintText: AppStrings.Pin_Code,
          controller: crtl.pinCodeController,
        ),
        TitleWithTextFormField(
          titleText: AppStrings.Data_Birth,
          hintText: AppStrings.Data_Birth,
          controller: crtl.dOBController,
        ),
        TitleWithTextFormField(
          titleText: AppStrings.Customer_Notes,
          hintText: AppStrings.Customer_Notes,
          maxLines: 3,
          controller: crtl.customerNotesController,
        ),
      ],
    );
  }
}
