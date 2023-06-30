import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/Ui/products/all_products.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/controllers/product/add_product_ctrl.dart';
import 'package:trader_app/screens/shared_widgets/custom_btn.dart';
import 'package:trader_app/screens/shared_widgets/custom_text.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';
import 'package:trader_app/screens/shared_widgets/title_with_text_form_field.dart';
import '../Common_Codes/common_codes.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  List<String> list = ['1', '2', '3', '4'];
  List<String> productCodeList = ['A', 'AC'];

  AddProductCtrl ctrl = Get.put(
    AddProductCtrl(),
  );
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
        title: Text(
          AppStrings.Add_Product,
          style: TextStyle(
            color: AppColors.kSecondaryColor,
          ),
        ),
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
                  action: () {
                    ctrl.postData();
                  },
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
          titleText: AppStrings.Product_Name,
          hintText: AppStrings.Product_Name,
          controller: ctrl.productNameCtrl,
        ),
        // Title product ID
        const CustomText(text: AppStrings.Product_ID),
        AppSizedBox.sizedBoxH10,
        DropdownButtonFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: ctrl.product_ID,
          items: list
              .map((label) => DropdownMenuItem(
                    value: label,
                    child: Text(label.toString()),
                  ))
              .toList(),
          hint: const Text(AppStrings.Product_ID),
          onChanged: (value) {
            setState(() {
              ctrl.product_ID = value;
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
        const CustomText(text: AppStrings.ProductTypeID),
        AppSizedBox.sizedBoxH10,
        DropdownButtonFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: ctrl.productTypeID,
          items: list
              .map((label) => DropdownMenuItem(
                    value: label,
                    child: Text(label.toString()),
                  ))
              .toList(),
          hint: const Text(AppStrings.ProductTypeID),
          onChanged: (value) {
            setState(() {
              ctrl.productTypeID = value;
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
        const CustomText(text: AppStrings.Quantity_ID),
        AppSizedBox.sizedBoxH10,
        DropdownButtonFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: ctrl.quantity_Type,
          items: list
              .map((label) => DropdownMenuItem(
                    value: label,
                    child: Text(label.toString()),
                  ))
              .toList(),
          hint: const Text(AppStrings.Quantity_ID),
          onChanged: (value) {
            setState(() {
              ctrl.quantity_Type = value;
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
        const CustomText(text: 'Product Code'),
        AppSizedBox.sizedBoxH10,
        DropdownButtonFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: ctrl.product_Code,
          items: productCodeList
              .map((label) => DropdownMenuItem(
                    value: label,
                    child: Text(label.toString()),
                  ))
              .toList(),
          hint: const Text('Product Code'),
          onChanged: (value) {
            setState(() {
              ctrl.product_Code = value;
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
        //Title Product description
        TitleWithTextFormField(
          titleText: AppStrings.Product_Description,
          hintText: AppStrings.Product_Description,
          controller: ctrl.productDecCtrl,
        ),
        //Title Product notes
        TitleWithTextFormField(
          titleText: AppStrings.Product_Notes,
          hintText: AppStrings.Product_Notes,
          controller: ctrl.productNotesCtrl,
        ),
        // Title NO_OF_QUANTITY
        const CustomText(text: AppStrings.Product_Supplier_ID),
        AppSizedBox.sizedBoxH10,
        DropdownButtonFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: ctrl.noOfQuantity,
          items: list
              .map((label) => DropdownMenuItem(
                    value: label,
                    child: Text(label.toString()),
                  ))
              .toList(),
          hint: const Text(AppStrings.Product_Supplier_ID),
          onChanged: (value) {
            setState(() {
              ctrl.supplierID = value;
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
        const CustomText(text: 'Quantity'),
        AppSizedBox.sizedBoxH10,
        DropdownButtonFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: ctrl.noOfQuantity,
          items: list
              .map((label) => DropdownMenuItem(
                    value: label,
                    child: Text(label.toString()),
                  ))
              .toList(),
          hint: const Text('Quantity'),
          onChanged: (value) {
            setState(() {
              ctrl.noOfQuantity = value;
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
        // Title PRODUCT_COST
        TitleWithTextFormField(
          titleText: AppStrings.Product_Cost,
          hintText: AppStrings.Product_Cost,
          controller: ctrl.productCostCtrl,
          type: TextInputType.number,
        ),
        // Title SELLING_COST
        TitleWithTextFormField(
          titleText: AppStrings.Product_Selling_Cost,
          hintText: AppStrings.Product_Selling_Cost,
          controller: ctrl.sellingCostCtrl,
          type: TextInputType.number,
        ),
        // Title PURCHASE NOTES
        TitleWithTextFormField(
          titleText: AppStrings.Product_Purchase_Notes,
          hintText: AppStrings.Product_Purchase_Notes,
          controller: ctrl.purchaseNotesCtrl,
        ),
      ],
    );
  }
}
