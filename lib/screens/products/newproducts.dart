import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/controllers/products_controller.dart';
import 'package:trader_app/models/generalclass.dart';
import 'package:trader_app/screens/shared_widgets/appbar_eng_view.dart';
import '../../constants/strings.dart';
import '../shared_widgets/custom_input_eng.dart';

class NewProduct extends StatefulWidget {
  NewProduct({super.key});

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar_eng(title: "KPR Product"),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: buildProduct(context),
        ),
      ),
    );
  }

  Widget buildProduct(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomInput_eng(
            controller: controller.ctrlproductname,
            label: "Product Name",
            isRequired: true,
          ),
          CustomInput_eng(
            controller: controller.ctrlnoquantity,
            label: "No Of Quantity",
            isRequired: true,
          ),
          //buildSampleDropdown(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: buildProductDropdown(),
          ),
          buildDropdownButton()
        ],
      ),
    );
  }

  Padding buildSampleDropdown() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: DropdownButton<ProductType>(
        isExpanded: true,
        hint: Text(
          'Product Type',
        ),
        onChanged: (newValue) {
          setState(() {
            controller.selectedProductType.value = newValue as ProductType;
            print(newValue);
          });
        },
        value: controller.selectedProductType.value,
        items: controller.productTypes.map((selectedType) {
          return DropdownMenuItem<ProductType>(
            child: new Text(
              selectedType.productType,
            ),
            value: selectedType,
          );
        }).toList(),
      ),
    );
  }

  Widget buildProductDropdown() {
    return Obx(() => DropdownButtonFormField(
        decoration: const InputDecoration(
          labelText: ("Product"),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 182, 65, 110),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 74, 195, 102))),
        ),
        items: controller.productTypes.map((selectedType) {
          return DropdownMenuItem<ProductType>(
            child: Text(
              selectedType.productType,
            ),
            value: selectedType,
          );
        }).toList(),
        onChanged: (newValue) {
          controller.selectedProductType.value = newValue as ProductType;
          // setState(() {
          //   controller.selectedProductType.value = newValue as ProductType;
          //   print(newValue);
          // });
        }));
  }

  String newValue = "None";

  Widget buildDropdownButton() {
    // ignore: unnecessary_new
    return new Padding(
      padding: const EdgeInsets.all(24.0),
      // ignore: unnecessary_new
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new ListTile(
            title: const Text('Frosting'),
            trailing: new DropdownButton<String>(
                hint: Text('Choose'),
                onChanged: (changedValue) {
                  newValue = changedValue as String;
                  setState(() {
                    newValue;
                    print(newValue);
                  });
                },
                value: newValue,
                items: <String>['None', 'Chocolate', 'Vanilla', 'ButterCream']
                    .map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }
}
