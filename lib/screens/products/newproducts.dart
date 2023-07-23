import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/controllers/product/products_controller.dart';
import 'package:trader_app/models/generalclass.dart';
import 'package:trader_app/screens/shared_widgets/appbar_eng_view.dart';
import '../../constants/strings.dart';
import '../shared_widgets/title_with_text_form_field.dart';

class NewProduct extends StatefulWidget {
  NewProduct({super.key});

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  final controller = Get.put(AllProductCtrl());

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
          TitleWithTextFormField(
            controller: controller.ctrlProductName,
            titleText: "Product Name",
            isRequired: true,
          ),
          TitleWithTextFormField(
            controller: controller.ctrlNoQuantity,
            titleText: "No Of Quantity",
            isRequired: true,
          ),
          //buildSampleDropdown(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),

          ),
          buildDropdownButton()
        ],
      ),
    );
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
