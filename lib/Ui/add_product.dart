import 'package:flutter/material.dart';
import 'package:trader_app/Ui/all_products.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/screens/shared_widgets/custom_btn.dart';
import 'package:trader_app/screens/shared_widgets/custom_text.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';
import 'package:trader_app/screens/shared_widgets/title_with_text_form_field.dart';

import 'Common_Codes/common_codes.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  List<String> list = ['1', '2', '3', '4'];
  var dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
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
              // Title product name
              const TitleWithTextFormField(titleText: 'Product Name'),
              // Title product ID
              const CustomText(text: 'Product ID'),
              AppSizedBox.sizedBoxH10,
              DropdownButtonFormField(
                value: dropDownValue,
                items: list
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(label.toString()),
                        ))
                    .toList(),
                hint: const Text('product'),
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
              const CustomText(text: 'Quantity type'),
              AppSizedBox.sizedBoxH10,
              DropdownButtonFormField(
                value: dropDownValue,
                items: list
                    .map((label) => DropdownMenuItem(
                  value: label,
                  child: Text(label.toString()),
                ))
                    .toList(),
                hint: const Text('product'),
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
              //Title Product description
              const TitleWithTextFormField(titleText: 'Product description'),
              //Title Product notes
              const TitleWithTextFormField(titleText: 'Product Notes'),
              // Image PRODUCT_IMAGE_URL
              // Title SUPPLIER_ID
              const TitleWithTextFormField(titleText: 'Supplier ID'),
              // Title NO_OF_QUANTITY
              const CustomText(text: 'Quantity'),
              AppSizedBox.sizedBoxH10,
              DropdownButtonFormField(
                value: dropDownValue,
                items: list
                    .map((label) => DropdownMenuItem(
                  value: label,
                  child: Text(label.toString()),
                ))
                    .toList(),
                hint: const Text('Quantity'),
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
              // Title PRODUCT_COST
              const TitleWithTextFormField(titleText: 'Product Cost'),
              // Title SELLING_COST
              const TitleWithTextFormField(titleText: 'Selling Cost'),
              // Title PURCHASE NOTES
              const TitleWithTextFormField(titleText: 'Purchase Cost'),

              // Save Button
              Center(
                child: CustomBtn(
                  action: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllProducts(),
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
}
