import 'package:flutter/material.dart';
import 'package:trader_app/Ui/all_products.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/env/dimensions.dart';
import 'package:trader_app/screens/shared_widgets/custom_btn.dart';
import 'dashboard.dart';

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
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title product name
              const Text(
                'product name',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: Dimensions.calcH(15)),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.calcH(20)),
              // Title product ID
              const Text(
                'product ID',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: Dimensions.calcH(15)),
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
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
              SizedBox(height: Dimensions.calcH(20)),
              // Title Quantity type
              const Text(
                'Quantity type',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: Dimensions.calcH(15)),
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
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
              SizedBox(height: Dimensions.calcH(20)),
              //Title Product description
              const Text(
                'Product description',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: Dimensions.calcH(15)),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.calcH(20)),
              //Title Product notes
              const Text(
                'Product notes',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: Dimensions.calcH(15)),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.calcH(20)),
              // Image PRODUCT_IMAGE_URL
              // Title SUPPLIER_ID
              const Text(
                'Supplier ID',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: Dimensions.calcH(15)),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.calcH(20)),
              // Title NO_OF_QUANTITY
              const Text(
                'product ID',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: Dimensions.calcH(15)),
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
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
              SizedBox(height: Dimensions.calcH(20)),
              // Title PRODUCT_COST
              const Text(
                'Product Cost',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: Dimensions.calcH(15)),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.calcH(20)),
              // Title SELLING_COST
              const Text(
                'Selling Cost',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: Dimensions.calcH(15)),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.calcH(20)),
              // Title PURCHASE NOTES
              const Text(
                'Purchase Cost',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: Dimensions.calcH(15)),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.calcH(20)),
              // Save Button
              Center(
                child: CustomBtn(
                  action: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const AllProducts(),)),
                  label: 'Save',
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
