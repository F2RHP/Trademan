import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/controllers/product/add_product_ctrl.dart';
import 'package:trader_app/models/supplier/supplier.dart';
import 'package:trader_app/models/utility/utility_models.dart';
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
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildInputSection(),
                // Save Button
                Center(
                  child: CustomBtn(
                    action: () async {
                      await ctrl.saveData();
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
        );
      }),
    );
  }

  DropdownButtonFormField<T> loadDropdown<T>(
    List<T> items,
    T value,
    String Function(T) labelFunction,
    void Function(T?) onChanged,
  ) {
    var dropdownButtonFormField = DropdownButtonFormField<T>(
      value: value,
      items: items
          .map((item) => DropdownMenuItem<T>(
                value: item,
                child: Text(labelFunction(item)),
              ))
          .toList(),
      hint: const Text('Select'),
      onChanged: onChanged,
      decoration: dropDownDecoration(),
    );
    return dropdownButtonFormField;
  }

  Widget buildInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title product name
        TitleWithTextFormField(
          isRequired: true,
          titleText: AppStrings.Product_Name,
          hintText: AppStrings.Product_Name,
          controller: ctrl.productNameCtrl,
        ),
        // Title Quantity type
        const CustomText(text: AppStrings.ProductType,isRequired: true),
        AppSizedBox.sizedBoxH10,
        DropdownButtonFormField<ProductTypeModel>(
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          value: ctrl.selectedProductType,
          items: ctrl.productType
              .map((label) => DropdownMenuItem<ProductTypeModel>(
                    value: label,
                    child: Text(label.name!),
                  ))
              .toList(),
          hint: const Text(AppStrings.ProductType),
          onChanged: (value) {
            setState(() {
              ctrl.selectedProductType = value!;
            });
          },
          decoration: dropDownDecoration(),
        ),
        AppSizedBox.sizedBoxH20,
        const CustomText(text: AppStrings.Quantity_Type,isRequired: true),
        AppSizedBox.sizedBoxH10,
        DropdownButtonFormField<QuantityTypeModel>(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: ctrl.selectedQuantity,
          items: ctrl.quantityType
              .map((label) => DropdownMenuItem<QuantityTypeModel>(
                    value: label,
                    child: Text(label.quantityTypeName!),
                  ))
              .toList(),
          hint: const Text(AppStrings.Quantity_Type),
          onChanged: (value) {
            setState(() {
              ctrl.selectedQuantity = value!;
            });
          },
          decoration: dropDownDecoration(),
        ),
        // Title Quantity type
        AppSizedBox.sizedBoxH10,
        TitleWithTextFormField(
          titleText: AppStrings.Product_Code,
          hintText: AppStrings.Product_Code,
          controller: ctrl.productCodeCtrl,
        ),
        AppSizedBox.sizedBoxH10,
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

        const CustomText(
          text: AppStrings.Product_Supplier,
          isRequired: true,
        ),

        AppSizedBox.sizedBoxH10,
        DropdownButtonFormField<SupplierDTO>(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: ctrl.selectedSupplier,
          items: ctrl.supplierList
              .map((label) => DropdownMenuItem<SupplierDTO>(
                    value: label,
                    child: Text(label.supplierName),
                  ))
              .toList(),
          hint: const Text(AppStrings.Product_Supplier),
          onChanged: (value) {
            setState(() {
              ctrl.selectedSupplier = value!;
            });
          },
          decoration: dropDownDecoration(),
        ),
        AppSizedBox.sizedBoxH10,
        TitleWithTextFormField(
          isRequired: true,
          titleText: AppStrings.Product_Quantity,
          hintText: AppStrings.Product_Quantity,
          controller: ctrl.productNoOfquantityCtrl,
          type: TextInputType.number,
        ),
        // Title PRODUCT_COST
        TitleWithTextFormField(
          isRequired: true,
          titleText: AppStrings.Product_Cost,
          hintText: AppStrings.Product_Cost,
          controller: ctrl.productCostCtrl,
          type: TextInputType.number,
        ),
        // Title SELLING_COST
        TitleWithTextFormField(
          isRequired: true,
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
