import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/controllers/invoice_controller.dart';
import 'package:trader_app/env/dimensions.dart';
import 'package:trader_app/screens/shared_widgets/custom_btn.dart';
import 'package:trader_app/screens/shared_widgets/title_with_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentInstructions extends GetView<InvoiceController> {
  PaymentInstructions({Key? key}) : super(key: key);
  final TextEditingController _paymentInstInputController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (scroll) {
        scroll.disallowIndicator();
        return true;
      },
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: Dimensions.calcH(5),
            horizontal: Dimensions.calcW(15),
          ),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    TitleWithTextFormField(
                      controller: _paymentInstInputController,
                      titleText: AppStrings.ADD_PAYMENT_INSTRUCTIONS_LABEL,
                      height: Dimensions.calcH(100),
                      isRequired: true,
                    ),
                  ],
                ),
              ),
              CustomBtn(
                label: AppStrings.SAVE_BTN,
                action: () {
                  if (_paymentInstInputController.text.isEmpty ||
                      _paymentInstInputController.text.length < 5) {
                    Get.snackbar(
                        "Error", "Please check your entries and try again!",
                        snackPosition: SnackPosition.BOTTOM);
                  } else {
                    controller.setPaymentInstructions(
                        _paymentInstInputController.text);
                    Get.close(1);
                  }
                },
                color: AppColors.kPrimaryColor,
                textColor: Colors.white,
                width: Dimensions.calcW(150),
              )
            ],
          ),
        ),
      ),
    );
  }
}
